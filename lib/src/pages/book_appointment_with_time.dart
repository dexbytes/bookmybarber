import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_time_widget.dart';
import 'package:base_flutter_app/src/widgets/date_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'booking_detail_payment_screen.dart';

class BookAppointmentTimeScreen extends StatefulWidget {
  final double price;

  const BookAppointmentTimeScreen({Key? key, this.price = 280.30}) : super(key: key);

  @override
  _BookAppointmentTimeScreenState createState() => _BookAppointmentTimeScreenState();
}

class _BookAppointmentTimeScreenState extends State<BookAppointmentTimeScreen> {
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;

    _topView() {
      return Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              child: ShaderMask(
                shaderCallback: (bound) =>LinearGradient(
                  colors: [Colors.black38.withOpacity(0.4),Colors.black87.withOpacity(0.1)],
                  begin:Alignment.topRight,
                  end: Alignment.bottomRight,
                ).createShader(bound),
                blendMode: BlendMode.darken,
                child:CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height /3,
                  imageUrl: "https://media.california.com/media/_versions/articles/hairstyle_trends__6720x4480___v1222x580.jpg",
                  fit:BoxFit.cover,
                ),
              )
          ),
        ],
      );
    }

    time(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0,left: 16,),
            child: Text(appString.trans(context, appString.availableSlot),
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color:!isDarkMode? Colors.black :Colors.white)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:12,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                isSecondColorShow: !isDarkMode?true:false,
                selectedColor: !isDarkMode ?appColors.buttonColor2:Color(0xff00B2AE),
                backgroundColor:!isDarkMode ?appColors.grey.withOpacity(0.15):appColors.appBgColor3,
                reportList: [
                  "9:30 AM","10:00 AM","10:30 AM","11:00 AM",
                  "11:30 AM","12:00 PM","1:30 PM","2:00 PM",
                  "02:30 PM","3:00 PM", "3:30 PM","4:00 PM",
                  "4:30 PM","5:00 PM","5:30 PM","6:00 PM",

                ],)),
        ],
      );
    }

    barberRow(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0,left: 18,),
            child: Text(appString.trans(context, appString.selectSpecialist),
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: !isDarkMode?Colors.black:Color(0xffCCA76A))),
          ),
          Container(
              margin:EdgeInsets.only(top: 8) ,
              height: 100,
              child:BarberSpecialistCircularWidget(
                // ignore: unrelated_type_equality_checks
                isSecondDataVisible: false,
                isFeatureVisible: false,
                isBorderSelectVisible: true,
                // onClickCardCallBack: (){},
              )),
        ],
      );
    }


    dateView(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.0,left:20,),
            child: Text(appString.trans(context, appString.selectDate),
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: !isDarkMode?Colors.black:Color(0xffCCA76A))),
          ),
          Container(
            margin:EdgeInsets.only(top: 15) ,
            height: 66,
            child: DatePickerWidget(isShowMonthName: true,hintText:appString.trans(context, appString.selectDate)),
          ),
        ],
      );
    }


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,),
        child:CommonButton(
          buttonHeight: 50,
          buttonName:appString.trans(context, appString.continueBt),
          buttonColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color:!isDarkMode? Colors.white: Color(0xff212327),),
          backCallback:(){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: BookingDetailPaymentScreen()),
            );
          },
          isBottomMarginRequired: false,
        ),
      );
    }

    Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/6.6,
      child: Container(
        padding: EdgeInsets.only(top: 0),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color:!isDarkMode? Colors.white: AppColors().appBgColor2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  SizedBox(height: 5),
           Expanded(child: ListView(
             shrinkWrap: true,
             physics: ClampingScrollPhysics(),
             children: [
               dateView(),
               SizedBox(height: 15),
               barberRow(),
               SizedBox(height: 20),
               time(),

             ],
           ),)
            // bottomButton(),
          ],
        ),
      ),
    );


    return  ContainerFirst(
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
      contextCurrentView: context,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar:Container(
        child: appBarWithBackArrow(
          // backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: appString.trans(context, appString.bookAppointment),
            textStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
            ),
            leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
            leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 25),
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      containChild:Stack(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                dateView(),
                SizedBox(height: 15),
                barberRow(),
                SizedBox(height: 20),
                time(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:bottomButton(),
          ),
        ],
      ),
    );
  }
}

