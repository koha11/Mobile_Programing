import 'package:anhkhoa_flutter_app/commercial_app/admin_pages/fruit_add_page.dart';
import 'package:anhkhoa_flutter_app/commercial_app/admin_pages/fruit_update_page.dart';
import 'package:anhkhoa_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:anhkhoa_flutter_app/helpers/dialogs.dart';
import 'package:anhkhoa_flutter_app/mywidgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PageFruitsAdmin extends StatelessWidget {
  PageFruitsAdmin({super.key});
  late BuildContext myContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Admin"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<List<Fruit>>(
          stream: FruitSnapshot.getFruitStream(),
          builder: (context, snapshot) {
            myContext = context;
            return AsyncWidget(
              snapshot: snapshot,
              builder: (context, snapshot) {
                var list = snapshot.data! as List<Fruit>;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var fruit = list[index];

                        return Slidable(
                          // Specify a key if the Slidable is dismissible.
                          key: const ValueKey(0),

                          // The end action pane is the one at the right or the bottom side.
                          endActionPane: ActionPane(
                            extentRatio: 0.7,
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                // An action can be bigger than the others.
                                onPressed: (context) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PageUpdateFruit(fruit: fruit),
                                  ));
                                },
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Cập nhật',
                              ),
                              SlidableAction(
                                onPressed: (context) async {
                                  String? xacNhan = await showConfirmDialog(
                                      myContext,
                                      "Bạn có muốn xóa ${fruit.ten}?");

                                  if (xacNhan == "ok") {
                                    FruitSnapshot.delete(fruit.id);
                                    ScaffoldMessenger.of(myContext)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(myContext)
                                        .showSnackBar(SnackBar(
                                            content:
                                                Text("Đã xóa ${fruit.id}")));
                                  }
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_forever,
                                label: 'Xóa',
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    fruit.anh ?? "No image",
                                    fit: BoxFit.fill,
                                    height: 100,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("id: ${fruit.id}"),
                                      Text("Tên: ${fruit.ten}"),
                                      Text("Giá: ${fruit.gia} VNĐ"),
                                      Text("Mô tả: ${fruit.moTa ?? ""}")
                                    ],
                                  )),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                      itemCount: list.length),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageAddFruit(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
