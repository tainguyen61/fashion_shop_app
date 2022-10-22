import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  List<UserModel> userInfo = [];
  bool checkLogin = false;
  String userImage = '';

  void login(){
    checkLogin = true;
    notifyListeners();
  }

  void logout(){
    checkLogin = false;
    userInfo.clear();
    notifyListeners();
  }

  Stream<QuerySnapshot> getImageUser() async* {
    String downloadImageUrl = '';
    final imageRef = FirebaseStorage.instance.ref().child('files/imageUsers/${userInfo[0].image}');
    downloadImageUrl = await imageRef.getDownloadURL();
    userImage = downloadImageUrl;
  }

  Future getIdInformation()async {
    var information = await FirebaseFirestore.instance.collection('users').doc(userState.userInfo[0].id).collection('information').get();
    var id = information.docs[0].id;
    return id;
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