import 'dart:math';

import 'package:fashion_shop_app/components/cart.dart';
import 'package:fashion_shop_app/pages/product/components/bottom_product.dart';
import 'package:fashion_shop_app/pages/product/components/image_list.dart';
import 'package:fashion_shop_app/pages/product/components/product_describle.dart';
import 'package:fashion_shop_app/pages/product/components/product_detail.dart';
import 'package:fashion_shop_app/pages/product/components/product_rating.dart';
import 'package:fashion_shop_app/pages/product/components/user_rating_list.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

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
                    ImageList(),
                    ProductDetail(),
                    SizedBox(
                      height: Dimension.size10,
                    ),
                    ProductDescribe(),
                    SizedBox(
                      height: Dimension.size10,
                    ),
                    ProductRating(),
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
      bottomNavigationBar: BottomProduct(),
    );
  }
}
