import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/models/bill_detail_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/pages/product/components/bottom_product.dart';
import 'package:fashion_shop_app/pages/product/components/image_list.dart';
import 'package:fashion_shop_app/pages/product/components/product_describle.dart';
import 'package:fashion_shop_app/pages/product/components/product_detail.dart';
import 'package:fashion_shop_app/pages/product/components/product_rating.dart';
import 'package:fashion_shop_app/pages/product/components/user_rating_list.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
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

  ProductPage(
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
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _backgroundIconColorTween;
  late Animation<Offset> _transTween;

  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween =
        ColorTween(begin: Colors.transparent, end: AppColor.nearlyWhite)
            .animate(_ColorAnimationController);
    _iconColorTween =
        ColorTween(begin: AppColor.nearlyWhite, end: AppColor.nearlyBlue)
            .animate(_ColorAnimationController);
    _backgroundIconColorTween =
        ColorTween(begin: AppColor.nearlyBlack, end: Colors.transparent)
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);

    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 80);

      _TextAnimationController.animateTo((scrollInfo.metrics.pixels - 80) / 50);
      return true;
    }
    return false;
  }

  int selectedIndex = 0;
  int colorSelectedIndex = 0;
  String? colorChoose;
  String? sizeChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ImageList(img: widget.img),
                    // ProductDetail(
                    //   sold: widget.sold,
                    //   rating: widget.rating,
                    //   price: widget.price,
                    //   name: widget.name,
                    //   color: widget.color,
                    //   size: widget.size,
                    //   colorChoose: colorChoose,
                    //   sizeChoose: sizeChoose,
                    // ),
                    Container(
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                            border:
                                                Border.all(color: Colors.white),
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
                                      print(sizeChoose);
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selectedIndex == index
                                            ? AppColor.nearlyBlue
                                            : AppColor.nearlyWhite,
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius10),
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 30,
                                      crossAxisCount: 5,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimension.size10,
                    ),
                    ProductDescribe(describe: widget.describle),
                    SizedBox(
                      height: Dimension.size10,
                    ),
                    ProductRating(rating: widget.rating),
                    UserRatingList(),
                  ],
                ),
              ),
              Container(
                height: Dimension.size80,
                child: AnimatedBuilder(
                  animation: _ColorAnimationController,
                  builder: (ct, child) => AppBar(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: Dimension.radius30,
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: _iconColorTween.value,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Opacity(
                          opacity: .5,
                          child: CircleAvatar(
                            radius: Dimension.radius30,
                            backgroundColor: _backgroundIconColorTween.value,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: _iconColorTween.value,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: _colorTween.value,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                    ),
                    actions: <Widget>[
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: Dimension.radius30,
                            backgroundColor: Colors.transparent,
                            child: Cart(
                              color: _iconColorTween.value,
                            ),
                          ),
                          Opacity(
                            opacity: .5,
                            child: CircleAvatar(
                              radius: Dimension.radius30,
                              backgroundColor: _backgroundIconColorTween.value,
                              child: Cart(
                                color: _iconColorTween.value,
                              ),
                            ),
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
      ),
      bottomNavigationBar:
          // BottomProduct(
          //   id: widget.id,
          //   name: widget.name,
          //   rating: widget.rating,
          //   sold: widget.sold,
          //   sex: widget.sex,
          //   price: widget.price,
          //   img: widget.img,
          //   color: widget.color,
          //   size: widget.size,
          //   category: widget.category,
          //   describle: widget.describle,
          // ),
          Container(
        height: Dimension.size80,
        padding: EdgeInsets.symmetric(
            horizontal: Dimension.size16, vertical: Dimension.size10),
        decoration: BoxDecoration(
            color: AppColor.nearlyWhite,
            border:
                Border(top: BorderSide(width: 2, color: AppColor.mediumGrey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                height: Dimension.size50,
                padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius5),
                    border: Border.all(
                      color: AppColor.nearlyBlue,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: Dimension.iconSize16,
                      color: AppColor.nearlyBlue,
                    ),
                    BigText(
                      text: 'Chat',
                      size: Dimension.font14,
                      color: AppColor.nearlyBlue,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () async {},
                child: Container(
                    height: Dimension.size50,
                    width: Dimension.size50,
                    padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius5),
                        border: Border.all(
                          color: AppColor.nearlyBlue,
                        )),
                    child: Icon(
                      Icons.favorite_border,
                      size: Dimension.iconSize24,
                      color: AppColor.nearlyBlue,
                    )
                    // Consumer<ProductState>(builder: (context, value, child) {
                    //   return productState.getStatusFavorite(id) ? Icon(
                    //     Icons.favorite,
                    //     size: Dimension.iconSize24,
                    //     color: AppColor.red,
                    //   ): Icon(
                    //     Icons.favorite_border,
                    //     size: Dimension.iconSize24,
                    //     color: AppColor.nearlyBlue,
                    //   );
                    // },),
                    ),
              ),
            ),
            Flexible(
              flex: 8,
              child: InkWell(
                onTap: () {
                  cartState.addProduct(BillDetailItem(
                      productId: widget.id,
                      img: widget.img[0],
                      color: colorChoose!,
                      size: sizeChoose!,
                      category: widget.category,
                      name: widget.name,
                      price: widget.price));
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //   content: Text("Sản phẩm đã được thêm vào giỏ hàng!"),
                  // ),);
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
                    text: 'Chọn mua',
                    size: Dimension.font18,
                    color: AppColor.nearlyWhite,
                    maxLine: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
