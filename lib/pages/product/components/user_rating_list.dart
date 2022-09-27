import 'package:fashion_shop_app/pages/product/components/user_rating_item.dart';
import 'package:flutter/material.dart';

class UserRatingList extends StatelessWidget {
  const UserRatingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return UserRatingItem();
        },
      ),
    );
  }
}
