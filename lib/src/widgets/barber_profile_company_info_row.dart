import 'package:flutter/material.dart';

class BarberCompanyInfoRow extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final String leftSubtitle;
  final double rightSubtitle;
  final TextStyle leftTitleTextStyle;
  final TextStyle rightTitleTextStyle;
  final TextStyle leftSubtitleTextStyle;
  final TextStyle rightSubtitleTextStyle;
  final bool isRightTextVisible;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color colors;
  final leftTextCallBack;
  final rightTextCallBack;
  final double height;


  const BarberCompanyInfoRow({Key? key,
    this.leftTitle = "Business name",
    this.rightTitle = "Start from",
    this.leftTitleTextStyle = const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
    this.rightTitleTextStyle = const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),
    this.margin = const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.colors = Colors.transparent,
    this.leftTextCallBack,
    this.rightTextCallBack,
    this.padding = const EdgeInsets.only(top: 0,bottom: 0),
    this.height = 60,
    this.isRightTextVisible = true,
    this.leftSubtitle = "RedBox Barber",
    this.rightSubtitle = 98.90,
    this.leftSubtitleTextStyle = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff828588)),
    this.rightSubtitleTextStyle = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff00B2AE)),


  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin,
      padding:padding,
      height: height,
      color: colors,
      child: Column(
        children: [
          Row(
            mainAxisAlignment:mainAxisAlignment,
            children: [
              Text(leftTitle,style: leftTitleTextStyle,),
              Text(rightTitle,style: rightTitleTextStyle,),
            ],
          ),
          SizedBox(height: 4,),
          Row(
            mainAxisAlignment:mainAxisAlignment,
            children: [
              Text(leftSubtitle,style: leftSubtitleTextStyle,),
              Text("\$$rightSubtitle",style: rightSubtitleTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
