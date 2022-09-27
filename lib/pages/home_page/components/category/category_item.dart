import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

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
            text: 'Thời trang nam',
            size: Dimension.font14,
          )),
    );
  }
}
