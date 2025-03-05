import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerSimpleState extends GetxController {
  int counter = 0;

  static ControllerSimpleState get({String? tag}) =>
      Get.find<ControllerSimpleState>(tag: tag);

  void increase1() {
    counter++;
    update(['01']);
  }

  void increase2() {
    counter++;
    update(["02"]);
  }

  void increaseAll() {
    counter++;
    update(["01", "02"]);
  }
}

class PageSimpleState extends StatelessWidget {
  PageSimpleState({super.key});

  final c = Get.put(ControllerSimpleState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Simple state"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<ControllerSimpleState>(
                id: "01",
                builder: (controller) => Text(
                      "01: ${controller.counter}",
                      style: TextStyle(fontSize: 20),
                    )),
            GetBuilder<ControllerSimpleState>(
                id: "02",
                builder: (controller) => Text(
                      "02: ${controller.counter}",
                      style: TextStyle(fontSize: 20),
                    )),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleState.get().increase1();
                },
                child: Text("Increase 1")),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleState.get().increase2();
                },
                child: Text("Increase 2")),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleState.get().increaseAll();
                },
                child: Text("Increase All"))
          ],
        ),
      ),
    );
  }
}
