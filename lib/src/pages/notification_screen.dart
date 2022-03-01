import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/notification_card_widget.dart';
import 'package:base_flutter_app/src/widgets/notification_circular_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {


    Widget notificationCircle = Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: NotificationCircularWidget(),
    );

    Widget notificationCard = Container(
      height: MediaQuery.of(context).size.height,
      child: NotificationCardWidget(
        cardColors: AppColors().appBgColor3,
      ),
    );




    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child:ContainerFirst(
          appBackgroundColor: AppColors().appBgColor2,
          statusBarColor: AppColors().appBgColor3,
          contextCurrentView: context,
          // scrollPadding: EdgeInsets.only(bottom: 0),
          /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          appBarHeight: 70,
          appBar: Container(
            color: AppColors().appBgColor3,
            child: appBarWithBackArrow(
                isTitleVisible: true,
                isTrailingIconVisible: false,
                leadingIconColor:Color(0xFFCCA76A),
                title: "Notification",
                textStyle: TextStyle(color: Color(0xFFCCA76A),fontSize: 18,fontWeight: FontWeight.w500),
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
