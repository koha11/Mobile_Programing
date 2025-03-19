import 'dart:math';

// import 'package:anhkhoa_flutter_app/commercial_app/controllers/controller_fruit.dart';
import 'package:anhkhoa_flutter_app/commercial_app/controllers/controller_fruit_haslistener.dart';
import 'package:anhkhoa_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class PageChitietFruit extends StatelessWidget {
  PageChitietFruit({super.key, required this.fruit});

  Fruit fruit;

  @override
  Widget build(BuildContext context) {
    double rating = getRating();

    return Scaffold(
      appBar: AppBar(
        title: Text("${fruit.ten}"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GetBuilder(
            init: ControllerFruit2.get(),
            id: "gh",
            builder: (controller) => badges.Badge(
              showBadge: controller.slMHGH > 0,
              badgeContent: Text(
                "${controller.slMHGH}",
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.shopping_cart),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Image.network(fruit.anh ?? "Default Link"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                fruit.ten,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${fruit.gia} VNĐ",
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${((fruit.gia ?? 0) * 1.2).round()} VNĐ",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                fruit.moTa ?? "",
                style: TextStyle(fontSize: 22),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    rating.toStringAsFixed(2),
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${Random().nextInt(10000)} đánh giá",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ControllerFruit2.get().themMHGH(fruit);
        },
        child: Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}

double getRating() {
  return Random().nextInt(201) / 100 + 3;
}
