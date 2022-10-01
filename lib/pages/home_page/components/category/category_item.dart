import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String name;
  CategoryItem({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: Dimension.size10,
              horizontal: Dimension.size10),
          child: BigText(
            text: name,
            size: Dimension.font14,
            color: AppColor.nearlyBlack,
          )),
    );
  }
}
