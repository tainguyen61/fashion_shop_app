import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/account/components/bill.dart';
import 'package:fashion_shop_app/pages/account/components/user_card.dart';
import 'package:fashion_shop_app/pages/account/components/user_info.dart';
import 'package:fashion_shop_app/pages/home_page/data/homeState.dart';
import 'package:fashion_shop_app/pages/login/login_page.dart';
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
          Cart(),
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
            InkWell(
              onTap: (){
                homeState.logout();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: Dimension.size10),
                margin: EdgeInsets.symmetric(horizontal: Dimension.size16,vertical: Dimension.size16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius5),
                  border: Border.all(
                    width: 1,
                    color: AppColor.red,
                  ),
                ),
                child: BigText(text: 'Đăng xuất',color: AppColor.red,size: Dimension.font18,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

