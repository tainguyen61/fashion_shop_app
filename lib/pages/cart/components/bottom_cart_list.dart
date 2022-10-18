import 'package:fashion_shop_app/pages/login/login_page.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomCartList extends StatelessWidget {
  const BottomCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.size80,
      padding: EdgeInsets.symmetric(horizontal: Dimension.size16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: AppColor.mediumGrey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: 'Tổng cộng',
                  size: Dimension.font14,
                ),
                Consumer<CartState>(
                  builder: (context, value, child) {
                    return cartState.getCountChecked == 0
                        ? Container(
                          child: BigText(
                              text: 'Vui lòng chọn sản phẩm',
                              color: AppColor.red,
                              size: 13,
                            overflow: TextOverflow.ellipsis,
                            ),
                        )
                        : BigText(
                            text: NumberFormat.simpleCurrency(locale: 'vi-VN')
                                .format(cartState.getTotalPrice),
                            color: AppColor.red,
                            size: Dimension.font20,
                            fontWeight: FontWeight.w700,
                          );
                  },
                )
              ],
            ),
          ),
          Flexible(
            child: Consumer<CartState>(
              builder: (context, value, child) {
                return InkWell(
                  onTap: () async {
                    if (!userState.checkLogin) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    } else if(cartState.getCountChecked==0){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Chưa có sản phẩm nào được chọn!"),
                      ));
                    }
                    else {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: BigText(
                              text: 'Thông báo',
                              size: Dimension.size16,
                              color: AppColor.nearlyBlack,
                            ),
                            content: Text('Xác nhận mua hàng!'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                              TextButton(
                                  onPressed: () async {
                                    var now = DateTime.now();
                                    var formatterDate =
                                        DateFormat('dd/MM/yyyy');
                                    var formatterTime = DateFormat('kk:mm:ss');
                                    String actualDate =
                                        formatterDate.format(now);
                                    String actualTime =
                                        formatterTime.format(now);
                                    String time = actualDate + ' ' + actualTime;
                                    cartState.addBill(
                                        time);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok')),
                            ],
                          );
                        },
                      );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Thông báo!'),
                            content: Text('Đặt hàng thành công!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius5),
                      color: AppColor.red,
                    ),
                    height: Dimension.size50,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: BigText(
                      text: 'Mua hàng (${cartState.getCountChecked})',
                      size: Dimension.font18,
                      color: AppColor.nearlyWhite,
                      maxLine: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
