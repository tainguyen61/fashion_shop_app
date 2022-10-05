import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  List<UserModel> userInfo = [];
  bool checkLogin = false;

  void login(){
    checkLogin = true;
    notifyListeners();
  }

  void logout(){
    checkLogin = false;
    userInfo.clear();
    notifyListeners();
  }


  get getCheckLogin{
    return checkLogin;
  }

  void getUserInfo(String userId) async {
    var data = await FirebaseFirestore.instance.collection('users').doc(userId).collection('information').get();
    userInfo = List.from(data.docs.map((doc) => UserModel.fromSnapshot(doc)));
    userInfo[0].id = userId;
    notifyListeners();
  }
}
final userState = UserState();