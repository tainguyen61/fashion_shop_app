import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColor.nearlyWhite,
        statusBarColor: AppColor.nearlyWhite,
        title: BigText(text: 'FShop'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.nearlyBlack,
          ),
        ),
        elevation: .5,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Dimension.size10),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(Dimension.radius5),
          child: Container(
            height: Dimension.size45,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.send),
                contentPadding: EdgeInsets.only(
                    left: Dimension.size10,
                    top: Dimension.size10,
                    bottom: Dimension.size10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColor.grey),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(Dimension.size5),
                  // ),
                ),
                border: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(Dimension.size5),
                    // ),
                    ),
                hintText: 'Nhập nội dung chat...',
                // hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 12),
                // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
