import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  String name;
  int price;
  double rating;
  int sold;
  ProductDetail({Key? key,required this.name,required this.price,required this.rating,required this.sold}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.size16),
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text:
            widget.name,
            maxLine: 2,
            overflow: TextOverflow.ellipsis,
            size: Dimension.font14,
          ),
          Row(
            children: [
              RatingBarIndicator(
                rating: widget.rating,
                itemBuilder: (context, index) =>
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                itemCount: 5,
                itemSize: Dimension.size16,
                direction: Axis.horizontal,
              ),
              SizedBox(
                width: Dimension.size5,
              ),
              BigText(
                text: '(52)',
                size: Dimension.font14,
                color: AppColor.deactivatedText,
              ),
              SizedBox(
                width: Dimension.size5,
              ),
              BigText(
                text: '|',
                size: Dimension.font10,
                color: AppColor.deactivatedText,
              ),
              SizedBox(
                width: Dimension.size5,
              ),
              BigText(
                text: '???? b??n ${widget.sold}',
                size: Dimension.font14,
                color: AppColor.deactivatedText,
              ),
            ],
          ),
          SizedBox(
            height: Dimension.size5,
          ),
          BigText(
            text: NumberFormat.simpleCurrency(locale: 'vi-VN').format(widget.price),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          // BigText(
          //   text: 'M??u',
          //   color: AppColor.deactivatedText,
          //   size: Dimension.font14,
          // ),
          // SizedBox(
          //   height: Dimension.size10,
          // ),
          // BigText(
          //   text: 'Size',
          //   color: AppColor.deactivatedText,
          //   size: Dimension.font14,
          // ),
          // Container(
          //   width: double.infinity,
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: 5,
          //     padding: EdgeInsets.zero,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: (){
          //           setState(() {
          //             selectedIndex = index;
          //           });
          //         },
          //         child: Container(
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             color: selectedIndex == index ? AppColor.nearlyBlue : AppColor.nearlyWhite,
          //               borderRadius: BorderRadius.circular(Dimension.radius10),
          //               border: Border.all(
          //                 width: 1,
          //                 color: AppColor.nearlyBlue,
          //               )
          //           ),
          //           child: selectedIndex == index ? BigText(text: 'XXXL',size: Dimension.font10,color: AppColor.nearlyWhite,):BigText(text: 'M',size: Dimension.font10,),
          //         ),
          //       );
          //     },
          //     scrollDirection: Axis.vertical,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       mainAxisExtent: 30,
          //       crossAxisCount: 5,
          //       mainAxisSpacing: 10,
          //       crossAxisSpacing: 10
          //     ),),
          // ),
        ],
      ),
    );
  }
}


