class coffee {
  String img = '';
  String name = '';
  double prc = 0;
  coffee({required this.img, required this.name, required this.prc});
}

class CartItem {
  String name = '';
  double prc = 0;
  String img = '';
  CartItem({required this.name, required this.prc, required img});


  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(name: map['name'], prc: map['price'],img:map['img']);
  }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': prc,
      'img':img
    };
  }
}
