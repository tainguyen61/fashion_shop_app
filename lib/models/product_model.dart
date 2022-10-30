import 'dart:convert';

class ProductModel {
  String id;
  String describle;
  String idcategory;
  List img;
  String name;
  int price;
  double rating;
  String sex;
  int sold;

  ProductModel(
      {
        required this.id,
        required this.describle,
        required this.idcategory,
        required this.img,
        required this.name,
        required this.price,
        required this.rating,
        required this.sex,
        required this.sold});

  ProductModel.fromSnapshot(snapshot)
      : id = snapshot.id,
        describle = snapshot.data()['describle'],
        idcategory = snapshot.data()['idcategory'],
        img = List<String>.from(jsonDecode(snapshot.data()['img'])),
        name = snapshot.data()['name'],
        price = snapshot.data()['price'],
        rating = snapshot.data()['rating'],
        sex = snapshot.data()['sex'],
        sold = snapshot.data()['sold'].toInt();


}
