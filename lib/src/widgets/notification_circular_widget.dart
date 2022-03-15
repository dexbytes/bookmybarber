import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class NotificationCircularWidget extends StatelessWidget {
  final onClickCardCallBack;

  NotificationCircularWidget({Key? key,
    this.onClickCardCallBack

  }) : super(key: key);



  List<NotificationList> notification = [
    NotificationList(
      title: 'Promos',
      icon: 'assets/images/notification_promo_icon.svg',
      colors: Color(0xff12B39A),
    ),
    NotificationList(
      title: 'Order',
      icon: 'assets/images/notification_order_icon.svg',
      colors: Color(0xff2473F2),
    ),
    NotificationList(
      title: 'Delivery',
      icon: 'assets/images/notification_delivery_icon.svg',
      colors: Color(0xffFF7642),
    ),
    NotificationList(
      title: 'Account',
      icon: 'assets/images/notification_person_icon.svg',
      colors: Color(0xff5609B3),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: notification.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.onClickCardCallBack?.call(0);

            },
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  color: notification[index].colors,
                  child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.transparent,
                      ),
                      child:Align(
                        alignment: Alignment.center,
                        child:iconApps.iconImage(
                            imageUrl: notification[index].icon,imageColor: Colors.white),
                      )
                  ),
                ),
                SizedBox(height: 6),
                Text(notification[index].title,style: TextStyle(fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color:!isDarkMode ?Colors.black: Color(0xFFCCA76A),
                ))
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 18,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 65
    ),
    );

  }
}

class NotificationList {
  final String title;
  final Color colors;
  final String icon;

  NotificationList({
    required this.title,
    required this.colors,
    required this.icon,
  });
}