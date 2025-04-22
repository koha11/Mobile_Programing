import 'package:anhkhoa_flutter_app/commercial_app/admin_pages/fruits_page_admin.dart';
import 'package:anhkhoa_flutter_app/commercial_app/app_fruit_store.dart';
import 'package:anhkhoa_flutter_app/commercial_app/page_fruit_stream.dart';
import 'package:anhkhoa_flutter_app/form/page_form.dart';
import 'package:anhkhoa_flutter_app/getx/getx_ex.dart';
import 'package:anhkhoa_flutter_app/getx/getx_simple_state_management.dart';
import 'package:anhkhoa_flutter_app/json_list/page_album.dart';
import 'package:anhkhoa_flutter_app/layout/grid_view_example.dart';
import 'package:anhkhoa_flutter_app/layout/list_view_example.dart';
import 'package:anhkhoa_flutter_app/profile/page_profile.dart';
import 'package:anhkhoa_flutter_app/rss/pages/page_rss.dart';
import 'package:anhkhoa_flutter_app/url_handler/PageCallPhone.dart';
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
                destination: PageSimpleState()),
            buildButton(context, title: "GetX App", destination: GetXApp()),
            buildButton(context,
                title: "Fruit Store App", destination: AppFruitStore()),
            buildButton(context, title: "JSON Album", destination: PageAlbum()),
            buildButton(context, title: "Page RSS", destination: PageRss()),
            buildButton(context,
                title: "Page Fruit Stream", destination: PageFruitStream()),
            buildButton(context, title: "Page Form", destination: PageForm()),
            buildButton(context,
                title: "Call Phone", destination: PageCallPhone()),
            buildButton(context,
                title: "Page Fruit Admin", destination: PageFruitsAdmin()),
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
