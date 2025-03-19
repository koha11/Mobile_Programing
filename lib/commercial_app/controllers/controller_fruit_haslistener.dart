import 'package:anhkhoa_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:get/get.dart';

class ControllerFruit2 extends GetxController {
  // var fruits = <Fruit>[];
  Map<int, Fruit> _maps = {};
  var gh = <GH_Item>[];

  int get slMHGH => gh.length;
  static ControllerFruit2 get() => Get.find();
  Iterable<Fruit> get fruits => _maps.values;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();

    // fruits = await FruitSnapshot.getFruits();

    _maps = await FruitSnapshot.getMapFruits();
    update(["fruits"]);
    FruitSnapshot.listenFruitchange(
      _maps,
      updateUI: () => update(["fruits"]),
    );
  }

  // _docDL() async {
  //   // fruits = await FruitSnapshot.getFruits();
  //   update(["fruits"]);
  // }

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
      () => ControllerFruit2(),
    );
  }
}

class GH_Item {
  Fruit fruit;
  int sl;

  GH_Item({required this.fruit, required this.sl});
}
