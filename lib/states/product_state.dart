import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/favorite_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/states/favorite_state.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:flutter/material.dart';

class ProductState extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<FavoriteModel> favoriteList = [];

  Future getProductList() async {
    var data = await FirebaseFirestore.instance.collection('products').get();
    productList =
        List.from(data.docs.map((doc) => ProductModel.fromSnapshot(doc)));
    notifyListeners();
  }

  addFavorite(String id) async {
    await FirebaseFirestore.instance.collection('users').doc(
        userState.userInfo[0].id).collection('favorite').add({
      'id': id,
    });
    notifyListeners();
  }

  removeFavorite(String id) async {
    await FirebaseFirestore.instance.collection('users').doc(
        userState.userInfo[0].id).collection('favorite').doc(id).delete();
    notifyListeners();
  }

  getIdFavorite(String id){
    for(int i = 0;i<favoriteList.length;i++){
      if(favoriteList[i].id == id){
        return favoriteList[i].idFavorite;
      }
    }
  }

  getFavoriteList() async {
    favoriteList.clear();
    await FirebaseFirestore.instance.collection('users').doc(
        userState.userInfo[0].id).collection('favorite').get().then((
        QuerySnapshot querySnapshot) =>
        querySnapshot.docs.forEach((doc) {
          favoriteList.add(FavoriteModel.fromSnapshot(doc));
        }));
    notifyListeners();
  }

  getStatusFavorite(String id){
    if(favoriteList.isNotEmpty){
      for(int i = 0;i<favoriteList.length;i++){
        if(favoriteList[i].id == id){
          return true;
        }
      }
      return false;
    }else{
      return false;
    }
  }

  ProductState(this.productList);

}

final productState = ProductState(<ProductModel>[]);