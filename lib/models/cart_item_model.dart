import 'package:fashion_shop_app/models/product_model.dart';

class CartItemModel{
  final ProductModel productModel;
  bool isChecked;
  int count;
  CartItemModel({required this.productModel, this.isChecked = false, this.count = 1});

  get subTotal => productModel.price*count;
}