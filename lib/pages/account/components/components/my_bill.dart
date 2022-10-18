import 'package:fashion_shop_app/pages/account/components/components/all_bill_page.dart';
import 'package:fashion_shop_app/pages/account/components/components/delivered_page.dart';
import 'package:fashion_shop_app/pages/account/components/components/delivering_page.dart';
import 'package:fashion_shop_app/pages/account/components/components/procressing_page.dart';
import 'package:fashion_shop_app/pages/account/components/components/cancel_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class MyBill extends StatefulWidget {
  const MyBill({Key? key}) : super(key: key);

  @override
  State<MyBill> createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 5,
      vsync: this,
    );
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Đơn hàng của bạn'),
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                color: AppColor.nearlyWhite,
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size10),
                        child: BigText(
                          text: 'Tất cả đơn',
                          color: AppColor.deactivatedText,
                          fontWeight: FontWeight.w700,
                          size: Dimension.size16,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size10),
                        child: BigText(
                          text: 'Đang xử lý',
                          color: AppColor.deactivatedText,
                          fontWeight: FontWeight.w700,
                          size: Dimension.size16,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size10),
                        child: BigText(
                          text: 'Đang vận chuyển',
                          color: AppColor.deactivatedText,
                          fontWeight: FontWeight.w700,
                          size: Dimension.size16,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size10),
                        child: BigText(
                          text: 'Đã giao',
                          color: AppColor.deactivatedText,
                          fontWeight: FontWeight.w700,
                          size: Dimension.size16,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size10),
                        child: BigText(
                          text: 'Đã hủy',
                          color: AppColor.deactivatedText,
                          fontWeight: FontWeight.w700,
                          size: Dimension.size16,
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  AllBillPage(),
                  ProcessingPage(),
                  DeliveringPage(),
                  DeliveredPage(),
                  CancelPage(),
                ]),
              ),
            ],
          )),
    );
  }
}
