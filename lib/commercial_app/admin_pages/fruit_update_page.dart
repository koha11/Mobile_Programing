import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/dialogs.dart';
import '../models/fruit.model.dart';
import '../supabase_helper.dart';

class PageUpdateFruit extends StatefulWidget {
  PageUpdateFruit({super.key, required this.fruit});
  Fruit fruit;

  @override
  State<PageUpdateFruit> createState() => _PageUpdateFruitState();
}

class _PageUpdateFruitState extends State<PageUpdateFruit> {
  XFile? xFile;
  String? imageUrl;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Fruit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                child: xFile == null
                    ? Image.network(widget.fruit.anh ?? "Link mac dinh")
                    : Image.file(File(xFile!.path)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        var imagePicker = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);

                        if (imagePicker != null) {
                          setState(() {
                            xFile = imagePicker;
                          });
                        }
                      },
                      child: Text("Chọn ảnh")),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              TextField(
                controller: txtId,
                readOnly: true,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: InputDecoration(labelText: "Id"),
              ),
              TextField(
                controller: txtTen,
                decoration: InputDecoration(labelText: "Tên"),
              ),
              TextField(
                controller: txtGia,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: InputDecoration(labelText: "Giá"),
              ),
              TextField(
                controller: txtMoTa,
                decoration: InputDecoration(labelText: "Mô tả"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    Fruit fruit = widget.fruit;

                    showSnackBar(context,
                        msg: "Đang Cập nhật ${fruit.ten} ...", second: 10);

                    if (xFile != null) {
                      imageUrl = await uploadImage(
                          image: File(xFile!.path),
                          bucket: "images",
                          path: "fruits/Fruit_${txtId.text}.jpg",
                          upsert: true);

                      fruit.anh = imageUrl;
                    }

                    fruit.ten = txtTen.text;
                    fruit.gia = int.parse(txtGia.text);
                    fruit.moTa = txtMoTa.text;

                    await FruitSnapshot.update(fruit);
                    showSnackBar(context, msg: "Đã cập nhật ${fruit.ten} ...");
                  },
                  child: Text("Cập nhật")),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtId.text = widget.fruit.id.toString();
    txtTen.text = widget.fruit.ten;
    txtGia.text = widget.fruit.gia.toString();
    txtMoTa.text = widget.fruit.moTa ?? "";
  }
}
