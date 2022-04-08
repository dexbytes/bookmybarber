import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/booking_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/booking_detail_payment_card.dart';
import 'package:base_flutter_app/src/widgets/payment_method_card_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'dashboard_screen.dart';

class BookingDetailPaymentScreen extends StatefulWidget {
  const BookingDetailPaymentScreen({Key? key,}) : super(key: key);
  @override
  _BookingDetailPaymentScreenState createState() => _BookingDetailPaymentScreenState();
}

class _BookingDetailPaymentScreenState extends State<BookingDetailPaymentScreen> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget paymentMethod = Container(
        color: Colors.transparent,
        height: 350,
        child: Column(
          children: [
            SeeAllTextRow(
              leftTitle:  appString.trans(context, appString.paymentMethod),
              leftTitleTextStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,
                  color: !isDarkMode ?Colors.black:Color(0xFFCCA76A)),
              rightTitle: "+ ${appString.trans(context, appString.addNewCard)}",
              rightTitleTextStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: !isDarkMode ?Colors.black:Color(0xFFCCA76A))
            ),
            SizedBox(height: 5,),
            PaymentMethodCardWidget(),
          ],
        )
    );

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
            BookingDetailPaymentCard(),
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
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 8),
              padding: EdgeInsets.only(left: 30,),
              height: 48,
              decoration: BoxDecoration(
                color: !isDarkMode? AppColors().textFiledColor.withOpacity(0.12):AppColors().appBgColor2,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                children: [
                  Icon(CupertinoIcons.calendar_today,size: 26,color: !isDarkMode? AppColors().greyUnselected:AppColors().textHeadingColor1,),
                  SizedBox(width: 15,),
                  Text("Friday,",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?Colors.black:Colors.white),),
                  Text("25 March 2022",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?Colors.black:Colors.white),),
                  Text(" @ ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: !isDarkMode?Color(0xffFE9654):Color(0xFFCCA76A)),),
                  Text("8:30am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?Colors.black:Colors.white),),
                ],
              ),
            )

          ],
        )
    ));

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 25,right: 25,),
        child:CommonButton(
          buttonHeight: 50,
          buttonName:appString.trans(context, appString.continueBt),
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



    return Scaffold(
      backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            ContainerFirst(
              appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
              reverse: false,
              contextCurrentView: context,
              bottomBarSafeAreaColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
              statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
              // scrollPadding: EdgeInsets.only(bottom: 0),
              /* statusBarColor: Colors.amber,
                  bottomBarSafeAreaColor: Colors.amber,*/
              isSingleChildScrollViewNeed: true,
              isFixedDeviceHeight: true,
              appBarHeight : 60,
              appBar: Container(
                color: !isDarkMode ?Colors.white:AppColors().appBgColor3,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: appBarWithBackArrow(
                    backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
                      isTitleVisible: true,
                      leadingPadding: EdgeInsets.only(left: 10.0,
                          right: 10,bottom: 5,top: 0),
                      textStyle: TextStyle(fontSize: 22,color:!isDarkMode?AppColors().black:AppColors().textHeadingColor1,fontWeight: FontWeight.w700),
                      isTrailingIconVisible: false,
                      leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
                      title: appString.trans(context, appString.bookingDetails),
                      onPress: (){
                        Navigator.pop(context);
                      }
                  ),
                ),
              ),
              containChild: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    topView,
                    SizedBox(height: 25,),
                    paymentMethod,
                    SizedBox(height: 55,),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomButton(),
            )
          ],
        ),
      ),
    );

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
                  Text(appString.trans(context, appString.paymentPopUpHeading),
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
                    text: appString.trans(context, appString.paymentPopUpSubHeading),
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
                        text:appString.trans(context, appString.section),
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
                    buttonName: appString.trans(context, appString.buttonCtBooking),
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
                     child: Text( appString.trans(context, appString.goToAppointment),
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

