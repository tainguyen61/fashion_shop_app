import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class ProductDescribe extends StatelessWidget {
  String describe;
  ProductDescribe({Key? key,required this.describe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimension.size16),
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: 'Mô Tả Sản Phẩm',
            size: Dimension.font16,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          BigText(
            text: describe,
            size: Dimension.font14,
            overflow: TextOverflow.ellipsis,
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
