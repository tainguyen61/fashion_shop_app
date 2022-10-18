import 'package:fashion_shop_app/pages/account/components/components/bill_item.dart';
import 'package:fashion_shop_app/states/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/bill_detail_model.dart';

class DeliveredPage extends StatelessWidget {
  const DeliveredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    billState.billDeliveredList.clear();
    billState.getBillDelivered();
    return RefreshIndicator(
      onRefresh: () async {
        billState.billDeliveredList.clear();
        billState.getBillDelivered();
      },
      child: Consumer<BillState>(builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: billState.billDeliveredList.length,
          itemBuilder: (context, index) {
            BillDetailModel billItem = billState.billDeliveredList[index];
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
