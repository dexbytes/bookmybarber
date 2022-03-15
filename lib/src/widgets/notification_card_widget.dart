import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';


// ignore: must_be_immutable
class NotificationCardWidget extends StatelessWidget {
  final Color cardColors;
  final EdgeInsetsGeometry cardMargin;
  final EdgeInsetsGeometry cardPadding;
  final notificationCardCallBack;
  final String order;

  NotificationCardWidget({Key? key,
    this.cardColors = Colors.white,
    this.cardMargin = const EdgeInsets.only(top: 5,bottom: 5,left: 12,right: 12),
    this.cardPadding = const EdgeInsets.only(top: 15,bottom: 15,left: 6,right: 0),
    this.notificationCardCallBack,
    this.order = "#567896",


  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    List<NotificationCardList> list = [
      NotificationCardList(
        title: 'Order Arrived',
        icon: 'assets/images/notification_delivery_icon.svg',
        colors: Color(0xffFF7642),
        subtitle: 'Order #567896 has been completed & arrived at the destination address.',
        time: '12:35 PM',
      ),
      NotificationCardList(
        title: 'Order Success',
        icon: 'assets/images/notification_order_icon.svg',
        colors: Color(0xff2473F2),
        subtitle: 'Order #567896 has been success. Please wait for the product to be sent.',
        time: '12:35 PM',
      ),
      NotificationCardList(
        title: '40% Discount on Beko',
        icon: 'assets/images/notification_promo_icon.svg',
        colors: Color(0xff12B39A),
        subtitle: 'All of the Beko products available with 40% exclusive discount.',
        time: '12:35 PM',
      ),
      NotificationCardList(
        title: 'Address Upadated',
        icon: 'assets/images/notification_delivery_icon.svg',
        colors: Color(0xffFF7642),
        subtitle: 'Your payment and shipping address has been updated successfully.',
        time: '12:35 PM',
      ),

    ];


    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return  Container(
          margin: cardMargin,
          padding: cardPadding,
          decoration: BoxDecoration(
            color: cardColors,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                this.notificationCardCallBack?.call(0);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    color: list[index].colors,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:Colors.transparent,
                        ),
                        child:Align(
                          alignment: Alignment.center,
                          child:iconApps.iconImage(
                              imageUrl: list[index].icon,imageColor: Colors.white),
                        )
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Column(
                        mainAxisAlignment :MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Html(data:list[index].title,
                            style: {'html' : Style(
                              fontSize: FontSize.large,
                              lineHeight: LineHeight(0.5),
                              color: !isDarkMode ?Colors.black: Color(0xFFCCA76A),
                              height: 20,
                              fontWeight: FontWeight.w600,

                            )},
                          ),
                          SizedBox(height: 1),
                          Html(data: list[index].time,
                            style: {'html' : Style(
                              fontSize: FontSize.medium,
                              lineHeight: LineHeight(0.5),
                              color: Color(0xff828588),
                              height: 16,
                              fontWeight: FontWeight.w400,

                            )},
                          ),

                          Html(data: list[index].subtitle,
                            style: {'html' : Style(
                              fontSize: FontSize.large,
                              lineHeight: LineHeight(1.4),
                              color:Color(0xff828588),
                              height: 55,
                              fontWeight: FontWeight.w400,

                            )},
                          ),

                          // Text("11:50 PM"),
                          // Text(" Order #567896 has been success.\n Please wait for the product to be sent."),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}

class NotificationCardList {
  final String title;
  final Color colors;
  final String icon;
  final String subtitle;
  final String time;

  NotificationCardList({
    required this.title,
    required this.colors,
    required this.icon,
    required this.subtitle,
    required this.time,
  });
}