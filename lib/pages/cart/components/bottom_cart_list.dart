import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

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
                BigText(
                  text: '8.160.000 đ',
                  color: AppColor.red,
                  size: Dimension.font20,
                  fontWeight: FontWeight.w700,
                ),
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

              child: BigText(text: 'Mua hàng (1)',size: Dimension.font18,color: AppColor.nearlyWhite,maxLine: 1,overflow: TextOverflow.ellipsis,),
            ),
          ),
        ],
      ),
    );
  }
}
