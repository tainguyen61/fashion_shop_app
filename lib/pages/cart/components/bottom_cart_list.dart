import 'package:fashion_shop_app/pages/cart/data/cart_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomCartList extends StatelessWidget {
  const BottomCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.size80,
      padding: EdgeInsets.symmetric(horizontal: Dimension.size16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: AppColor.mediumGrey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: 'Tổng cộng',
                  size: Dimension.font14,
                ),
                Consumer<CartState>(builder: (context, value, child) {
                  return BigText(
                    text: NumberFormat.simpleCurrency(locale: 'vi-VN').format(cartState.getTotalPrice),
                    color: AppColor.red,
                    size: Dimension.font20,
                    fontWeight: FontWeight.w700,
                  );
                },)
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius5),
                color: AppColor.red,
              ),
              height: Dimension.size50,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Consumer<CartState>(
                builder: (context, value, child) {
                  return BigText(
                    text: 'Mua hàng (${cartState.getCountChecked})',
                    size: Dimension.font18,
                    color: AppColor.nearlyWhite,
                    maxLine: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              )
            ),
          ),
        ],
      ),
    );
  }
}
