import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

PreferredSizeWidget appBarWithBackArrow(
    {double height = kToolbarHeight,bool isDisplayActions = true,
      Function? onPress,List<Widget> action = const[],
      bool isTitleVisible = true,
      bool isTrailingIconVisible = true,
      bool isLeadingIconVisible = true,
      Color leadingIconColor = Colors.white,
      Color backgroundColor = Colors.white,
      Size  leadingIconSize = const Size(21, 21),
      EdgeInsetsGeometry?  leadingPadding,
      Widget? trailingIcon,
      String title = "",
      TextStyle textStyle = const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xff828588)),
    }) {

  var brightness = SchedulerBinding.instance!.window.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;

  Widget _action = Row(children: [
    Container(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: trailingIcon,
      ),
    )

  ],);

  Widget _leading = Row(children: [
    Container(
      child: IconButton(
        splashRadius: 30,
        icon: iconApps.iconImage(
            imageUrl: iconApps.backArrow2,
            imageColor:leadingIconColor,
            iconSize: leadingIconSize
        ),
        onPressed: () {
          // if (onPress != null) {
          onPress!();
          // }
        },
      ),
    )
  ],);


  Widget _title = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Row(
      //   children: [
      //     // Icon(Icons.wb_sunny,color: Colors.white,),
      //     Text("Ola Tops & Skirt",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),),
      //   ],
      // ),
      Text(title,style: textStyle,
        textAlign: TextAlign.center,),
    ],
  );


  return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: Card(
        color: !isDarkMode ? appColors.appBgColor4 :appColors.appBgColor2 ,
        margin: EdgeInsets.only(bottom: 0.6),
        elevation: 0.6,
        child: Material(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding:EdgeInsets.only(top: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: leadingPadding ?? EdgeInsets.only(left: isLeadingIconVisible ? 10.0 :60,
                      right: 10,bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Visibility(
                        visible: isLeadingIconVisible,
                        child: _leading),
                  ),
                ),
                Visibility(
                    visible: isTitleVisible,
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: _title,
                        ))),
                Padding(
                  padding: EdgeInsets.only(
                      right: isTrailingIconVisible ? 12.0
                          :80,bottom: 15),
                  child: Visibility(
                    visible: isTrailingIconVisible,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _action,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      )

    //   AppBar(
    //   centerTitle: true, // this i
    //   leading: Container(
    //     // color: Colors.green,
    //     child: IconButton(
    //       icon: const Icon(CupertinoIcons.text_alignleft),
    //       onPressed: () {
    //         if (onPress != null) {
    //           onPress();
    //         }
    //       },
    //     ),
    //   ),
    //   title: Stack(
    //     children: <Widget>[
    //       Align(
    //         alignment: Alignment.centerLeft,
    //         child: Text("SHOPPIR"),
    //       )
    //       /*    Positioned(
    //         left: leftOffset,
    //         top: defaultIconButtonPadding,
    //         child: CircleAvatar(
    //           radius: avatarRadius,
    //           child: avatar,
    //         ),
    //       ),
    //       Positioned(
    //         left: leftOffset + avatarRadius * 2 + 8.0,
    //         top: defaultIconButtonPadding + avatarRadius / 2 - titleLineHeight,
    //         child: Text(title),
    //       ),*/
    //     ],
    //   ),
    //   actions: !isDisplayActions
    //       ? <Widget>[]
    //       : <Widget>[
    //     IconButton(
    //       icon: Icon(CupertinoIcons.bell_fill),
    //       onPressed: () {},
    //     ),
    //     // IconButton(
    //     //   icon: Icon(Icons.phone),
    //     //   onPressed: () {},
    //     // ),
    //     // IconButton(
    //     //   icon: Icon(Icons.more_vert),
    //     //   onPressed: () {},
    //     // ),
    //   ],
  );
}
