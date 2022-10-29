import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:flutter/material.dart';

class FavoriteState extends ChangeNotifier{
  List<ProductModel> favoriteList = [];

  getFavoriteList() async{
    favoriteList.clear();
    for(int i = 0;i<productState.productList.length;i++){
      for(int j = 0; j<productState.favoriteList.length;j++){
        if(productState.productList[i].id == productState.favoriteList[j].id){
          favoriteList.add(productState.productList[i]);
        }
      }
    }
  }


  FavoriteState(this.favoriteList);
}
final favoriteState = FavoriteState(<ProductModel>[]);