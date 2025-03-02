import 'package:flutter/material.dart';

class PageListView extends StatelessWidget {
  const PageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My List View"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var itemData = data[index];

            return ListTile(
              leading: Text(
                "${index + 1}. ",
                style: TextStyle(fontSize: 24),
              ),
              title: Text(
                itemData.ten,
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "Trai cay Viet nhap",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
              ),
              trailing: Text(
                "${itemData.gia} VND",
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Ban da tap chon san pham ${itemData.ten}"),
                  duration: Duration(seconds: 1),
                ));
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
                thickness: 1.5,
              ),
          itemCount: data.length),
    );
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
