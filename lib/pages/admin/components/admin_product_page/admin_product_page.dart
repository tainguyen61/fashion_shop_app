import 'package:fashion_shop_app/pages/admin/components/admin_product_page/components/admin_product_list.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

import 'components/admin_product_add.dart';

class AdminProductPage extends StatelessWidget {
  const AdminProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BigText(text: 'Sản phẩm',color: AppColor.nearlyWhite,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimension.size16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: 'Bộ lọc: ',size: Dimension.size16,),
                  Container(
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   width: 1,
                      //   color: AppColor.grey
                      // ),
                      borderRadius: BorderRadius.circular(Dimension.radius5)
                    ),
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminProductAdd(),));
                        },
                        child: BigText(text: 'thêm sản phẩm',size: Dimension.size16,color: AppColor.nearlyBlue,)),
                  )
                ],
              ),
            ),
            AdminProductList(),
          ],
        ),
      ),
    );
  }
}
