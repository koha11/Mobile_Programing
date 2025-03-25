// import 'package:anhkhoa_flutter_app/commercial_app/controllers/controller_fruit.dart';
import 'package:anhkhoa_flutter_app/commercial_app/controllers/controller_fruit_haslistener.dart';
import 'package:anhkhoa_flutter_app/commercial_app/page_chitiet_fruit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class AppFruitStore extends StatelessWidget {
  const AppFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "64CNTT Fruit",
      initialBinding: BindingsHomeFruitStore(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageHomeFruitStore(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageHomeFruitStore extends StatelessWidget {
  const PageHomeFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store"),
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
      body: GetBuilder(
        init: ControllerFruit2.get(),
        id: "fruits",
        builder: (controller) {
          var fruits = controller.fruits;
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
                              fruit.anh ?? "Link default",
                              fit: BoxFit.fill,
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
