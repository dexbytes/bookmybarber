import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'faq_screen.dart';

class SettingScreen extends StatefulWidget {

  const SettingScreen({Key? key,}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  bool sales = false;
  bool newArrival = false;
  bool deliveryStatus = false;

  List<SettingDataModel> settings = [
  SettingDataModel(title: "Help & Support",),
  SettingDataModel(title: "Terms & Condition",),
  SettingDataModel(title: "Rate this App",),

  ];


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget popUpNotification = Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey,width:0.15,))
      ),
      margin: EdgeInsets.only(left: 10,right: 10),
      padding: EdgeInsets.only(left: 10,
          right: 5,
          bottom: 10,
          top: 20),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( "Popup Notification",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,
              color:!isDarkMode? Colors.black.withOpacity(0.8):Colors.white ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  sales = !sales;
                });
              },
              child: Container(
                width: 55,
                height: 40,
                child: Stack(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.activeToggleBackground,imageColor: Color(0xff9B9B9B).withOpacity(0.5)),
                    Padding(
                      padding: sales ?
                      EdgeInsets.only(bottom:0.5,)
                          :EdgeInsets.only(bottom:0.5,),
                      child: Align(
                        alignment: sales
                            ?Alignment.centerRight
                            :Alignment.centerLeft,
                        child: iconApps.iconImage(
                            imageUrl: iconApps.toggleIcon,iconSize: Size(26, 26),
                            imageColor: !isDarkMode?
                            sales ? Colors.green: Colors.grey
                            :sales ?  Color(0xffE4B343) : Colors.white ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );

    Widget volumeNotification = Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey,width:0.15,))
      ),
      margin: EdgeInsets.only(left: 10,right: 10),
      padding: EdgeInsets.only(left: 10,
          right: 5,
          bottom: 10,
          top: 10),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( "Volume",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,
              color:!isDarkMode? Colors.black.withOpacity(0.8):Colors.white
          ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  newArrival = !newArrival;
                });
              },
              child: Container(
                width: 55,
                height: 40,
                child: Stack(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.activeToggleBackground,imageColor: Color(0xff9B9B9B).withOpacity(0.5)),
                    Padding(
                      padding: sales ?
                      EdgeInsets.only(bottom:0.5,)
                          :EdgeInsets.only(bottom:0.5,),
                      child: Align(
                        alignment: newArrival
                            ?Alignment.centerRight
                            :Alignment.centerLeft,
                        child: iconApps.iconImage(
                            imageUrl: iconApps.toggleIcon,iconSize: Size(26, 26),
                            imageColor: !isDarkMode?
                            newArrival ? Colors.green: Colors.grey
                            :newArrival ?  Color(0xffE4B343) : Colors.white ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );

    Widget appointmentNotification = Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey,width:0.15,))
      ),
      margin: EdgeInsets.only(left: 10,right: 10),
      padding: EdgeInsets.only(left: 10,
          right: 5,
          bottom: 10,
          top: 10),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( "Appointment Reminder",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,
              color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white
          ),
            // _appString.trans(context, _appString.groupActivityNotification),
            // style: _appStyle.settingTextStyle(fontSize: _isTablet ? 25 :16),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  deliveryStatus = !deliveryStatus;
                });
              },
              child: Container(
                width: 55,
                height: 40,
                child: Stack(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.activeToggleBackground,imageColor: Color(0xff9B9B9B).withOpacity(0.45)),
                    Padding(
                      padding: deliveryStatus ?
                      EdgeInsets.only(bottom:0.5,)
                          :EdgeInsets.only(bottom:0.5,),
                      child: Align(
                        alignment: deliveryStatus
                            ?Alignment.centerRight
                            :Alignment.centerLeft,
                        child: iconApps.iconImage(
                            imageUrl: iconApps.toggleIcon,iconSize: Size(26, 26),
                            imageColor:!isDarkMode?
                                deliveryStatus ? Colors.green: Colors.grey
                                :deliveryStatus ? Color(0xffE4B343) : Colors.white

                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );



    Widget settingList = Container(
      height: 200,
     child:  ListView.builder(
       scrollDirection: Axis.vertical,
       padding: EdgeInsets.only(left: 10,right: 10,),
       physics: NeverScrollableScrollPhysics(),
       itemCount: settings.length,
       shrinkWrap: true,
       itemBuilder: (BuildContext context, int index) {
         return Material(
           color: Colors.transparent,
           child: InkWell(
             onTap: (){
               redirectTo(index,context);
             },
             child: Container(
               padding: EdgeInsets.only(top: 12,bottom: 12),
               decoration: BoxDecoration(
                   border: Border(bottom: BorderSide(color: Colors.grey,width:0.15,))
               ),
               child: Row(
                 children: [
                   Expanded(
                     child: Html(data: settings[index].title,
                       style: {'html' : Style.fromTextStyle(
                           TextStyle(
                               fontSize: 17,
                               color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,
                               fontWeight: FontWeight.w500
                           )
                       )},
                     ),
                   ),
                   Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey.shade500,),

                 ],
               ),
             ),
           ),
         );
       },
     ),
    );


    Widget version = Container(
      // color: Colors.grey,
      height: 50,
     child: FutureBuilder(
       future: PackageInfo.fromPlatform(),
       builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
         if(snapshot.hasData)
           return Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Version: ",
                 style: TextStyle(color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
               ),Text(snapshot.data!.version,
                 style: TextStyle(color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
               ),
             ],
           );
         return Container();
       },
     ),
    );

    return ContainerFirst(
        appBackgroundColor:!isDarkMode?Colors.white:AppColors().appBgColor2,
        contextCurrentView: context,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        appBarHeight: 60,
        appBar: Container(
          color:!isDarkMode ?Colors.white:AppColors().appBgColor3,
          child: appBarWithBackArrow(
              backgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
              isTitleVisible: true,
              isTrailingIconVisible: false,
              title: "Settings",
              textStyle: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
              ),
              leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
              leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 15),
              onPress: (){
                Navigator.pop(context);
              }
          ),
        ),
        containChild: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                popUpNotification,
                volumeNotification,
                appointmentNotification,
                settingList,
                version


              ],
            ),
          ],
        ),
      );

  }


  void redirectTo(index,context) {
    if(index == 0 ){
      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: FaqScreen()),
      );
    }
  }

}

class SettingDataModel {
  final String title;

  SettingDataModel( {
    required this.title,
  });
}
