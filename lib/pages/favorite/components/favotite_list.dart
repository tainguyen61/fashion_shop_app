import 'package:fashion_shop_app/models/favorite_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/pages/favorite/components/favorite_item.dart';
import 'package:fashion_shop_app/states/favorite_state.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    favoriteState.getListFavoriteProductFirstTime();
    List tempimg = ['img'];
    // favoriteState.sqLiteController.insertProduct(ProductModel(
    //     id: 'id',
    //     describle: 'describle',
    //     idcategory: 'idcategory',
    //     img: tempimg,
    //     name: 'name',
    //     price: 10000,
    //     rating: 2,
    //     sex: 'sex',
    //     sold: 2));
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: favoriteState.favoriteList.length,
          itemBuilder: (context, index) {
            FavoriteProduct productItem = favoriteState.favoriteList[index];
            return FavoriteItem(
              id: productItem.id,
              name: productItem.name,
              price: productItem.price,
              img: productItem.img,
              describle: productItem.describle,
            );
          },
        ),
        onRefresh: () async {
          return favoriteState.getListFavoriteProduct();
        });
  }
}
