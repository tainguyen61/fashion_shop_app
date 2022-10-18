import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/account/components/bill.dart';
import 'package:fashion_shop_app/pages/account/components/user_card.dart';
import 'package:fashion_shop_app/pages/account/components/user_info.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/pages/login/login_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow
      appBar: CustomAppBar(
        backgroundColor: AppColor.nearlyBlue,
        elevation: 0,
        statusBarColor: AppColor.nearlyBlue,
        title: BigText(text: 'Tài khoản',color: AppColor.nearlyWhite,size: Dimension.font18,),
        centerTitle: true,
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
            Consumer<UserState>(builder: (context, value, child) {
              return userState.checkLogin ? InkWell(
                onTap: (){
                  userState.logout();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: Dimension.size5),
                  margin: EdgeInsets.symmetric(horizontal: Dimension.size16,vertical: Dimension.size16),
                  decoration: BoxDecoration(
                    color: AppColor.nearlyWhite,
                    borderRadius: BorderRadius.circular(Dimension.radius5),
                    border: Border.all(
                      width: 1,
                      color: AppColor.red,
                    ),
                  ),
                  child: BigText(text: 'Đăng xuất',color: AppColor.red,size: Dimension.font18,),
                ),
              ) : Container();
            },)
          ],
        ),
      ),
    );
  }
}

