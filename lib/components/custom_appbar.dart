import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar CustomAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? action,
  double? elevation,
  Color? backgroundColor,
  Color? statusBarColor,
  bool? centerTitle,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: elevation,
    centerTitle: centerTitle,
    title: title,
    leading: leading,
    actions: action,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
    ),
  );
}
