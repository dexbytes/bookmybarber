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

class BookingDetailPaymentScreen extends StatefulWidget {
  const BookingDetailPaymentScreen({Key? key,}) : super(key: key);
  @override
  _BookingDetailPaymentScreenState createState() => _BookingDetailPaymentScreenState();
}

class _BookingDetailPaymentScreenState extends State<BookingDetailPaymentScreen> {

  @override
  Widget build(BuildContext context) {

    Widget paymentMethod = Container(
        color: Colors.transparent,
        height: 350,
        child: Column(
          children: [
            SeeAllTextRow(
              leftTitle: "Payment Method",
              leftTitleTextStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xFFCCA76A)),
              rightTitle: "+ Add a new card",
            ),
            SizedBox(height: 5,),
            PaymentMethodCardWidget(),
          ],
        )
    );

    Widget topView = Container(
        decoration: BoxDecoration(
          color: AppColors().appBgColor3,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)
        ),
        height: 245,
        child: Column(
          children: [
            SizedBox(height: 15,),
            BookingDetailPaymentCard(),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              padding: EdgeInsets.only(left: 30,),
              height: 48,
              decoration: BoxDecoration(
                color: AppColors().appBgColor2,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                children: [
                  Icon(CupertinoIcons.calendar_today,size: 26,color: AppColors().textHeadingColor1,),
                  SizedBox(width: 15,),
                  Text("Friday,",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Colors.white),),
                  Text("25 March 2022 @ ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Colors.white),),
                  Text("8:30am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Colors.white),),
                ],
              ),
            )

          ],
        )
    );

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 25,right: 25,),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Continue",
          buttonColor:Color(0xFFCCA76A),
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),
          backCallback:(){
            alertDialog(context);
          },
          isBottomMarginRequired: false,
        ),
      );
    }



    return Scaffold(
      backgroundColor: AppColors().appBgColor2,
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            ContainerFirst(
              appBackgroundColor: AppColors().appBgColor2,
              reverse: false,
              contextCurrentView: context,
              bottomBarSafeAreaColor: Color(0xff212327),
              statusBarColor: AppColors().appBgColor3,
              // scrollPadding: EdgeInsets.only(bottom: 0),
              /* statusBarColor: Colors.amber,
                  bottomBarSafeAreaColor: Colors.amber,*/
              isSingleChildScrollViewNeed: true,
              isFixedDeviceHeight: true,
              appBarHeight : 65,
              appBar: Container(
                color: AppColors().appBgColor3,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: appBarWithBackArrow(
                      isTitleVisible: true,
                      leadingPadding: EdgeInsets.only(left: 10.0,
                          right: 10,bottom: 5,top: 0),
                      textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w700),
                      isTrailingIconVisible: false,
                      leadingIconColor:Color(0xFFCCA76A),
                      title: "Booking Details",
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
                    paymentMethod

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
    Widget text = Text(" \"Appointment\" ",
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors().textNormalColor6
      ),
    );

    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: 35,
                  left: 16,
                  right: 16
              ),
              height: MediaQuery.of(context).size.height/2.1,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Color(0xff384054),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  iconApps.iconImage(
                    imageUrl: iconApps.rightWithBackgroundIcon,
                  ),
                  SizedBox(height: 25,),
                  Text("Your appointment booking is successfully.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors().textHeadingColor1
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
                      color: AppColors().textNormalColor8
                  ),
                    children: [
                      TextSpan(
                        text:" \"Appointment\" ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors().textNormalColor6
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
                    buttonColor:Color(0xFFCCA76A),
                    textStyle: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212327),),
                    backCallback:(){
                      Navigator.pop(context);
                    },
                    isBottomMarginRequired: false,
                  ),
                SizedBox(height: 25,),
                 Material(
                   color: Colors.transparent,
                   child: InkWell(
                     onTap: (){
                       Navigator.push(
                         context,
                         SlideRightRoute(
                             widget: BookingScreen(isShowBackArrow: true,)),
                       );
                     },
                     child: Text("Go to appointment",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors().textHeadingColor1
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

