import 'package:fashion_shop_app/models/favorite_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:flutter/material.dart';

import '../models/data/sqlite_controller.dart';

class FavoriteState extends ChangeNotifier{
  List<FavoriteProduct> favoriteList = [];
  SQLiteController sqLiteController;

  void getListFavoriteProduct() async {
    favoriteList.clear();
    favoriteList = await sqLiteController.favoriteProduct();
    notifyListeners();
  }

  void getListFavoriteProductFirstTime() async {
    await sqLiteController.initializaDatabase();
    getListFavoriteProduct();
    notifyListeners();
  }

  FavoriteState({required this.favoriteList,required this.sqLiteController});
}
final favoriteState = FavoriteState(favoriteList: <FavoriteProduct>[],sqLiteController: SQLiteController());