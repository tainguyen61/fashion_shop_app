import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/cart_item_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> cartList = [];

  CartState({required this.cartList});

  late CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  void addBill(String uid, String time,String address,) async {
    String? billId;
    if (getCountChecked != 0) {
      await users
          .doc(uid)
          .collection('bill')
          .add({"time": time, "totalPrice": getTotalPrice, "address": address})
          .then((value) => billId = value.id);

      for (int i = 0; i < cartList.length; i++) {
        if (cartList[i].isChecked) {
          users.doc(uid).collection('bill_detail').add({
            "id": billId,
            "productId": cartList[i].productModel.id,
            "img": cartList[i].productModel.img,
            "name": cartList[i].productModel.name,
            "price": cartList[i].productModel.price,
            "quantity": cartList[i].count,
            "subTotal": cartList[i].subTotal,
          });
          cartState.cartList.remove(cartList[i]);
        }
      }

      for (int i = 0; i < cartList.length; i++) {
        if (cartList[i].isChecked) {
          cartState.cartList.remove(cartList[i]);
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
