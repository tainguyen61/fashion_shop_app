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

  Future<ProductModel> getProductDetail(String id) async{
    ProductModel product;
    return await FirebaseFirestore.instance.collection('products').doc(id).get().then((value) {
      product = ProductModel.fromSnapshot(value);
      print('name${product.name}');
      return product;
    });

  }


  ProductState(this.productList);

}

final productState = ProductState(<ProductModel>[]);