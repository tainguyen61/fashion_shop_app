import 'package:fashion_shop_app/models/cart_item_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> cartList = [];

  CartState({required this.cartList});


  void addProduct(ProductModel productModel) {
    cartList.add(CartItemModel(productModel: productModel));
    notifyListeners();
  }
  void removeProduct(index){
    cartList.removeAt(index);
    notifyListeners();
  }

  void addProductItem(index){
    cartList[index].count++;
    notifyListeners();
  }

  void removeProductItem(index){
    cartList[index].count--;
    notifyListeners();
  }

  get getCountChecked{
    int countChecked = 0;
    for(int i = 0; i<cartList.length;i++){
      if(cartList[i].isChecked){
        countChecked ++;
      }
    }
    return countChecked;
}
  get getTotalPrice{
    double totalPrice = 0;
    for(int i = 0;i<cartList.length;i++){
      if(cartList[i].isChecked){
        totalPrice += cartList[i].productModel.price * cartList[i].count;
      }
    }
    return totalPrice.toInt();
  }

  void isChecked(index) {
    cartList[index].isChecked = !cartList[index].isChecked;
    notifyListeners();
  }


  void checkedAll(bool checked){
    for(int i = 0; i<cartList.length;i++){
      cartList[i].isChecked = checked;
    }
    notifyListeners();
  }

}

final cartState = CartState(cartList: <CartItemModel>[]);
