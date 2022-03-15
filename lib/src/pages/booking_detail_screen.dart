import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/my_booking_cost_card.dart';
import 'package:base_flutter_app/src/widgets/my_booking_detail_card_widget.dart';
import 'package:base_flutter_app/src/widgets/my_booking_detail_service_card.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({Key? key,}) : super(key: key);
  @override
  _BookingDetailScreenState createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    Widget salonList =Container(
        height: 130,
        child: BookingDetailCardView()
    );

    Widget services =Container(
        height: 110,
        child: Column(
          children: [
            SeeAllTextRow(
              leftTitle: "Services",
              leftTitleTextStyle: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color:!isDarkMode ?Colors.black:Colors.white),
              isRightTextVisible: false,
            ),
            SizedBox(height: 5,),
            BookingDetailServicesCardView(),
          ],
        )
    );

    Widget cost = Container(
        height: 195,
        child: Column(
          children: [
            SeeAllTextRow(
              leftTitle: "Payment Details",
              leftTitleTextStyle: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color:!isDarkMode ?Colors.black:Colors.white),
              isRightTextVisible: false,
            ),
            SizedBox(height: 5,),
            BookingDetailCostCardView(),
          ],
        )
    );


    Widget payment = Container(
        height: 55,
        child: Container(
          padding: EdgeInsets.only(left: 20 ,right: 20,top: 12,bottom: 5),
          margin: EdgeInsets.only(right: 15,left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: !isDarkMode ?Colors.grey.withOpacity(0.35):AppColors().appBgColor3,

          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment mode", style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color:!isDarkMode ?Colors.black: Colors.white)),
                Text("Cash", style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:!isDarkMode ?Colors.black: Colors.white),),
              ],
            ),
          ),
        )
    );


    Widget topText = Container(
        height: 75,
        child: Container(
          padding: EdgeInsets.only(left: 12 ,right: 18,top: 12,bottom: 5),
          color: !isDarkMode ?Colors.grey.shade100:AppColors().appBgColor3,
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("20 Jun 2022 at 1:00 PM", style: TextStyle(fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: !isDarkMode ?Colors.black:Colors.white
                    )),
                    SizedBox(height: 4,),
                    Text("Appointment ID: TONI123", style: TextStyle(fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color:!isDarkMode ?Colors.black:Colors.white)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text("COMPLETED", style: TextStyle(fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color:Colors.green),),
                ),
              ],
            ),
          ),
        )
    );

    Widget coupon  = Container(
        height: 65,
        child: Container(
          padding: EdgeInsets.only(left: 12 ,right: 18,top: 12,bottom: 5),
          margin: EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
              color: !isDarkMode ?Colors.grey.withOpacity(0.35):AppColors().appBgColor3,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                iconApps.iconImage(imageUrl: iconApps.discountIcon,imageColor:!isDarkMode ?AppColors().red:AppColors().white
                    ,iconSize: Size(25, 25)),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Save50", style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:!isDarkMode ?Colors.black:AppColors().white,)),
                    SizedBox(height: 2,),
                    Text("You saved additional \$50", style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: !isDarkMode ?AppColors().red:AppColors().textHeadingColor1)),
                  ],
                ),
              ],
            ),
          ),
        )
    );



    return ContainerFirst(
      appBackgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: Color(0xff212327),
      statusBarColor: AppColors().appBgColor3,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight : 135,
      appBar: Column(
        children: [
          Container(
            color: !isDarkMode ?Colors.white:AppColors().appBgColor3,
            child: appBarWithBackArrow(
                backgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor3,
                isTitleVisible: true,
                leadingPadding: EdgeInsets.only(left: 10.0 ,
                    right: 10,bottom: 0,top: 0),
                textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w700),
                isTrailingIconVisible: false,
                leadingIconColor:Color(0xFFCCA76A),
                title: "Booking Details",
                onPress: (){
                  Navigator.pop(context);
                }
            ),
          ),
          topText,
        ],
      ),
      containChild: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            salonList,
            SizedBox(height: 10,),
            services,
            SizedBox(height: 10,),
            cost,
            SizedBox(height: 15,),
            coupon,
            SizedBox(height: 20,),
            payment,
            SizedBox(height: 20,),
          ],
        ),
      ),
    );

  }
}

