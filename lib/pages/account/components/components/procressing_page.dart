import 'package:fashion_shop_app/models/bill_detail_model.dart';
import 'package:fashion_shop_app/states/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bill_item.dart';

class ProcessingPage extends StatelessWidget {
  const ProcessingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    billState.billProcressingList.clear();
    billState.getBillProcressing();
    return RefreshIndicator(
      onRefresh: () async {
        billState.billProcressingList.clear();
        billState.getBillProcressing();
      },
      child: Consumer<BillState>(builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: billState.billProcressingList.length,
          itemBuilder: (context, index) {
            BillDetailModel billItem = billState.billProcressingList[index];
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
