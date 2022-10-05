import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class CustomCardTitle extends StatelessWidget {
  String title;
  String subTitle;
  Icon icon;
  CustomCardTitle({Key? key,required this.title,required this.subTitle, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.size16),
      color: AppColor.nearlyWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon.icon,
              ),
              SizedBox(
                width: Dimension.size5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: title,
                    size: Dimension.font14,
                    fontWeight: FontWeight.w500,
                  ),
                  BigText(
                    text: subTitle,
                    size: Dimension.font16,
                  )
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            size: Dimension.iconSize32,
            color: AppColor.mediumGrey,
          ),
        ],
      ),
    );
  }
}
