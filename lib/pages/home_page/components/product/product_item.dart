import 'package:fashion_shop_app/pages/product/product_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatefulWidget {
  String id;
  String describle;
  List img;
  List color;
  List size;
  String category;
  String name;
  int price;
  double rating;
  String sex;
  int sold;

  ProductItem(
      {Key? key,
      required this.id,
      required this.describle,
      required this.img,
        required this.color,
        required this.size,
        required this.category,
      required this.name,
      required this.price,
      required this.rating,
      required this.sex,
      required this.sold})
      : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductPage(
              id: widget.id,
              name: widget.name,
              describle: widget.describle,
              img: widget.img,
              color: widget.color,
              size: widget.size,
              category: widget.category,
              price: widget.price,
              rating: widget.rating,
              sex: widget.sex,
              sold: widget.sold,
            ),
          ),
        );
      },
      child: ClipRRect(
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
                      image: NetworkImage(widget.img[0]), fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimension.size10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: NumberFormat.simpleCurrency(locale: 'vi-VN').format(widget.price),
                      size: Dimension.font16,
                      color: AppColor.red,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    BigText(
                      text: widget.name,
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
                          text: widget.rating.toString(),
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
                          text: 'Đã bán ${widget.sold.toString()}',
                          color: AppColor.lightText,
                          size: Dimension.font12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
