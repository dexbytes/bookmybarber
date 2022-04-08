import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/notification_card_widget.dart';
import 'package:base_flutter_app/src/widgets/notification_circular_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    Widget notificationCircle = Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: NotificationCircularWidget(),
    );

    Widget notificationCard = Container(
      height: MediaQuery.of(context).size.height,
      child: NotificationCardWidget(
        cardColors: !isDarkMode ?Colors.grey.withOpacity(0.25):AppColors().appBgColor3,
      ),
    );




    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child:ContainerFirst(
        appBackgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
          contextCurrentView: context,
          // scrollPadding: EdgeInsets.only(bottom: 0),
          /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          appBarHeight: 60,
          appBar: Container(
            // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
            child: appBarWithBackArrow(
                isTitleVisible: true,
                isTrailingIconVisible: false,
                title: appString.trans(context, appString.notificationHeading),
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
          containChild: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              notificationCircle,
              SizedBox(height: 8,),
              notificationCard ,
            ],
          ),
        ),
    );
  }
}
