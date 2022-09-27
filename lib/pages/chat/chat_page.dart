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
          backgroundColor: AppColor.nearlyBlue,
          statusBarColor: AppColor.nearlyBlue,
          centerTitle: true,
          title: BigText(
            text: 'FShop',
            color: AppColor.nearlyWhite,
          ),
          elevation: .5,
          action: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ]),
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
