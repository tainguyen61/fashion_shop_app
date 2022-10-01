import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/product_model_test.dart';
import 'package:flutter/material.dart';

class ProductState extends ChangeNotifier{
  List<ProductTestModel> productList = [];

  void getProductList() async {
    var data = await FirebaseFirestore.instance.collection('products').get();
    productList = List.from(data.docs.map((doc) => ProductTestModel.fromSnapshot(doc)));
    notifyListeners();
  }


  ProductState({required this.productList});
}

final productState = ProductState(productList: <ProductTestModel>[]);