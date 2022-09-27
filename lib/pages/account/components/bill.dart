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
              BigText(
                text: 'Xem lịch sử',
                size: Dimension.font14,
                fontWeight: FontWeight.w500,
                color: AppColor.nearlyBlue,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimension.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Dimension.size80,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(Dimension.size5),
                          decoration: BoxDecoration(
                              color: AppColor.lightBlue,
                              borderRadius: BorderRadius.circular(
                                  Dimension.radius20)),
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColor.nearlyBlue,
                            size: Dimension.iconSize32,
                          )),
                      BigText(
                        text: 'Chờ thanh toán',
                        size: Dimension.font12,
                        maxLine: 2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  width: Dimension.size80,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(Dimension.size5),
                          decoration: BoxDecoration(
                              color: AppColor.lightBlue,
                              borderRadius: BorderRadius.circular(
                                  Dimension.radius20)),
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColor.nearlyBlue,
                            size: Dimension.iconSize32,
                          )),
                      BigText(
                        text: 'Đăng xử lý',
                        size: Dimension.font12,
                        maxLine: 2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  width: Dimension.size80,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(Dimension.size5),
                          decoration: BoxDecoration(
                              color: AppColor.lightBlue,
                              borderRadius: BorderRadius.circular(
                                  Dimension.radius20)),
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
                Container(
                  width: Dimension.size80,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(Dimension.size5),
                          decoration: BoxDecoration(
                              color: AppColor.lightBlue,
                              borderRadius: BorderRadius.circular(
                                  Dimension.radius20)),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
