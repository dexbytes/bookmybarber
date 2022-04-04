import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/booking_screen.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_time_widget.dart';
import 'package:base_flutter_app/src/widgets/date_picker.dart';
import 'package:base_flutter_app/src/widgets/my_booking_detail_card_widget.dart';
import 'package:base_flutter_app/src/widgets/my_booking_detail_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dashboard_screen.dart';

class ReBookingScreen extends StatefulWidget {
  const ReBookingScreen({Key? key,}) : super(key: key);
  @override
  _ReBookingScreenState createState() => _ReBookingScreenState();
}

class _ReBookingScreenState extends State<ReBookingScreen> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    Widget topView =  Material(
        color:!isDarkMode ?Colors.white:AppColors().appBgColor3,
        elevation: 1,
        borderRadius:BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),),
        child:Container(
            decoration: BoxDecoration(
                color:!isDarkMode ?Colors.white:AppColors().appBgColor3,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)
            ),
            // height: 275,
            margin: EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                SizedBox(height: 15,),
                BookingDetailCardView(
                  imageHeight: 65,
                  isShowMessageIcon: true,
                  salonTextStyle:TextStyle(fontSize: 18.5,fontWeight: FontWeight.w600, height: 0, color: !isDarkMode ?Colors.black:Colors.white,),
                  addressTextStyle:TextStyle(fontSize: 14.5,fontWeight: FontWeight.w400, height: 0,color: !isDarkMode ?Colors.black:Colors.white.withOpacity(0.9),),
                  stylistNameTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,height: 0,color:!isDarkMode ?Colors.black:Colors.white),
                  servicesTextStyle: TextStyle(fontSize: 13.5,fontWeight: FontWeight.w500,height: 0,color:!isDarkMode ?Colors.black:Colors.white),

                ),
                // BookingDetailPaymentCard(),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                  height: 48,
                  decoration: BoxDecoration(
                      color: !isDarkMode? AppColors().textFiledColor.withOpacity(0.12):AppColors().appBgColor2,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( "Total:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: !isDarkMode ?Colors.black:AppColors().white,
                        ),),
                      SizedBox(width: 5,),
                      Text("\$45.00",
                        style: TextStyle(
                          backgroundColor: Colors.transparent,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:!isDarkMode ?AppColors().red:Color(0xff14D9D4),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 15,right: 15,top: 8),
                //   padding: EdgeInsets.only(left: 30,),
                //   height: 48,
                //   decoration: BoxDecoration(
                //       color: !isDarkMode? AppColors().textFiledColor.withOpacity(0.12):AppColors().appBgColor2,
                //       borderRadius: BorderRadius.circular(40)
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(CupertinoIcons.calendar_today,size: 26,color: !isDarkMode? AppColors().greyUnselected:AppColors().textHeadingColor1,),
                //       SizedBox(width: 15,),
                //       Text("Friday,",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?Colors.black:Colors.white),),
                //       Text("25 March 2022",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?Colors.black:Colors.white),),
                //       Text(" @ ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: !isDarkMode?Color(0xffFE9654):Color(0xFFCCA76A)),),
                //       Text("8:30am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?Colors.black:Colors.white),),
                //     ],
                //   ),
                // )

              ],
            )
        ));

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 25,right: 25,),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Continue",
          buttonColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color:  !isDarkMode?Colors.white :Color(0xff212327),),
          backCallback:(){
            alertDialog(context);
          },
          isBottomMarginRequired: false,
        ),
      );
    }

    Widget services = Container(
        //height: 110,
        child: BookingDetailServicesCardView(isShowCrossIcon: true,),
    );


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

    time(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0,left: 18,),
            child: Text("Available slot",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:!isDarkMode? Colors.black :Colors.white)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:12,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                isSecondColorShow: !isDarkMode?true:false,
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



    return Scaffold(
      backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,
              imageColor: !isDarkMode? Colors.black:appColors.textHeadingColor1,
              iconSize: Size(21, 21)),
        ),
        elevation: 0.5,
        backgroundColor:  !isDarkMode?appColors.white:appColors.appBgColor3,
        centerTitle: true,
        title: Text("ReBooking Details",
          style:TextStyle(
              color:  !isDarkMode? Colors.black:appColors.textHeadingColor1,
              fontSize: 22,fontWeight: FontWeight.w700),
        ),
      ),
      // PreferredSize(
      //   child:  Container(
      //     color: !isDarkMode ?Colors.white:AppColors().appBgColor3,
      //     child: Padding(
      //       padding: EdgeInsets.only(top: 40.0),
      //       child: appBarWithBackArrow(
      //           backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
      //           isTitleVisible: true,
      //           leadingPadding: EdgeInsets.only(left: 10.0,
      //               right: 20,bottom: 5,top: 0),
      //           textStyle: TextStyle(fontSize: 22,color:!isDarkMode?AppColors().black:AppColors().textHeadingColor1,fontWeight: FontWeight.w700),
      //           isTrailingIconVisible: false,
      //           leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
      //           leadingIconSize:  Size(28,28),
      //           title: "ReBooking Details",
      //           onPress: (){
      //             Navigator.pop(context);
      //           }
      //       ),
      //     ),
      //   ),
      //   preferredSize: Size(appDimens.widthFullScreen(),65.0),
      // ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
        children: [
          ListView(
            physics: ClampingScrollPhysics(),
            children: [
            topView,
            SizedBox(height: 25,),
            services,
            SizedBox(height: 20,),
            dateView(),
            SizedBox(height: 20,),
            time(),
            SizedBox(height: 85,),
          ],),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomButton(),
          )
        ],
    ),
      ),
      );
    // return Scaffold(
    //   backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
    //   body: SafeArea(
    //     top: false,
    //     bottom: true,
    //     child: Stack(
    //       children: [
    //
    //         ContainerFirst(
    //           appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
    //           reverse: false,
    //           contextCurrentView: context,
    //           bottomBarSafeAreaColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
    //           statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
    //           // scrollPadding: EdgeInsets.only(bottom: 0),
    //           /* statusBarColor: Colors.amber,
    //               bottomBarSafeAreaColor: Colors.amber,*/
    //           isSingleChildScrollViewNeed: true,
    //           isFixedDeviceHeight: true,
    //           appBarHeight : 60,
    //           appBar: Container(
    //             color: !isDarkMode ?Colors.white:AppColors().appBgColor3,
    //             child: Padding(
    //               padding: EdgeInsets.only(bottom: 8.0),
    //               child: appBarWithBackArrow(
    //                   backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
    //                   isTitleVisible: true,
    //                   leadingPadding: EdgeInsets.only(left: 10.0,
    //                       right: 20,bottom: 5,top: 0),
    //                   textStyle: TextStyle(fontSize: 22,color:!isDarkMode?AppColors().black:AppColors().textHeadingColor1,fontWeight: FontWeight.w700),
    //                   isTrailingIconVisible: false,
    //                   leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
    //                   title: "ReBooking Details",
    //                   onPress: (){
    //                     Navigator.pop(context);
    //                   }
    //               ),
    //             ),
    //           ),
    //           containChild: Container(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 topView,
    //                 SizedBox(height: 25,),
    //                 services,
    //                 SizedBox(height: 20,),
    //                 dateView(),
    //                 SizedBox(height: 20,),
    //                 time(),
    //                 SizedBox(height: 85,),
    //
    //               ],
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //           child: bottomButton(),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }


  void alertDialog(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              // height: MediaQuery.of(context).size.height/2.1,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: !isDarkMode? AppColors().white:AppColors().appBgColor3,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  iconApps.iconImage(
                    imageUrl: iconApps.rightWithBackgroundIcon,
                  ),
                  SizedBox(height: 25,),
                  Text("Your appointment booking is successfully.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:!isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "You can view the appointment booking\n info in the",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:AppColors().textNormalColor8
                          ),
                          children: [
                            TextSpan(
                              text:" \"Appointment\" ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color:!isDarkMode? Colors.black :AppColors().textNormalColor6
                              ),
                            ),
                            TextSpan(
                              text:"section",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors().textNormalColor8
                              ),
                            ),
                          ]
                      )),
                  // Text("You can view the appointment booking\n info in the ${text} section",
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w500,
                  //       color: AppColors().textNormalColor8
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(height: 45,),
                  CommonButton(
                    buttonHeight: 50,
                    buttonName: "Continue Booking",
                    buttonColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
                    textStyle: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: !isDarkMode? Colors.white:Color(0xff212327),
                    ),
                    backCallback:(){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        return DashBoardPage();
                      }), (route) => false);
                    },
                    isBottomMarginRequired: false,
                  ),
                  SizedBox(height: 25,),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          SlideRightRoute(
                              widget: BookingScreen(
                                isShowBackArrow: true,
                                isBackArrowNavigation: true,
                              )),
                        );
                      },
                      child: Text("Go to appointment",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:  !isDarkMode? AppColors().textNormalColor8:AppColors().textHeadingColor1
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );

        });

  }
}

