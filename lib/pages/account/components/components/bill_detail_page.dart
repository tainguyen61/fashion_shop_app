import 'package:fashion_shop_app/components/custom_card_title.dart';
import 'package:fashion_shop_app/pages/account/components/components/bill_item.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class BillDetailPage extends StatelessWidget {
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
  BillDetailPage({Key? key, required this.id,
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
    required this.userPhone,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'Đơn Hàng',
          size: Dimension.font18,
          color: AppColor.nearlyWhite,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body:
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          CustomCardTitle(content: [
            BigText(text: 'Mã Đơn Hàng: ${id}',size: Dimension.font16,overflow: TextOverflow.ellipsis,maxLine: 2,),
            BigText(text: 'Ngày đặt hàng: ${time}',color: AppColor.deactivatedText,size: Dimension.font14,),
            if (status == 'Đang xử lý' || status == 'Đang vận chuyển')
              BigText(
                text: status,
                size: Dimension.font14,
                fontWeight: FontWeight.w500,
                color: AppColor.nearlyBlue,
              ),
            if (status == 'Đã giao')
              BigText(
                text: status,
                size: Dimension.font14,
                fontWeight: FontWeight.w500,
                color: AppColor.deactivatedText,
              ),
            if (status == 'Đã hủy')
              BigText(
                text: status,
                size: Dimension.font14,
                fontWeight: FontWeight.w500,
                color: AppColor.red,
              ),
          ], icon: Icon(Icons.account_balance,color: AppColor.nearlyBlue,)),
          SizedBox(height: Dimension.size10,),
          CustomCardTitle(content: [
            BigText(text: 'Địa chỉ người nhận',size: Dimension.font16,overflow: TextOverflow.ellipsis,maxLine: 1,),
            BigText(text: userName,color: AppColor.nearlyBlack,size: Dimension.font14,),
            BigText(text: userPhone,color: AppColor.deactivatedText,fontWeight: FontWeight.w500,size: Dimension.font14,),
            BigText(text: address,color: AppColor.deactivatedText,fontWeight: FontWeight.w500,size: Dimension.font14,overflow: TextOverflow.ellipsis,maxLine: 3,)
          ], icon: Icon(Icons.place_outlined,color: AppColor.nearlyBlue,),),
          SizedBox(height: Dimension.size10,),
          Container(
            color: AppColor.nearlyWhite,
            padding: EdgeInsets.all(Dimension.size16),
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
          SizedBox(height: Dimension.size10,),
          Container(
            color: AppColor.nearlyWhite,
            padding: EdgeInsets.all(Dimension.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: 'Thành tiền',size: Dimension.font14,),
                BigText(text: subTotal.toString(),fontWeight: FontWeight.bold,size: Dimension.font18,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
