import 'package:anhkhoa_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page_chitiet_fruit.dart';

class PageFruitStream extends StatelessWidget {
  const PageFruitStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Stream"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder(
        stream: FruitSnapshot.getFruitStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Loading ...")
                ],
              ),
            );
          }

          var fruits = snapshot.data!.toList();

          return GridView.extent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            childAspectRatio: 0.75,
            children: fruits
                .map(
                  (fruit) => GridTile(
                      child: GestureDetector(
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              fruit.anh ?? "",
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) =>
                                  Column(children: [
                                Icon(
                                  Icons.image,
                                  size: 140,
                                ),
                                Text(
                                  "No Image Available !!!",
                                  style: TextStyle(fontSize: 20),
                                )
                              ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          fruit.ten,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${fruit.gia} VNĐ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Get.to(PageChitietFruit(fruit: fruit)),
                  )),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
