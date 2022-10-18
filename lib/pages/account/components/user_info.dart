import 'package:fashion_shop_app/components/custom_card_title.dart';
import 'package:fashion_shop_app/components/user_update_page.dart';
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
    List content = ['name', 'phone', 'email', 'address'];
    List<Icon> icon = [Icon(Icons.person),Icon(Icons.phone),Icon(Icons.email),Icon(Icons.place),];
    return Consumer<UserState>(
      builder: (context, value, child) {
        return userState.userInfo.isEmpty
            ? Container()
            : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: title.length,
              itemBuilder: (context, index) {
                List userData = [userState.userInfo[0].name,userState.userInfo[0].phone,userState.userInfo[0].email,userState.userInfo[0].address,];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserUpdatePage(
                              title: title[index], content: content[index],userData: userData[index]),
                        ));
                  },
                  child: CustomCardTitle(
                    leadingIcon: Icon(
                      Icons.chevron_right,
                      size: Dimension.iconSize32,
                      color: AppColor.mediumGrey,
                    ),
                    content: [
                      BigText(
                        text: title[index],
                        size: Dimension.font14,
                        fontWeight: FontWeight.w500,
                      ),
                      BigText(
                        text: userData[index],
                        size: Dimension.font16,
                        overflow: TextOverflow.ellipsis,
                        maxLine: 1,
                      ),
                    ],
                    icon: Icon(
                      icon[index].icon,
                      size: Dimension.iconSize24,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            );
      },
    );
  }
}
