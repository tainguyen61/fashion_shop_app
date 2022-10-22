import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/pages/account/components/components/bill_detail_page.dart';
import 'package:fashion_shop_app/states/bill_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class BillItem extends StatelessWidget {
  String id;
  String productId;
  String img;
  String name;
  int price;
  int quantity;
  int subTotal;
  String time;
  String status;
  String address;
  String userName;
  String userPhone;

  BillItem(
      {Key? key,
      required this.id,
      required this.productId,
      required this.img,
      required this.name,
      required this.price,
      required this.quantity,
      required this.subTotal,
      required this.time,
      required this.status,
      required this.address,
      required this.userName,
      required this.userPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.size10),
      margin: EdgeInsets.only(top: Dimension.size5),
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (status == 'Đang xử lý' || status == 'Đang vận chuyển')
                BigText(
                  text: status,
                  size: Dimension.font16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.nearlyBlue,
                ),
              if (status == 'Đã giao')
                BigText(
                  text: status,
                  size: Dimension.font16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.deactivatedText,
                ),
              if (status == 'Đã hủy')
                BigText(
                  text: status,
                  size: Dimension.font16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.red,
                ),
              status == 'Đã giao'
                  ? BigText(
                      text: 'Viết Đánh Giá',
                      size: Dimension.font14,
                      color: AppColor.nearlyBlue,
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: Dimension.size5,
          ),
          Divider(
            height: .5,
            color: AppColor.mediumGrey,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimension.size10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Dimension.size80,
                  width: Dimension.size80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(img),
                  )),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BigText(
                          text: name,
                          size: Dimension.font16,
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            BigText(
                              text: 'Số lượng: ${quantity} | ${subTotal}',
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              size: Dimension.font14,
                              color: AppColor.deactivatedText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BillDetailPage(
                            id: id,
                            img: img,
                            price: price,
                            name: name,
                            address: address,
                            quantity: quantity,
                            productId: productId,
                            status: status,
                            subTotal: subTotal,
                            time: time,
                            userName: userName,
                            userPhone: userPhone,
                          ),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimension.size5),
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: Dimension.size5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius5),
                      border: Border.all(width: 1, color: AppColor.nearlyBlue),
                    ),
                    child: BigText(
                      text: 'Xem Chi Tiết',
                      size: Dimension.font14,
                      color: AppColor.nearlyBlue,
                    ),
                  ),
                ),
              ),
              status == 'Đang xử lý'
                  ? Flexible(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: BigText(
                                text: 'Thông báo',
                                size: Dimension.size16,
                                color: AppColor.nearlyBlack,
                              ),
                              content: Text('Bạn có chắc muốn hủy đơn hàng?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Hủy')),
                                TextButton(
                                    onPressed: () async {
                                      billState.billCancel(id,context);
                                      billState.billProcressingList.clear();
                                      billState.getBillProcressing();
                                    },
                                    child: const Text('Có')),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.maxFinite,
                        margin:
                            EdgeInsets.symmetric(horizontal: Dimension.size5),
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius5),
                          border: Border.all(width: 1, color: AppColor.red),
                        ),
                        child: BigText(
                          text: 'Hủy',
                          size: Dimension.font14,
                          color: AppColor.red,
                        ),
                      ),
                    ),
                  )
                  : Flexible(
                      child: Container(
                        width: double.maxFinite,
                        margin:
                            EdgeInsets.symmetric(horizontal: Dimension.size5),
                        padding:
                            EdgeInsets.symmetric(vertical: Dimension.size5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius5),
                          border:
                              Border.all(width: 1, color: AppColor.nearlyBlue),
                        ),
                        child: BigText(
                          text: 'Mua Lại',
                          size: Dimension.font14,
                          color: AppColor.nearlyBlue,
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
