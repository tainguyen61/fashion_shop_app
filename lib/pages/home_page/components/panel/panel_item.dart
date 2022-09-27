import 'package:flutter/material.dart';

class PanelItem extends StatelessWidget {
  const PanelItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        color: Colors.red,
      ),
    );
  }
}
