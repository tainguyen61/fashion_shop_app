import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/pages/favorite/components/favorite_item.dart';
import 'package:fashion_shop_app/states/favorite_state.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    favoriteState.getFavoriteList();
    return RefreshIndicator(child: ListView.builder(
      itemCount: favoriteState.favoriteList.length,
      itemBuilder: (context, index) {
        ProductModel productItem = favoriteState.favoriteList[index];
        return FavoriteItem(id: productItem.id,
          name: productItem.name,
          rating: productItem.rating,
          sold: productItem.sold,
          sex: productItem.sex,
          price: productItem.price,
          img: productItem.img,
          idcategory: productItem.idcategory,
          describle: productItem.describle,);
      },
    ), onRefresh: (){
      return favoriteState.getFavoriteList();
    });
  }
}
