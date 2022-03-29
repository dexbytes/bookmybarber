import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
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
            padding: EdgeInsets.only(bottom: 10.0,left: 12,),
            child: Text("Available slot",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:!isDarkMode? Colors.black :Colors.white)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:12,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                selectedColor: !isDarkMode ?appColors.buttonColor2:Color(0xff00B2AE),
                backgroundColor:!isDarkMode ?appColors.grey.withOpacity(0.3):appColors.appBgColor3,
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
            padding: EdgeInsets.only(bottom: 10.0,left: 12,),
            child: Text("Select specialist",
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
            child: Text("Select your date",
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: !isDarkMode?Colors.black:Color(0xffCCA76A))),
          ),
          Container(
            margin:EdgeInsets.only(top: 12) ,
            height: 66,
            child: DatePickerWidget(isShowMonthName: true,hintText: "Select your date",),
          ),
        ],
      );
    }




    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Continue",
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


    return Scaffold(
      backgroundColor:!isDarkMode? Colors.white: AppColors().appBgColor2,
      body: SafeArea(
        top: false,
        bottom: true,
        right: false,
        left: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child:_topView(),
            ),
            ContainerFirst(
              appBackgroundColor: Colors.transparent,
              contextCurrentView: context,
              // scrollPadding: EdgeInsets.only(bottom: 0),
              /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
              isSingleChildScrollViewNeed: true,
              isFixedDeviceHeight: true,
              appBarHeight: 60,
              appBar: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 12),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book Appointment",
                          style:TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors().textNormalColor6
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              containChild:Container(
                height: size.height/0.88,
                child: Stack(
                  children: [
                    bottomCardView,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:bottomButton(),
            ),
          ],
        ),
      ),
    );

    // return ContainerFirst(
    //   appBackgroundColor: Colors.transparent,
    //   contextCurrentView: context,
    //   // scrollPadding: EdgeInsets.only(bottom: 0),
    //   /* statusBarColor: Colors.amber,
    //             bottomBarSafeAreaColor: Colors.amber,*/
    //   isSingleChildScrollViewNeed: true,
    //   isFixedDeviceHeight: true,
    //   appBarHeight: 60,
    //   appBar: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       IconButton(
    //         padding: EdgeInsets.only(left: 12),
    //         onPressed: (){
    //           Navigator.pop(context);
    //         },
    //         icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
    //       ),
    //       Expanded(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text("Book Appointment",
    //               style:TextStyle(
    //                   fontSize: 22,
    //                   fontWeight: FontWeight.w800,
    //                   color: AppColors().textNormalColor6
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    //   containChild:Container(
    //     height: size.height,
    //     width: size.height,
    //     child: Stack(
    //       children: [
    //         _topView(),
    //         bottomCardView,
    //       ],
    //     ),
    //   ),
    //
    // );
  }
}

