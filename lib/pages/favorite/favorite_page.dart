import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: BigText(text: 'Yêu Thích',color: AppColor.nearlyWhite,),
        backgroundColor: AppColor.nearlyBlue,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded),),
        elevation: 1,
        statusBarColor: AppColor.nearlyBlue,
        action: [
          IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),]
      ),
    );
  }
}
