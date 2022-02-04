import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

import 'already_have_account_row.dart';

class ConnectCard extends StatelessWidget {
  final String text;
  final Widget? imageIcon;
  final double borderRadius;
  final double sizeBoxWidth;
  final Color color;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ConnectCard(
      {Key? key,
        this.text = "Google",
        this.borderRadius = 40,
        this.color = Colors.black,
        this.fontWeight = FontWeight.w800,
        this.imageIcon,
        this.margin,
        this.padding,
        this.sizeBoxWidth = 25,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30,),
      padding: padding ?? EdgeInsets.only(left: 25,),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Container(
            child:imageIcon??iconApps.iconImage(imageUrl: iconApps.googleIcon,imageColor: Colors.white,iconSize: Size(30, 30)),
          ),
          SizedBox(width: sizeBoxWidth,),
          RichText(text: TextSpan(
            text:"Connect with ",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: "$text",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
              )
            ]
          ) ),
        ],
      ),
    );

  }
}
