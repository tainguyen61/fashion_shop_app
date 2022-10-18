import 'package:fashion_shop_app/models/bill_detail_model.dart';
import 'package:fashion_shop_app/states/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bill_item.dart';

class CancelPage extends StatelessWidget {
  const CancelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    billState.billCancelList.clear();
    billState.getBillCancel();
    return RefreshIndicator(
      onRefresh: () async {
        billState.billCancelList.clear();
        billState.getBillCancel();
      },
      child: Consumer<BillState>(builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: billState.billCancelList.length,
          itemBuilder: (context, index) {
            BillDetailModel billItem = billState.billCancelList[index];
            return BillItem(
              id: billItem.id,
              img: billItem.img,
              price: billItem.price,
              name: billItem.name,
              address: billItem.address,
              quantity: billItem.quantity,
              productId: billItem.productId,
              status: billItem.status,
              subTotal: billItem.subTotal,
              time: billItem.time,
              userName: billItem.userName,
              userPhone: billItem.userPhone,
            );
          },);
      },),
    );
  }
}
