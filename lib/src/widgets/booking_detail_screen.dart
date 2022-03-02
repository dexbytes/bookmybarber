import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_booking_cost_card.dart';
import 'my_booking_detail_card_widget.dart';
import 'my_booking_detail_service_card.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({Key? key,}) : super(key: key);
  @override
  _BookingDetailScreenState createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {

  @override
  Widget build(BuildContext context) {


    Widget salonList =Container(
        height: 130,
        child: BookingDetailCardView()
    );

 Widget services =Container(
       height: 95,
        child: Column(
          children: [
            SeeAllTextRow(
              leftTitle: "Services",
              leftTitleTextStyle: TextStyle(fontSize: 14.5,fontWeight: FontWeight.w500,color: Colors.white),
              isRightTextVisible: false,
            ),
            SizedBox(height: 5,),
            BookingDetailServicesCardView(),
          ],
        )
    );

 Widget cost = Container(
        height: 162,
        child: Column(
          children: [
            SeeAllTextRow(
              leftTitle: "Price Details",
              leftTitleTextStyle: TextStyle(fontSize: 14.5,fontWeight: FontWeight.w500,color: Colors.white),
              isRightTextVisible: false,
            ),
            SizedBox(height: 5,),
            BookingDetailCostCardView(),
          ],
        )
    );


  Widget payment =Container(
        height: 45,
        child: Container(
          padding: EdgeInsets.only(left: 20 ,right: 20,top: 12,bottom: 5),
          margin: EdgeInsets.only(right: 15,left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors().appBgColor3,

          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment mode", style: TextStyle(fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
                Text("Cash", style: TextStyle(fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color:AppColors().textHeadingColor1,),),
              ],
            ),
          ),
        )
    );


  Widget topText = Container(
        height: 60,
        child: Container(
          padding: EdgeInsets.only(left: 12 ,right: 18,top: 12,bottom: 5),
          color: AppColors().appBgColor3,
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("20 Jun 2022 at 1:00 PM", style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                   SizedBox(height: 4,),
                    Text("Appointment ID: TONI123", style: TextStyle(fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text("COMPLETED", style: TextStyle(fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color:Colors.green),),
                ),
              ],
            ),
          ),
        )
    );

  Widget coupon  = Container(
        height: 58,
        child: Container(
          padding: EdgeInsets.only(left: 12 ,right: 18,top: 12,bottom: 5),
          margin: EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
              color: AppColors().appBgColor3,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                iconApps.iconImage(imageUrl: iconApps.discountIcon,imageColor: Colors.white,iconSize: Size(21, 21)),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Save50", style: TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                   SizedBox(height: 2,),
                    Text("You saved additional \$50", style: TextStyle(fontSize: 10.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors().textHeadingColor1)),
                  ],
                ),
              ],
            ),
          ),
        )
    );





    return ContainerFirst(
      appBackgroundColor:  Color(0xff212327),
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: Color(0xff212327),
      statusBarColor: Color(0xff212327),
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight : 66,
      appBar: Container(
        color: AppColors().appBgColor3,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            textStyle: TextStyle(fontSize: 20,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
            isTrailingIconVisible: false,
            leadingIconColor:Color(0xFFCCA76A),
            title: "Booking Details",
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      containChild: Container(
        color:  Color(0xff212327),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topText,
            SizedBox(height: 15,),
            salonList,
            SizedBox(height: 10,),
            services,
            SizedBox(height: 15,),
            coupon,
            SizedBox(height: 10,),
            cost,
            SizedBox(height: 20,),
            payment,
            SizedBox(height: 20,),
          ],
        ),
      ),
    );

  }
}

