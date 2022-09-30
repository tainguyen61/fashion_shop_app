import 'package:fashion_shop_app/pages/cart/cart_page.dart';
import 'package:fashion_shop_app/pages/cart/data/cart_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Color? color;

  Cart({Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(builder: (context, value, child) {
      return cartState.cartList.isEmpty
          ? IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: color,
        ),
      )
          : Stack(
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: color,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: Dimension.size5,
            child: Container(
              padding: EdgeInsets.all(Dimension.size5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.orange,
              ),
              child: BigText(
                text: cartState.cartList.length.toString(),
                size: Dimension.font10,
                color: AppColor.nearlyWhite,
              ),
            ),
          ),
        ],
      );
    },);
  }
}
