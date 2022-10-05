import 'package:fashion_shop_app/models/panel_model.dart';
import 'package:fashion_shop_app/pages/home_page/components/panel/panel_item.dart';
import 'package:fashion_shop_app/states/panel_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelList extends StatelessWidget {
  const PanelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    panelState.getCategoryList();
    return Consumer<PanelState>(builder: (context, value, child) {
      return Container(
        color: AppColor.nearlyWhite,
        child: Padding(
          padding: EdgeInsets.all(Dimension.size10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimension.radius10),
            child: Container(
              color: Colors.yellow,
              height: Dimension.panel160,
              child: PageView.builder(
                itemCount: panelState.panelList.length,
                itemBuilder: (context, index) {
                  PanelModel panelItem = panelState.panelList[index];
                  return PanelItem(
                    img: panelItem.img,
                  );
                },
              ),
            ),
          ),
        ),
      );
    },);
  }
}
