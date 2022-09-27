import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimension.size16,
        right: Dimension.size16,
        left: Dimension.size16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: 'Khách Hàng Đánh Giá',
                size: Dimension.font16,
                fontWeight: FontWeight.w500,
              ),
              BigText(
                text: 'XEM TẤT CẢ',
                size: Dimension.font14,
                fontWeight: FontWeight.w500,
                color: AppColor.nearlyBlue,
              )
            ],
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          Row(
            children: [
              BigText(
                text: '4.5',
                size: Dimension.font32,
              ),
              SizedBox(
                width: Dimension.size10,
              ),
              RatingBarIndicator(
                rating: 5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: Dimension.font24,
                direction: Axis.horizontal,
              ),
              SizedBox(
                width: Dimension.size10,
              ),
              BigText(
                text: '13 Đánh giá',
                size: Dimension.font14,
                color: AppColor.deactivatedText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
