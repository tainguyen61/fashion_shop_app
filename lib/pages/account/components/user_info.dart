import 'package:fashion_shop_app/components/custom_card_title.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List title = ['Họ & Tên', 'Số điện thoại', 'Email', 'Địa chỉ'];
    List icon = ['person', 'phone', 'email', 'place'];
    return Consumer<UserState>(builder: (context, value, child) {
      return userState.userInfo.isEmpty ? Container() : Column(
        children: [
          CustomCardTitle(
            title: 'Họ & Tên',
            subTitle: userState.userInfo[0].name,
            icon: Icon(
              Icons.person,
              size: Dimension.iconSize24,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          CustomCardTitle(
            title: 'Số điện thoại',
            subTitle: userState.userInfo[0].phone,
            icon: Icon(
              Icons.phone,
              size: Dimension.iconSize24,
              color: Colors.grey,
            ),
          ),
          CustomCardTitle(
            title: 'Email',
            subTitle: userState.userInfo[0].email,
            icon: Icon(
              Icons.email,
              size: Dimension.iconSize24,
              color: Colors.grey,
            ),
          ),CustomCardTitle(
            title: 'Địa chỉ',
            subTitle: userState.userInfo[0].address,
            icon: Icon(
              Icons.place,
              size: Dimension.iconSize24,
              color: Colors.grey,
            ),
          ),
        ],
      );
    },);
  }
}
