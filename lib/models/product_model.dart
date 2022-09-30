class ProductModel{
  final int id;
  final String img;
  final String name;
  final double price;

  ProductModel({required this.id, required this.img, required this.name, required this.price});
}
List<ProductModel> productionList = [
  for(int i = 0; i<5 ;i++)
    ProductModel(id: i, img: 'assets/images/img1.jpg', name: 'Sản phẩm ${i}', price: 250000),
];