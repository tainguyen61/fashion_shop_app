import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductState extends ChangeNotifier{
  List<ProductModel> productList = [];

  Future getProductList() async {
    var data = await FirebaseFirestore.instance.collection('products').get();
    productList = List.from(data.docs.map((doc) => ProductModel.fromSnapshot(doc)));
    notifyListeners();
  }




  ProductState({required this.productList});

}

final productState = ProductState(productList: <ProductModel>[]);