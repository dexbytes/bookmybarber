import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailAddressView extends StatelessWidget {
  final String address;
  final String direction;
  final Widget? icon;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color colors;
  final onMapCallBack;
  final double height;


  const DetailAddressView({Key? key,
    this.address = "030 Zulauf Green, O'Konville, SD, Unites States of America",
    this.direction =  "Get directions ~ 4.2 Km",
    this.margin = const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.colors = Colors.transparent,
    this.onMapCallBack,
    this.padding = const EdgeInsets.only(top: 0,bottom: 0),
    this.height = 24,
    this.icon,


  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      margin:margin,
      padding:padding,
      height: height,
      color: colors,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SeeAllTextRow(
                  margin: EdgeInsets.only(left: 10,bottom: 0),
                  leftTitle: appString.trans(context, appString.address),
                  isRightTextVisible: false,
                  leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color:!isDarkMode? Colors.black:Colors.white) ,
                ),

                Html(data: address,
                  style: {'html' : Style(
                      fontSize: FontSize.large,
                      lineHeight: LineHeight(1.25),
                      color: Color(0xff828588),
                      height: 48,
                      fontWeight: FontWeight.w500,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      maxLines: 2
                  )},
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 8),
                        child: icon ??
                        Icon(CupertinoIcons.location_fill,color:!isDarkMode?appColors.buttonColor2 :Color(0xffCCA76A),size: 18,)
                       // iconApps.iconImage(imageUrl: iconApps.detailAppbarIcon,iconSize: Size(20, 20))
                    ),

                    Expanded(
                      child: Html(data: direction,
                        style: {'html' : Style(
                            fontSize: FontSize.medium,
                            lineHeight: LineHeight(0.5),
                            color: !isDarkMode?appColors.buttonColor2 :Color(0xffCCA76A),
                            height: 20,
                            fontWeight: FontWeight.w500,
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            maxLines: 2
                        )},
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          InkWell(
            onTap: (){
              this.onMapCallBack.call();
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: "http://www.mantri.in/espana/images/locationmap.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
