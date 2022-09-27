import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class DealItem extends StatelessWidget {
  const DealItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            margin:
            EdgeInsets.only(right: Dimension.size10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
              BorderRadius.circular(Dimension.radius10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: Dimension.size10,
                top: Dimension.size5),
            child: BigText(
              text: 'Mua ngay',
              size: Dimension.font14,
            ),
          ),
        ],
      ),
    );
  }
}
