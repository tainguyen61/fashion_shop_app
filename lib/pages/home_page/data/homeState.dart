import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  bool checkLogin = false;

  void login(){
    checkLogin = true;
    notifyListeners();
  }

  void logout(){
    checkLogin = false;
    notifyListeners();
  }

  get getCheckLogin{
    return checkLogin;
  }
}
final homeState = HomeState();