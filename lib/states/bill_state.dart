import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  void billCancel(String id,context)async{
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 100.sp,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    await FirebaseFirestore.instance.collection('users').doc(userState.userInfo[0].id.toString()).collection('bill_detail').doc(id).update({
      'status':'Đã hủy',
    }).then((value) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: BigText(
              text: 'Thông báo',
              size: Dimension.size16,
              color: AppColor.nearlyBlack,
            ),
            content:
            Text('Hủy đơn hàng thành công!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')),
            ],
          );
        },
      );
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: BigText(
              text: 'Thông báo',
              size: Dimension.size16,
              color: AppColor.nearlyBlack,
            ),
            content:
            Text('Đã có lỗi xảy ra, vui lòng thử lại sau!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')),
            ],
          );
        },
      );
    });
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