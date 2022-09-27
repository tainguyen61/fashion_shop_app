import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/account/components/bill.dart';
import 'package:fashion_shop_app/pages/account/components/user_card.dart';
import 'package:fashion_shop_app/pages/account/components/user_info.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      appBar: CustomAppBar(
        backgroundColor: AppColor.nearlyBlue,
        elevation: 0,
        statusBarColor: AppColor.nearlyBlue,
        action: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserCard(),
            SizedBox(
              height: Dimension.size16,
            ),
            Bill(),
            SizedBox(
              height: Dimension.size10,
            ),
            UserInfo(),
          ],
        ),
      ),
    );
  }
}

