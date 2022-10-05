import 'package:flutter/material.dart';

class PanelItem extends StatelessWidget {
  String img;

  PanelItem({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  img,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
