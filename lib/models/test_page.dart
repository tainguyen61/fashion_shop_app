
import 'package:fashion_shop_app/models/product_model_test.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    productState.getProductList();
    return Scaffold(
      body: Consumer<ProductState>(
        builder: (context, value, child) {
          return Center(
            child: productState.productList.isEmpty
                ? CircularProgressIndicator()
                : Text(productState.productList[0].name),
          );
        },
      ),
    );
  }
}
