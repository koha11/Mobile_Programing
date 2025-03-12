class Fruit {
  int id;
  int? gia;
  String ten;
  String? moTa, anh;

  Fruit({required this.id, this.gia, required this.ten, this.moTa, this.anh});
}

class FruitSnapshot {
  static List<Fruit> getALL() {
    return data;
  }
}

final data = <Fruit>[
  Fruit(
      id: 1,
      ten: "Dâu tây",
      gia: 30000,
      moTa: "Dâu tây ngon lành",
      anh:
          "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 2,
      ten: "Chuối",
      gia: 20000,
      moTa: "Chuối vàng khè",
      anh:
          "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 3,
      ten: "Bơ",
      gia: 27000,
      moTa: "Bơ luôn",
      anh:
          "https://images.unsplash.com/photo-1704960961383-67dd63756199?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 4,
      ten: "Thơm",
      gia: 32000,
      moTa: "Thơm má",
      anh:
          "https://images.unsplash.com/photo-1490885578174-acda8905c2c6?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 5,
      ten: "Chanh",
      gia: 14000,
      moTa: "Lẻmon",
      anh:
          "https://images.unsplash.com/photo-1534531173927-aeb928d54385?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 6,
      ten: "Măng xôi",
      gia: 28000,
      moTa: "Ngon",
      anh:
          "https://images.unsplash.com/photo-1577003833619-76bbd7f82948?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 7,
      ten: "Việt quất",
      gia: 50000,
      moTa: "Việt ơi đừng quất",
      anh:
          "https://images.unsplash.com/photo-1425934398893-310a009a77f9?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 8,
      ten: "Táo",
      gia: 22000,
      moTa: "Ba quả táo",
      anh:
          "https://images.unsplash.com/photo-1533893662125-43c54ffa3b41?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 9,
      ten: "Cherry",
      gia: 43000,
      moTa: "Cherry Cherry lady",
      anh:
          "https://images.unsplash.com/photo-1528373553865-c5d96fe764f1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Fruit(
      id: 10,
      ten: "Thanh Long",
      gia: 27000,
      moTa: "Long ơi là Long",
      anh:
          "https://images.unsplash.com/photo-1585138774489-caf6e48633b5?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
];
