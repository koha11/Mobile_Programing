import 'package:flutter/material.dart';

class PageUserInfo extends StatefulWidget {
  const PageUserInfo({super.key});

  @override
  State<PageUserInfo> createState() => _PageUserInfoState();
}

class _PageUserInfoState extends State<PageUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User info"),
      ),
    );
  }
}
