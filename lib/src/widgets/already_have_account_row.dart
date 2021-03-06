import 'package:flutter/material.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  final TextStyle leftTextStyle;
  final TextStyle rightTextStyle;
  final String? imageIcon;
  final double borderRadius;
  final Color color;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? margin;
  final signInCallBack;
  final EdgeInsetsGeometry? padding;

  const AlreadyHaveAccountRow(
      {Key? key,
        this.leftText ="Already have an account\? ",
        this.rightText ="Sign in",
        this.leftTextStyle = const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),
        this.rightTextStyle = const TextStyle(fontSize: 15.5,fontWeight: FontWeight.w600,color:Color(0xffFE9654)),
        this.borderRadius = 40,
        this.color = Colors.black,
        this.fontWeight = FontWeight.w800,
        this.imageIcon,
        this.margin,
        this.padding,
        this.signInCallBack,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: margin ?? EdgeInsets.symmetric(horizontal: 0,),
        padding: padding ?? EdgeInsets.only(left: 0,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(leftText,
            style: leftTextStyle
            ),
            SizedBox(width: 5,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  this.signInCallBack?.call();
                  print("click on sign in");
                },
                child: Text(rightText,
                  style:rightTextStyle
                ),
              ),
            )
          ],
        )
      );
  }
}
