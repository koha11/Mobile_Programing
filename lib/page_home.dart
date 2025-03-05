import 'package:anhkhoa_flutter_app/getx/getx_ex.dart';
import 'package:anhkhoa_flutter_app/getx/getx_simple_state_management.dart';
import 'package:anhkhoa_flutter_app/layout/grid_view_example.dart';
import 'package:anhkhoa_flutter_app/layout/list_view_example.dart';
import 'package:anhkhoa_flutter_app/profile/page_profile.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            buildButton(context,
                title: "My Profile", destination: PageProfile()),
            buildButton(context,
                title: "My List View", destination: PageListView()),
            buildButton(context,
                title: "My Grid View", destination: PageGridView()),
            buildButton(context,
                title: "My Counter GetX View", destination: PageCounterGetx()),
            buildButton(context,
                title: "My GetX Simple State Management View",
                destination: PageSimpleState())
          ],
        ),
      )),
    );
  }

  Widget buildButton(BuildContext context,
      {required String title, required Widget destination}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
          width: MediaQuery.of(context).size.width * 2 / 3,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => destination));
              },
              child: Text(title))),
    );
  }
}
