import 'package:fashion_shop_app/models/bill_detail_model.dart';
import 'package:fashion_shop_app/pages/account/components/components/bill_item.dart';
import 'package:fashion_shop_app/states/bill_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllBillPage extends StatelessWidget {
  const AllBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    billState.billList.clear();
    billState.getBillList();
    return RefreshIndicator(
      onRefresh: () async {
        billState.billList.clear();
        billState.getBillList();
      },
      child: Consumer<BillState>(builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: billState.billList.length,
          itemBuilder: (context, index) {
            BillDetailModel billItem = billState.billList[index];
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
