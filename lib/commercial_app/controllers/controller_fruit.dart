import 'package:anhkhoa_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:get/get.dart';

class ControllerFruit extends GetxController {
  var fruits = <Fruit>[];
  var gh = <GH_Item>[];

  int get slMHGH => gh.length;
  static ControllerFruit get() => Get.find();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _docDL();
  }

  _docDL() async {
    fruits = await FruitSnapshot.getFruits();
    update(["fruits"]);
  }

  void themMHGH(Fruit f) {
    for (var item in gh) {
      if (f.id == item.fruit.id) {
        item.sl++;
        return;
      }
    }

    gh.add(GH_Item(fruit: f, sl: 1));
    update(["gh"]);
  }
}

class BindingsHomeFruitStore extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => ControllerFruit(),
    );
  }
}

class GH_Item {
  Fruit fruit;
  int sl;

  GH_Item({required this.fruit, required this.sl});
}
