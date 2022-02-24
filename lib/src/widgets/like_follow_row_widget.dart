import 'package:flutter/material.dart';

class LikeFollowRowWidget extends StatelessWidget {
  final String? leftTitle;
  final String? rightTitle;
  final String? centerTitle;
  final int? leftValue;
  final int? rightValue;
  final int? centerValue;
  final TextStyle titleTextStyle;
  final TextStyle valueTextStyle;
  final EdgeInsetsGeometry margin;
  const LikeFollowRowWidget(
      {Key? key,
        this.leftValue,
        this.rightValue,
        this.centerValue,
        this.leftTitle,
        this.rightTitle,
        this.centerTitle,
        this.titleTextStyle = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),
        this.valueTextStyle = const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
        this.margin = const EdgeInsets.only(left: 20,right: 20),

      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("$leftValue", style: valueTextStyle),
              SizedBox(height: 4,),
              Text("$leftTitle", style:titleTextStyle),
            ],
          ),
          Column(
            children: [
              Text("$centerValue",style: valueTextStyle,),
              SizedBox(height: 4,),
              Text("$centerTitle",style: titleTextStyle,),
            ],
          ),
          Column(
            children: [
              Text("$rightValue",style: valueTextStyle,),
              SizedBox(height: 4,),
              Text("$rightTitle",style: titleTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
