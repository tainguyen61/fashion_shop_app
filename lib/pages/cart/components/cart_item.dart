import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final int index;
  final String id;
  final List img;
  final String name;
  final int price;
  final bool isChecked;
  final int count;
  CartItem({Key? key,required this.isChecked, required this.id, required this.img, required this.name, required this.price, required this.index, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimension.size16,right: Dimension.size16,bottom: Dimension.size16,),
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
        border: Border(
          top: BorderSide(
            width: 1,
            color: AppColor.mediumGrey
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isChecked,
            focusColor: AppColor.mediumBlue,
            onChanged: (value) {
            cartState.isChecked(index);
          },),
          InkWell(
            onTap: (){},
            child: Container(
              height: Dimension.size80,
              width: Dimension.size80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img[0]),
                  )),
            ),
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
                    InkWell(
                      onTap: (){},
                      child: BigText(
                        height: 1.2.sp,
                        text: name,
                        size: Dimension.font14,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: Dimension.size5,),
                    BigText(
                      text: NumberFormat.simpleCurrency(locale: 'vi-VN').format(cartState.cartList[index].subTotal),
                      fontWeight: FontWeight.w500,
                      size: Dimension.font18,
                      color: AppColor.red,
                      maxLine: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Dimension.size5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimension.radius5),
                              border: Border.all(
                                  width: 1,
                                  color: AppColor.mediumGrey
                              )
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: Dimension.size5,),
                              InkWell(
                                  onTap: (){
                                    cartState.removeProductItem(index);
                                  },
                                  child: Icon(Icons.remove,size: Dimension.iconSize16,)),
                              SizedBox(width: Dimension.size5,),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
                                  decoration: BoxDecoration(
                                      border: Border.symmetric(
                                        vertical: BorderSide(
                                          width: 1,
                                          color: AppColor.mediumGrey,),

                                      )
                                  ),
                                  child: BigText(text: count.toString(),size: Dimension.font14,),),
                              SizedBox(width: Dimension.size5,),
                              InkWell(
                                  onTap: (){
                                    cartState.addProductItem(index);
                                  },
                                  child: Icon(Icons.add,size: Dimension.iconSize16,),),
                              SizedBox(width: Dimension.size5,),
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              cartState.removeProduct(index);
                            },
                            child: BigText(text: 'Xóa',size: Dimension.font14,color: AppColor.nearlyBlue,)),
                      ],
                    )
                  ],
                ),)
          )
        ],
      ),
    );
  }
}
