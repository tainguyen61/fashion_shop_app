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
  List color;
  List size;
  String colorChoose;
  String sizeChoose;

  ProductDetail(
      {Key? key,
      required this.name,
      required this.price,
      required this.rating,
      required this.sold,
      required this.color,
      required this.size,
      required this.colorChoose,
      required this.sizeChoose,})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedIndex = 0;
  int colorSelectedIndex = 0;
  String? colorChoose;
  String? sizeChoose;

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
            text: widget.name,
            maxLine: 2,
            overflow: TextOverflow.ellipsis,
            size: Dimension.font14,
          ),
          Row(
            children: [
              RatingBarIndicator(
                rating: widget.rating,
                itemBuilder: (context, index) => Icon(
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
                text: 'Đã bán ${widget.sold}',
                size: Dimension.font14,
                color: AppColor.deactivatedText,
              ),
            ],
          ),
          SizedBox(
            height: Dimension.size5,
          ),
          BigText(
            text: NumberFormat.simpleCurrency(locale: 'vi-VN')
                .format(widget.price),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          BigText(
            text: 'Màu',
            color: AppColor.deactivatedText,
            size: Dimension.font14,
          ),
          SizedBox(
            height: Dimension.size5,
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 9,
            ),
            itemCount: widget.color.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      colorSelectedIndex = index;
                      colorChoose = widget.color[index];
                      widget.colorChoose = colorChoose!;
                      print(colorChoose);
                    });
                  },
                  child: colorSelectedIndex == index
                      ? Container(
                          padding: EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color(int.parse(
                                '0x${widget.color[index]}',
                              )),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color(
                                  int.parse(
                                    '0x${widget.color[index]}',
                                  ),
                                ),
                                shape: BoxShape.circle),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color(
                                  int.parse(
                                    '0x${widget.color[index]}',
                                  ),
                                ),
                                shape: BoxShape.circle),
                          ),
                        ));
            },
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          BigText(
            text: 'Size',
            color: AppColor.deactivatedText,
            size: Dimension.font14,
          ),
          SizedBox(
            height: Dimension.size5,
          ),
          Container(
            width: double.infinity,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.size.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      sizeChoose = widget.size[index];
                      widget.sizeChoose = sizeChoose!;
                      print(sizeChoose);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? AppColor.nearlyBlue
                            : AppColor.nearlyWhite,
                        borderRadius: BorderRadius.circular(Dimension.radius10),
                        border: Border.all(
                          width: 1,
                          color: AppColor.nearlyBlue,
                        )),
                    child: selectedIndex == index
                        ? BigText(
                            text: widget.size[index],
                            size: Dimension.font10,
                            color: AppColor.nearlyWhite,
                          )
                        : BigText(
                            text: widget.size[index],
                            size: Dimension.font10,
                          ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 30,
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
            ),
          ),
        ],
      ),
    );
  }
}
