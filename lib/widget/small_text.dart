import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow? overFlow;
  int? maxLine;
  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.overFlow,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: maxLine,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0? 12.sp : size,
          height: height,
          overflow: overFlow,
        ));
  }
}
