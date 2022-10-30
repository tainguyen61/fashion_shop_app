import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/pages/product/components/bottom_product.dart';
import 'package:fashion_shop_app/pages/product/components/image_list.dart';
import 'package:fashion_shop_app/pages/product/components/product_describle.dart';
import 'package:fashion_shop_app/pages/product/components/product_detail.dart';
import 'package:fashion_shop_app/pages/product/components/product_rating.dart';
import 'package:fashion_shop_app/pages/product/components/user_rating_list.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  String id;
  String describle;
  String idcategory;
  List img;
  String name;
  int price;
  double rating;
  String sex;
  int sold;
  ProductPage({Key? key,
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
                    ProductDetail(
                      sold: widget.sold,
                      rating: widget.rating,
                      price: widget.price,
                      name: widget.name,

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
                            child: Cart(color: _iconColorTween.value,),
                          ),
                          Opacity(
                            opacity: .5,
                            child: CircleAvatar(
                              radius: Dimension.radius30,
                              backgroundColor: _backgroundIconColorTween.value,
                              child: Cart(color: _iconColorTween.value,),
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
      bottomNavigationBar: BottomProduct(
        id: widget.id,
        name: widget.name,
        rating: widget.rating,
        sold: widget.sold,
        sex: widget.sex,
        price: widget.price,
        img: widget.img,
        idcategory: widget.idcategory,
        describle: widget.describle,
      ),
    );
  }
}
