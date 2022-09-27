import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Dimension.size16),
          color: AppColor.nearlyWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: Dimension.iconSize24,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: Dimension.size5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Họ & Tên',
                        size: Dimension.font14,
                        fontWeight: FontWeight.w500,
                      ),
                      BigText(
                        text: 'Nguyễn Phát Tài',
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
        ),
        SizedBox(
          height: Dimension.size10,
        ),
        Container(
          padding: EdgeInsets.all(Dimension.size16),
          color: AppColor.nearlyWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: Dimension.iconSize24,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: Dimension.size5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Họ & Tên',
                        size: Dimension.font14,
                        fontWeight: FontWeight.w500,
                      ),
                      BigText(
                        text: 'Nguyễn Phát Tài',
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
        ),
        SizedBox(
          height: Dimension.size10,
        ),
        Container(
          padding: EdgeInsets.all(Dimension.size16),
          color: AppColor.nearlyWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: Dimension.iconSize24,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: Dimension.size5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Họ & Tên',
                        size: Dimension.font14,
                        fontWeight: FontWeight.w500,
                      ),
                      BigText(
                        text: 'Nguyễn Phát Tài',
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
        ),
        SizedBox(
          height: Dimension.size10,
        ),
        Container(
          padding: EdgeInsets.all(Dimension.size16),
          color: AppColor.nearlyWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: Dimension.iconSize24,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: Dimension.size5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Họ & Tên',
                        size: Dimension.font14,
                        fontWeight: FontWeight.w500,
                      ),
                      BigText(
                        text: 'Nguyễn Phát Tài',
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
        ),
      ],
    );
  }
}
