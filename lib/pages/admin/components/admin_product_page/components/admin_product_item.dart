import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminProductItem extends StatelessWidget {
  String id;
  String describle;
  String idcategory;
  List img;
  String name;
  int price;
  double rating;
  String sex;
  int sold;
  AdminProductItem({Key? key,
    required this.id,
    required this.describle,
    required this.idcategory,
    required this.img,
    required this.name,
    required this.price,
    required this.rating,
    required this.sex,
    required this.sold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimension.radius5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.nearlyWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimension.size180,
              decoration: BoxDecoration(
                color: AppColor.nearlyWhite,
                image: DecorationImage(
                    image: NetworkImage(img[0]), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimension.size10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: NumberFormat.simpleCurrency(locale: 'vi-VN').format(price),
                    size: Dimension.font16,
                    color: AppColor.red,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: Dimension.size5,
                  ),
                  BigText(
                    text: name,
                    maxLine: 2,
                    size: Dimension.font12,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.darkerText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                        text: rating.toString(),
                        size: Dimension.font12,
                        color: AppColor.lightText,
                      ),
                      Icon(
                        Icons.star_outlined,
                        size: Dimension.iconSize16,
                        color: AppColor.yellow,
                      ),
                      BigText(
                        text: ' | ',
                        size: Dimension.font10,
                        color: AppColor.lightText,
                      ),
                      BigText(
                        text: 'Đã bán ${sold.toString()}',
                        color: AppColor.lightText,
                        size: Dimension.font12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimension.size10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimension.size20),
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(Dimension.radius5),
                        ),
                        child: BigText(text: 'sửa',color: AppColor.nearlyWhite,size: Dimension.size16,),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: Dimension.size20),
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(Dimension.radius5),
                        ),
                        child: BigText(text: 'xóa',color: AppColor.nearlyWhite,size: Dimension.size16,),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
