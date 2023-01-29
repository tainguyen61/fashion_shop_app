import 'dart:convert';

class ProductModel {
  String id;
  String describle;
  String category;
  List img;
  List color;
  List size;
  String name;
  int price;
  double rating;
  String sex;
  int sold;

  ProductModel(
      {
        required this.id,
        required this.describle,
        required this.category,
        required this.img,
        required this.color,
        required this.size,
        required this.name,
        required this.price,
        required this.rating,
        required this.sex,
        required this.sold});

  ProductModel.fromSnapshot(snapshot)
      : id = snapshot.id,
        describle = snapshot.data()['describle'],
        category = snapshot.data()['category'],
        img = List<String>.from(jsonDecode(snapshot.data()['img'])),
        color = List<String>.from(jsonDecode(snapshot.data()['color'])),
        size = List<String>.from(jsonDecode(snapshot.data()['size'])),
        name = snapshot.data()['name'],
        price = snapshot.data()['price'],
        rating = double.parse(snapshot.data()['rating'].toString()),
        sex = snapshot.data()['sex'],
        sold = snapshot.data()['sold'].toInt();


}
