import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/cart/components/bottom_cart_list.dart';
import 'package:fashion_shop_app/pages/cart/components/cart_list.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: BigText(
          text: 'Giỏ Hàng',
          color: AppColor.nearlyWhite,
        ),
        backgroundColor: AppColor.nearlyBlue,
        elevation: 1,
        statusBarColor: AppColor.nearlyBlue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
        child: CartList(),
      ),
      bottomNavigationBar: BottomCartList(),
    );
  }
}
