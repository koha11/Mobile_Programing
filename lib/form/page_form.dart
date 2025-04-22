import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageForm extends StatelessWidget {
  PageForm({super.key});

  final controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GetBuilder(
        init: controller,
        id: "1",
        builder: (controller) => Form(
          child: TextField(
            controller: controller.txtTest,
            onChanged: (value) => controller.refresh(),
          ),
        ),
      ),
    );
  }
}

class FormController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    txtTest = TextEditingController();
  }

  late TextEditingController txtTest;

  @override
  void refresh() {
    update(["1"]);
  }
}
