import 'package:anhkhoa_flutter_app/layout/chi_tiet_sp.dart';
import 'package:flutter/material.dart';

class PageGridView extends StatefulWidget {
  PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  String image =
      "https://salt.tikicdn.com/cache/525x525/ts/product/d4/07/04/d7893a9961912703ddab3b33e3c022fe.jpg";

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My Grid View"),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "${count}",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.75,
          children: data
              .map((e) => Card(
                    child: GestureDetector(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.network(image),
                            ),
                          ),
                          Text(
                            e.ten,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            e.gia.toString(),
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      onTap: () async {
                        // setState(() {
                        //   ++count;
                        // });
                        String msg =
                            await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PageChiTiet(),
                        ));

                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(msg)));
                      },
                    ),
                  ))
              .toList(),
        ));
  }
}

class SanPham {
  String ten;
  int gia;
  SanPham({required this.ten, required this.gia});
}

var data = [
  SanPham(ten: "Chuối", gia: 25000),
  SanPham(ten: "Bưởi", gia: 30000),
  SanPham(ten: "Cam", gia: 35000),
  SanPham(ten: "Măng cụt", gia: 20000),
  SanPham(ten: "Táo", gia: 15000),
  SanPham(ten: "Dâu", gia: 30000),
  SanPham(ten: "Nho", gia: 55000),
  SanPham(ten: "Dứa", gia: 65000),
  SanPham(ten: "Quýt", gia: 45000),
  SanPham(ten: "Mit", gia: 75000),
  SanPham(ten: "Sầu riêng", gia: 95000)
];
