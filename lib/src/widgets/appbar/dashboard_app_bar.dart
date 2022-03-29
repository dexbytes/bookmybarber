import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget dashboardAppBar(
    {double height = kToolbarHeight,bool isDisplayActions = true,
      Function? onPress,
      Function? onBellPress,
      Function? onSearchPress,
      List<Widget> action = const[],
      required Widget icon

    }) {


  Widget _action = Row(children: [
    IconButton(onPressed: (){
      if (onSearchPress != null) {
        onSearchPress();
      }
    },
      splashRadius: 25,
      icon: Icon(CupertinoIcons.search,color: Colors.white,size: 23.5,),
      // icon: iconApps.iconImage(
      // imageUrl: iconApps.bottomMenuSearch,imageColor: Colors.white,iconSize: Size(18, 18)),
    ),
    Container(
      child: icon,
    ),
  ],);

  Widget _leading = Row(children: [
    Container(
      child: IconButton(
        icon: iconApps.iconImage(imageUrl: iconApps.closeIcon,iconSize: Size(15, 18)),
        onPressed: () {
          if (onPress != null) {
            onPress();
          }
        },
      ),
    )
  ],);


  Widget _title = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.wb_sunny,color: Colors.white,size: 20,),
          SizedBox(width: 2,),
          Text("SHOPPIR",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),),
        ],
      ),
      Text("Express Shopping",style: TextStyle(fontSize: 11.5,fontWeight: FontWeight.w400,color: Colors.white),textAlign: TextAlign.start,),
    ],
  );

  Map<String, dynamic> setting = MainAppBloc.configTheme.containsKey("setting")
      ? MainAppBloc.configTheme["setting"]
      : {};
  bool isDisplaySideDrawer = true;
  if(setting.containsKey("isDisplaySideDrawer"))
  {
    isDisplaySideDrawer = setting["isDisplaySideDrawer"];
  }

  return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:EdgeInsets.only(left: isDisplaySideDrawer ? 7 :10,right: 8,top: 3),
              child: Align(
                alignment: Alignment.centerLeft,
                child: isDisplaySideDrawer ?_leading :Container(),
              ),
            ),
            Flexible(
              child: _title,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: _action,
              ),
            ),

          ],
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

