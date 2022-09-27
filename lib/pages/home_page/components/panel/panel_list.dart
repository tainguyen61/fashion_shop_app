import 'package:fashion_shop_app/pages/home_page/components/panel/panel_item.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class PanelList extends StatelessWidget {
  const PanelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.nearlyWhite,
      child: Padding(
        padding: EdgeInsets.all(Dimension.size10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimension.radius10),
          child: Container(
            color: Colors.yellow,
            height: Dimension.panel120,
            child: PageView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return PanelItem();
              },
            ),
          ),
        ),
      ),
    );
  }
}
