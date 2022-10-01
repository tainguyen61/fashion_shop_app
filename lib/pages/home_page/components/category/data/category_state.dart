import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryState extends ChangeNotifier{
  List<CategoryModel> categoryList = [];

  void getCategoryList() async {
    var data = await FirebaseFirestore.instance.collection('categories').get();
    categoryList = List.from(data.docs.map((doc) => CategoryModel.fromSnapshot(doc)));
    notifyListeners();
  }

  CategoryState({required this.categoryList});
}

final categoryState = CategoryState(categoryList: <CategoryModel>[]);