import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/pages/home_page/components/product/product_item.dart';
import 'package:fashion_shop_app/pages/product/product_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productStream =
    FirebaseFirestore.instance.collection('products').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _productStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Container(
          padding: EdgeInsets.all(Dimension.size10),
          decoration: BoxDecoration(
            color: AppColor.backgroundGrey,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: Dimension.size300,
              crossAxisSpacing: Dimension.size10,
              mainAxisSpacing: Dimension.size10,
            ),
            itemCount: productionList.length,
            itemBuilder: (context, index) {
              return ProductItem();
            },
          ),
        );
    },);
  }
}
