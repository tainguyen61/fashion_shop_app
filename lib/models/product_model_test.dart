class ProductTestModel {
  String describle;
  String idcategory;
  String img;
  String name;
  String price;
  double rating;
  String sex;
  int sold;

  ProductTestModel(
      {required this.describle,
      required this.idcategory,
      required this.img,
      required this.name,
      required this.price,
      required this.rating,
      required this.sex,
      required this.sold});

  ProductTestModel.fromSnapshot(snapshot)
      : describle = snapshot.data()['describle'],
        idcategory = snapshot.data()['idcategory'],
        img = snapshot.data()['img'],
        name = snapshot.data()['name'],
        price = snapshot.data()['price'],
        rating = snapshot.data()['rating'],
        sex = snapshot.data()['sex'],
        sold = snapshot.data()['sold'];
}
