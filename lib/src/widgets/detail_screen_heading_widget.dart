import 'package:flutter/material.dart';

class DetailHeadingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color colors;
  final double height;


  const DetailHeadingWidget({Key? key,
    this.title = "RedBox Barber Salon",
    this.subtitle = "445 Morgan Camp, New Deltaton,NY,Iran",
    this.titleTextStyle = const TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Colors.white),
    this.subtitleTextStyle = const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color:Colors.white),
    this.margin = const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.colors = Colors.transparent,
    this.padding = const EdgeInsets.only(top: 0,bottom: 0),
    this.height = 24,



  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin,
      padding:padding,
      height: height,
      color: colors,
      child: Column(
        mainAxisAlignment:mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleTextStyle,textAlign: TextAlign.start,),
          SizedBox(height: 3,),
          Text(subtitle,style: subtitleTextStyle,textAlign: TextAlign.start,),
        ],
      ),
    );
  }
}
