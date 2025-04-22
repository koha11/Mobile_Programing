import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/fruit.model.dart';
import '../supabase_helper.dart';

class PageAddFruit extends StatefulWidget {
  const PageAddFruit({super.key});

  @override
  State<PageAddFruit> createState() => _PageAddFruitState();
}

class _PageAddFruitState extends State<PageAddFruit> {
  XFile? xFile;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Fruit"),
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
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
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
                    if (xFile != null) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Đang thêm ${txtTen.text} ..."),
                        duration: Duration(seconds: 5),
                      ));

                      var imageUrl = await uploadImage(
                          image: File(xFile!.path),
                          bucket: "images",
                          path: "fruits/Fruit_${txtId.text}.jpg");

                      Fruit fruit = Fruit(
                          id: int.parse(txtId.text),
                          ten: txtTen.text,
                          anh: imageUrl,
                          gia: int.parse(txtGia.text),
                          moTa: txtMoTa.text);

                      FruitSnapshot.insert(fruit);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Đã thêm ${txtTen.text} ..."),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  },
                  child: Text("Thêm")),
            ],
          ),
        ),
      ),
    );
  }
}
