import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserRatingItem extends StatelessWidget {
  const UserRatingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.size16),
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
        border: Border(
          top: BorderSide(
            width: .5,
            color: AppColor.mediumGrey,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              RatingBarIndicator(
                rating: 5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: Dimension.font16,
                direction: Axis.horizontal,
              ),
              SizedBox(
                width: Dimension.size5,
              ),
              BigText(
                text: 'Rất không hài lòng',
                size: Dimension.font14,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          BigText(
            text:
            'Đặt màu đen mà shop giao màu trắng? Cảm giác khá ổn so với mút zin',
            size: Dimension.font14,
            maxLine: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BigText(text: 'Trần Quang Huy',size: Dimension.font14,color: AppColor.lightText,),
              SizedBox(width: Dimension.size5,),
              Icon(Icons.check_circle_rounded,size: Dimension.iconSize16,color: AppColor.lightText,),
              SizedBox(width: Dimension.size5,),
              BigText(text: 'Đã mua hàng',size: Dimension.font14,color: AppColor.lightText,),
            ],
          )
        ],
      ),
    );
  }
}
