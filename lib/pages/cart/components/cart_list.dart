import 'package:fashion_shop_app/models/cart_item_model.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:fashion_shop_app/pages/cart/components/cart_item.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (context, value, child) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cartState.cartList.length,
          itemBuilder: (context, index) {
            CartItemModel cartItem = cartState.cartList.elementAt(index);
            return
              CartItem(
              index: index,
              id: cartItem.productModel.productId,
              img: cartItem.productModel.img,
              name: cartItem.productModel.name,
              // price: cartItem.productModel.price,
              isChecked: cartItem.isChecked,
              count: cartItem.count,
                price: cartItem.productModel.price,
            );
          },
        );
      },
    );
  }
}
