import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/cart/components/bottom_cart_list.dart';
import 'package:fashion_shop_app/pages/cart/components/cart_list.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool checkedAll = false;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
        userState.checkLogin ? Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimension.size16, vertical: Dimension.size10),
              decoration: const BoxDecoration(
                color: AppColor.nearlyWhite,
              ),
              child: Row(
                children: [
                  Icon(Icons.place,color: AppColor.mediumBlue,),
                  SizedBox(width: Dimension.size5,),
                  Flexible(
                    child: BigText(
                      text: userState.userInfo[0].address,
                      size: Dimension.font16,
                      maxLine: 1,
                      color: AppColor.deactivatedText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ): Container(),
            SizedBox(height: Dimension.size5,),
            Container(
              // padding: EdgeInsets.symmetric(
              //     horizontal: Dimension.size16, vertical: Dimension.size10),
              decoration: const BoxDecoration(
                color: AppColor.nearlyWhite,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: checkedAll,
                    onChanged: (value) {
                      checkedAll = !checkedAll;
                      cartState.checkedAll(checkedAll);
                      setState(() {

                      });
                    },

                  ),
                  SizedBox(width: Dimension.size5,),
                  Flexible(
                    child: Consumer<CartState>(builder: (context, value, child) {
                      return BigText(
                        text: 'Tất cả (${cartState.cartList.length} sản phẩm)',
                        size: Dimension.font16,
                        maxLine: 1,
                        color: AppColor.deactivatedText,
                        overflow: TextOverflow.ellipsis,
                      );
                    },)
                  ),
                ],
              ),
            ),
            CartList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomCartList(),
    );
  }
}
