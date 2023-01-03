import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/pages/admin/components/admin_product_page/components/admin_product_item.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class AdminProductList extends StatelessWidget {
  const AdminProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productState.getProductList();
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
          mainAxisExtent: Dimension.size350,
          crossAxisSpacing: Dimension.size10,
          mainAxisSpacing: Dimension.size10,
        ),
        itemCount: productState.productList.length,
        itemBuilder: (context, index) {
          ProductModel productItem = productState.productList[index];
          return AdminProductItem(
            id: productItem.id,
            name: productItem.name,
            describle: productItem.describle,
            idcategory: productItem.idcategory,
            img: productItem.img,
            price: productItem.price,
            rating: productItem.rating,
            sex: productItem.sex,
            sold: productItem.sold,
          );
        },
      ),
    );

      GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: Dimension.size300,
        crossAxisSpacing: Dimension.size10,
        mainAxisSpacing: Dimension.size10,
      ),
      itemCount: productState.productList.length,
      itemBuilder: (context, index) {
        ProductModel productItem = productState.productList[index];
        return AdminProductItem(
          id: productItem.id,
          name: productItem.name,
          describle: productItem.describle,
          idcategory: productItem.idcategory,
          img: productItem.img,
          price: productItem.price,
          rating: productItem.rating,
          sex: productItem.sex,
          sold: productItem.sold,
        );
      },
    );
  }
}
