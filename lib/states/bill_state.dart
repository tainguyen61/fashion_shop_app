import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:flutter/material.dart';

import '../models/bill_detail_model.dart';

class BillState extends ChangeNotifier{
  List<BillDetailModel> billList = [];
  List<BillDetailModel> billProcressingList = [];
  List<BillDetailModel> billDeliveringList = [];
  List<BillDetailModel> billDeliveredList = [];
  List<BillDetailModel> billCancelList = [];

  Future getBillList() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userState.userInfo[0].id.toString())
        .collection('bill_detail')
        .orderBy('time',descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        billList.add(BillDetailModel.fromSnapshot(doc));
      });
    });
    notifyListeners();
  }

  Future getBillProcressing() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userState.userInfo[0].id.toString())
        .collection('bill_detail')
        .where('status', isEqualTo: 'Đang xử lý',)
        .orderBy('time',descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        billProcressingList.add(BillDetailModel.fromSnapshot(doc));
      });
    });
    notifyListeners();
  }

  Future getBillDelivering() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userState.userInfo[0].id.toString())
        .collection('bill_detail')
        .where('status', isEqualTo: 'Đang vận chuyển',)
        .orderBy('time',descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        billDeliveringList.add(BillDetailModel.fromSnapshot(doc));
      });
    });
    notifyListeners();
  }

  Future getBillDelivered() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userState.userInfo[0].id.toString())
        .collection('bill_detail')
        .where('status', isEqualTo: 'Đã giao',)
        .orderBy('time',descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        billDeliveredList.add(BillDetailModel.fromSnapshot(doc));
      });
    });
    notifyListeners();
  }

  Future getBillCancel() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userState.userInfo[0].id.toString())
        .collection('bill_detail')
        .where('status', isEqualTo: 'Đã hủy',)
        .orderBy('time',descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        billCancelList.add(BillDetailModel.fromSnapshot(doc));
      });
    });
    notifyListeners();
  }

  BillState(this.billList);
}
final billState = BillState(<BillDetailModel>[]);