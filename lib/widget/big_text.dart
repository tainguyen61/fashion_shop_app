import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow? overflow;
  int maxLine;
  FontWeight? fontWeight;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow,
      this.maxLine = 1,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
          height: 1.4.sp,
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? 20.sp : size,
          fontWeight: fontWeight),
    );
  }
}
