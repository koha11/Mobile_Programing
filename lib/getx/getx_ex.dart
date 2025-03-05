import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerCounter extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;

  void increase() {
    _counter.value++;
  }

  void decrease() {
    _counter.value--;
  }
}

class PageCounterGetx extends StatelessWidget {
  PageCounterGetx({super.key});
  final controller1 = Get.put(ControllerCounter());
  final controller2 = Get.put(ControllerCounter(), tag: "my tag");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  controller1.decrease();
                },
                child: Text(
                  "-",
                  style: TextStyle(fontSize: 32),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Obx(
                () => Text(
                  "controller 1: ${controller1.counter}",
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            GetX<ControllerCounter>(
              builder: (controller) => Text(
                "controller 1: ${controller.counter}",
                style: TextStyle(fontSize: 32),
              ),
            ),
            GetX<ControllerCounter>(
              tag: "my tag",
              builder: (controller) => Text(
                "controller 2: ${controller.counter}",
                style: TextStyle(fontSize: 32),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller1.increase();
                  controller2.decrease();
                },
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 32),
                ))
          ],
        ),
      ),
    );
  }
}
