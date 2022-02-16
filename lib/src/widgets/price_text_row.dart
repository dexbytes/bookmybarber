import 'package:flutter/material.dart';

class PriceTextRow extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final String rightTitle1;
  final TextStyle leftTitleTextStyle;
  final TextStyle rightTitleTextStyle;
  final TextStyle rightTitleTextStyle1;
  final bool isRightTextVisible;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color colors;
  final leftTextCallBack;
  final rightTextCallBack;
  final double height;


  const PriceTextRow({Key? key,
    this.leftTitle = "Service",
    this.rightTitle = "Total\:",
    this.rightTitle1 = "price",
    this.leftTitleTextStyle = const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Color(0xFFCCA76A)),
    this.rightTitleTextStyle = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),
    this.rightTitleTextStyle1 = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF00B2AE)),
    this.margin = const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.colors = Colors.transparent,
    this.leftTextCallBack,
    this.rightTextCallBack,
    this.padding = const EdgeInsets.only(top: 0,bottom: 0),
    this.height = 24,
    this.isRightTextVisible = true,


  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin,
      padding:padding,
      height: height,
      color: colors,
      child: Row(
        mainAxisAlignment:mainAxisAlignment,
        children: [
          Text(leftTitle,style: leftTitleTextStyle,),

          GestureDetector(
              onTap: (){
                this.rightTextCallBack?.call();
              },
              child: Row(
                children: [
                  Text(rightTitle,style: rightTitleTextStyle,),
                  SizedBox(width: 2,),
                  Text(rightTitle1,style: rightTitleTextStyle1,),
                ],
              )),
        ],
      ),
    );
  }
}
