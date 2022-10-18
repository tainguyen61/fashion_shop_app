import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/states/bill_state.dart';
import 'package:fashion_shop_app/states/panel_state.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:fashion_shop_app/pages/cart/cart_page.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/states/category_state.dart';
import 'package:fashion_shop_app/pages/home_page/components/category/list_category.dart';
import 'package:fashion_shop_app/pages/home_page/components/deal/deal_list.dart';
import 'package:fashion_shop_app/pages/home_page/components/panel/panel_list.dart';
import 'package:fashion_shop_app/pages/home_page/components/product/product_list.dart';
import 'package:fashion_shop_app/pages/product/product_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGrey,
      appBar: CustomAppBar(
        statusBarColor: Colors.transparent,
        elevation: 0,
        backgroundColor: AppColor.yellow,
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
            ),
          ),
          Cart(),
        ],
        title: ClipRRect(
          borderRadius: BorderRadius.circular(Dimension.radius5),
          child: Container(
            height: Dimension.size45,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: Dimension.size10),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: AppColor.grey,
                ),
                border: InputBorder.none,
                hintText: 'Bạn tìm gì hôm nay?',
                // hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 12),
                // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          categoryState.getCategoryList();
          panelState.getCategoryList();
          productState.getProductList();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoryList(),
              SizedBox(
                height: Dimension.size10,
              ),
              PanelList(),
              // SizedBox(
              //   height: Dimension.size10,
              // ),
              // DealList(),
              SizedBox(
                height: Dimension.size10,
              ),
              Container(
                padding: EdgeInsets.all(Dimension.size15),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.nearlyWhite,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: 'Phổ biến',
                      size: Dimension.font14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.nearlyBlue,
                    ),
                    BigText(
                      text: 'Bán chạy',
                      size: Dimension.font14,
                      fontWeight: FontWeight.w500,
                    ),
                    BigText(
                      text: 'Hàng mới',
                      size: Dimension.font14,
                      fontWeight: FontWeight.w500,
                    ),
                    BigText(
                      text: 'Giá',
                      size: Dimension.font14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              ProductList(),
            ],
          ),
        ),
      )
    );
  }
}
