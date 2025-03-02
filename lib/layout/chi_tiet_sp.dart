import 'package:flutter/material.dart';

class PageChiTiet extends StatefulWidget {
  const PageChiTiet({super.key});

  @override
  State<PageChiTiet> createState() => _PageChiTietState();
}

class _PageChiTietState extends State<PageChiTiet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiet SP"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop("Bye");
            },
            child: Text("Go back")),
      ),
    );
  }
}
