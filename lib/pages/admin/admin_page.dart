import 'package:fashion_shop_app/pages/admin/components/admin_product_page/admin_product_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: 'ADMIN',color: AppColor.nearlyWhite,),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: Dimension.size10),
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminProductPage(),));
            },
            child: Container(
              padding: EdgeInsets.all(Dimension.size16),
              decoration: BoxDecoration(
                color: AppColor.backgroundGrey
              ),
              child: BigText(text: 'Quản lý sản phẩm',size: Dimension.size16,color: AppColor.nearlyBlack,),
            ),
          ),

        ],
      ),
    );
  }
}
