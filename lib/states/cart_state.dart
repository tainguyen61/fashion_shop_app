import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/cart_item_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> cartList = [];

  CartState({required this.cartList});

  late CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  void addBill(
    String time,
  ) async {
    String? billId;
    if (getCountChecked != 0) {
      for (int i = 0; i < cartList.length; i++) {
        if (cartList[i].isChecked) {
          users.doc(userState.userInfo[0].id).collection('bill_detail').add({
            "productId": cartList[i].productModel.id,
            "img": cartList[i].productModel.img,
            "name": cartList[i].productModel.name,
            "price": cartList[i].productModel.price,
            "quantity": cartList[i].count,
            "subTotal": cartList[i].subTotal,
            "time": time,
            "status": "Đang xử lý",
            "address": userState.userInfo[0].address,
            "userName": userState.userInfo[0].name,
            "userPhone": userState.userInfo[0].phone,

          }).then((value){
          }).catchError((error) => print("Failed to add user: $error"));
        }
      }

      for (int i = 0; i < cartList.length; i++) {
        if (cartList[i].isChecked) {
          cartState.cartList.remove(cartList[i]);
          i-=1;
        }
      }
    }
    notifyListeners();
  }

  void addProduct(ProductModel productModel) {
    bool check = false;
    for (int i = 0; i < cartList.length; i++) {
      if (identical(cartList[i].productModel.id, productModel.id)) {
        check = true;
      }
    }

    if (!check) {
      cartList.add(CartItemModel(productModel: productModel));
    }
    notifyListeners();
  }

  void removeProduct(index) {
    cartList.removeAt(index);
    notifyListeners();
  }

  void addProductItem(index) {
    cartList[index].count++;
    notifyListeners();
  }

  void removeProductItem(index) {
    cartList[index].count--;
    notifyListeners();
  }

  get getCountChecked {
    int countChecked = 0;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].isChecked) {
        countChecked++;
      }
    }
    return countChecked;
  }

  get getTotalPrice {
    double totalPrice = 0;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].isChecked) {
        totalPrice += cartList[i].productModel.price * cartList[i].count;
      }
    }
    return totalPrice.toInt();
  }

  void isChecked(index) {
    cartList[index].isChecked = !cartList[index].isChecked;
    notifyListeners();
  }

  void checkedAll(bool checked) {
    for (int i = 0; i < cartList.length; i++) {
      cartList[i].isChecked = checked;
    }
    notifyListeners();
  }
}

final cartState = CartState(cartList: <CartItemModel>[]);
