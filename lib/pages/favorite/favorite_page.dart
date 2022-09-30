import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/favorite/components/favotite_list.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          centerTitle: true,
          title: BigText(
            text: 'Yêu Thích',
            color: AppColor.nearlyWhite,
          ),
          backgroundColor: AppColor.nearlyBlue,
          elevation: 1,
          statusBarColor: AppColor.nearlyBlue,
          action: [
            Cart(),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
        child: FavoriteList(),
      ),
    );
  }
}
