import 'package:fashion_shop_app/models/category_model.dart';
import 'package:fashion_shop_app/pages/home_page/components/category/category_item.dart';
import 'package:fashion_shop_app/states/category_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    categoryState.getCategoryList();
    return Consumer<CategoryState>(
      builder: (context, value, child) {
        return Container(
          color: AppColor.nearlyWhite,
          child: SizedBox(
            height: Dimension.size50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryState.categoryList.length,
              itemBuilder: (context, index) {
                CategoryModel categoryItem = categoryState.categoryList[index];
                return CategoryItem(
                  name: categoryItem.name,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
