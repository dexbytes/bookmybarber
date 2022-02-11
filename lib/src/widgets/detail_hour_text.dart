import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailHourView extends StatelessWidget {
  final String days;
  final String time;
  final TextStyle daysTextStyle;
  final TextStyle timeTextStyle;
  final Widget? icon;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color colors;
  final onMapCallBack;
  final double height;


  const DetailHourView({Key? key,
    this.days = "Monday \- Friday",
    this.time = "8:30 AM \- 9:30PM",
    this.margin = const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.colors = Colors.transparent,
    this.onMapCallBack,
    this.padding = const EdgeInsets.only(top: 0,bottom: 0),
    this.height = 24,
    this.icon,
    this.daysTextStyle = const TextStyle(fontSize: 15,color:Color(0xff828588),fontWeight: FontWeight.w500),
    this.timeTextStyle = const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),


  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin,
      padding:padding,
      height: height,
      color: colors,
      child:
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.circle,size: 10,color: Color(0xff00B2AE),),
              SizedBox(width: 8,),
              Text(days,
              style: daysTextStyle),

            ],
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(time,
                style: timeTextStyle),
              ],
            ),
          )
        ],
      )
    );
  }
}