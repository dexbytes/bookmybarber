import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final double customHeight;
  final Color? statusBarColor;
  const StatusBar({Key? key, this.customHeight = -1, this.statusBarColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double customHeight = this.customHeight;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    //Set status bar height
    if (customHeight == -1) {
      customHeight = mediaQueryData.padding.top;
    }
    //Set back ground color
    Color? statusBarColor =
        this.statusBarColor != null ? this.statusBarColor : Colors.green;
    return Container(
      width: double.infinity,
      height: customHeight,
      color: statusBarColor,
    );
  }
}
