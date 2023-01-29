import 'package:fashion_shop_app/models/bill_detail_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';

class CartItemModel{
  final BillDetailItem productModel;
  bool isChecked;
  int count;
  CartItemModel({required this.productModel, this.isChecked = false, this.count = 1});

  get subTotal => productModel.price*count;
}