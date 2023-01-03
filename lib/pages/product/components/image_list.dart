import 'dart:convert';

import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  List img;
  ImageList({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.size350,
      child: PageView.builder(
        itemCount: img.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  img[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
