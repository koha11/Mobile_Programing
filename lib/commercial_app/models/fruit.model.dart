import 'package:anhkhoa_flutter_app/commercial_app/supabase_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Fruit {
  int id;
  int? gia;
  String ten;
  String? moTa, anh;

  Fruit({required this.id, this.gia, required this.ten, this.moTa, this.anh});

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
        id: json['id'],
        gia: json['gia'] as int,
        ten: json['ten'],
        moTa: json['moTa'],
        anh: json['anh']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "gia": gia,
      "ten": ten,
      "moTa": moTa,
      "anh": anh,
    };
  }
}

class FruitSnapshot {
  Fruit fruit;

  FruitSnapshot(this.fruit);

  Future<dynamic> update(Fruit newFruit) async {
    final supabase = Supabase.instance.client;
    var data = await supabase
        .from("Fruit")
        .update(newFruit.toJson())
        .eq("id", fruit.id)
        .select();

    return data;
  }

  static Future<void> delete(int fruitId) async {
    final supabase = Supabase.instance.client;

    await supabase.from("Fruit").delete().eq("id", fruitId);

    await removeImage(bucket: "images", path: "fruits/Fruit_$fruitId.jpg");

    return;
  }

  static Future<dynamic> insert(Fruit newFruit) async {
    final supabase = Supabase.instance.client;

    var data = await supabase.from('Fruit').insert(newFruit.toJson());

    return data;
  }

  static Future<List<Fruit>> getFruits() async {
    final supabase = Supabase.instance.client;
    List<Fruit> fruits = [];

    var data = await supabase.from("Fruit").select();

    fruits = data.map((e) => Fruit.fromJson(e)).toList();

    return fruits;
  }

  static Stream<List<Fruit>> getFruitStream() {
    return getDataStream<Fruit>(
        ids: ['id'], fromJson: Fruit.fromJson, table: "Fruit");
  }

  static Future<Map<int, Fruit>> getMapFruits() async {
    return getMapData(
      table: "Fruit",
      fromJson: Fruit.fromJson,
      getId: (t) => t.id,
    );
  }

  static listenFruitchange(Map<int, Fruit> maps, {Function()? updateUI}) async {
    return listenDatachange(maps,
        channel: "Fruit:public",
        schema: "public",
        table: "Fruit",
        fromJson: Fruit.fromJson,
        getId: (t) => t.id,
        updateUI: updateUI);
  }

  // static List<Fruit> getALL() {
  //   return data;
  // }
}
