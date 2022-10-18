import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class CustomCardTitle extends StatelessWidget {
  List<Widget> content;
  Icon icon;
  Icon? leadingIcon;
  CustomCardTitle({Key? key,required this.content , required this.icon, this.leadingIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.size16),
      color: AppColor.nearlyWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon.icon,
                ),
                SizedBox(
                  width: Dimension.size5,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: content,
                    // [

                      // BigText(
                      //   text: title,
                      //   size: Dimension.font14,
                      //   fontWeight: FontWeight.w500,
                      // ),
                      // BigText(
                      //   text: subTitle,
                      //   size: Dimension.font16,
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLine: 1,
                      // ),
                    // ],
                  ),
                ),
              ],
            ),
          ),
          leadingIcon != null ? Icon(leadingIcon!.icon) : Container(),
        ],
      ),
    );
  }
}
