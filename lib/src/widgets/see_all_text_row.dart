import 'package:flutter/material.dart';

class SeeAllTextRow extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final TextStyle leftTitleTextStyle;
  final TextStyle rightTitleTextStyle;
  final bool isRightTextVisible;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color colors;
  final leftTextCallBack;
  final rightTextCallBack;
  final double height;


  const SeeAllTextRow({Key? key,
    this.leftTitle = "Categories",
    this.rightTitle = "View all",
    this.leftTitleTextStyle = const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
    this.rightTitleTextStyle = const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xFFCCA76A)),
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
          GestureDetector(
              onTap: (){
                this.leftTextCallBack?.call(0);
                print("Categories");
              },
              child: Text(leftTitle,
                style: leftTitleTextStyle,
              )),
          Visibility(
            visible: isRightTextVisible,
            child: InkWell(
                onTap: (){
                  this.rightTextCallBack?.call();
                  print("sell All");
                },
                child: Text(rightTitle,style: rightTitleTextStyle,)),
          ),
        ],
      ),
    );
  }
}
