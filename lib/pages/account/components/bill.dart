import 'package:fashion_shop_app/pages/account/components/components/my_bill.dart';
import 'package:fashion_shop_app/pages/login/login_page.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimension.size16, vertical: Dimension.size16),
      width: double.infinity,
      color: AppColor.nearlyWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: 'Đơn hàng của tôi',
                size: Dimension.font16,
                fontWeight: FontWeight.w500,
              ),
              InkWell(
                onTap: () async {
                  userState.userInfo.isEmpty ?
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      const LoginPage(),
                    ),
                  )
                      : Navigator.push(context, MaterialPageRoute(builder: (context) => MyBill(index: 0),));
                },
                child: BigText(
                  text: 'Xem lịch sử',
                  size: Dimension.font14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.nearlyBlue,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimension.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async{
                    userState.userInfo.isEmpty ?
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const LoginPage(),
                      ),
                    )
                    : Navigator.push(context, MaterialPageRoute(builder: (context) => MyBill(index: 1),));
                  },
                  child: Container(
                    width: Dimension.size80,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(Dimension.size5),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue,
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20)),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColor.nearlyBlue,
                              size: Dimension.iconSize32,
                            )),
                        BigText(
                          text: 'Đang xử lý',
                          size: Dimension.font12,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    userState.userInfo.isEmpty ?
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const LoginPage(),
                      ),
                    )
                    : Navigator.push(context, MaterialPageRoute(builder: (context) => MyBill(index: 2),));
                  },
                  child: Container(
                    width: Dimension.size80,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(Dimension.size5),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue,
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20)),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColor.nearlyBlue,
                              size: Dimension.iconSize32,
                            )),
                        BigText(
                          text: 'Đang vận chuyển',
                          size: Dimension.font12,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    userState.userInfo.isEmpty ?
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const LoginPage(),
                      ),
                    )
                        : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBill(index: 3),
                        ));
                  },
                  child: Container(
                    width: Dimension.size80,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(Dimension.size5),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue,
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20)),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColor.nearlyBlue,
                              size: Dimension.iconSize32,
                            )),
                        BigText(
                          text: 'Đã giao',
                          size: Dimension.font12,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    userState.userInfo.isEmpty ?
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const LoginPage(),
                      ),
                    )
                        : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBill(index: 4),
                        ));
                  },
                  child: Container(
                    width: Dimension.size80,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(Dimension.size5),
                            decoration: BoxDecoration(
                                color: AppColor.lightBlue,
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20)),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColor.nearlyBlue,
                              size: Dimension.iconSize32,
                            )),
                        BigText(
                          text: 'Đã hủy',
                          size: Dimension.font12,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
