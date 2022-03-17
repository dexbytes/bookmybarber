import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  TextEditingController inputController = new TextEditingController();
  String verificationCodeStr = "";

  int otpLength = 4;

  String errorMessage = '';
  bool isHeight = true;



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(
            top: 5,
            left: 25,
            right: 25,
            bottom: 45
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("Phone Verification",
            //   style: TextStyle(
            //       fontSize: 30,
            //       fontWeight: FontWeight.w700,
            //       color: AppColors().textHeadingColor1
            //   ),
            //   textAlign: TextAlign.start,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Text("Enter your OTP code here",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:  !isDarkMode? AppColors().textNormalColor8: AppColors().textNormalColor6.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 35),
        child: CommonButton(
          buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          buttonName: "CONTINUE",
          buttonHeight: 50,
          isBottomMarginRequired: false,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color:!isDarkMode? Colors.white:Color(0xff212327),
          ),          backCallback: (){
            if (verificationCodeStr != '' && verificationCodeStr.trim().length == otpLength) {
              setState(() {
                errorMessage = '';
              });
              Navigator.push(
                context,
                SlideRightRoute(
                    widget: DashBoardPage()),
              );
            }else{
              setState(() {
                if( verificationCodeStr == '')
                  errorMessage = appString.pleaseEnterOTP;
                else
                  errorMessage = appString.pleaseEnterCorrectOTP;
              });
            }
          },
        ),
      );
    }


    Widget resendCode = Container(
      margin: EdgeInsets.only(bottom: 30,top: 22),
      child: AlreadyHaveAccountRow(
        leftText: "Did't you receive any code?",
        leftTextStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Color(0xff828588),),
        rightText: "Resend a new code",
        isSubtitleTextVisible: true,
        isRightTextVisible: false,
        subtitleTextCallBack: (){
          print("Hello");
          inputController.clear();
        },
      ),
    );

    verificationCode() {
      Color fieldBackgroundColor =  !isDarkMode?AppColors().buttonColor2: Color(0xFFCCA76A);
      Color activeBorderColor = !isDarkMode?Color(0xFF5D3F30).withOpacity(0.0):Color(0xFF5D3F30).withOpacity(0.1);
      Color activeBackgroundColor =  !isDarkMode?AppColors().buttonColor2: Color(0xFFCCA76A);
      Color borderColor = !isDarkMode?Color(0xFF5D3F30).withOpacity(0.0):Color(0xFF5D3F30).withOpacity(0.1);
      Color disableBackgroundColor = !isDarkMode?AppColors().textNormalColor6.withOpacity(0.9): appColors.appBgColor3;

      return Container(
        // color: Colors.red,
          margin: EdgeInsets.only(bottom: 0, top: 0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
          child: PinCodeFields(
            controller: inputController,
            length: otpLength,
            margin: EdgeInsets.only(left: 10,right:10,top: 0),
            fieldBorderStyle: FieldBorderStyle.Square,
            responsive: false,
            fieldHeight: 50.0,
            fieldWidth: 50.0,
            disableBackgroundColor:disableBackgroundColor ,
            borderWidth: 1.0,
            padding: EdgeInsets.only(top: 1),
            activeBorderColor: activeBorderColor,
            activeBackgroundColor: activeBackgroundColor,
            borderRadius: BorderRadius.circular(50.0),
            keyboardType: TextInputType.number,
            autoHideKeyboard: true,
            autofocus: true,
            fieldBackgroundColor:fieldBackgroundColor,
            borderColor: borderColor,
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            onChange: (value) {
              verificationCodeStr = "$value";
              print(value + "### $verificationCodeStr");
            },
            onComplete: (output) {
              //setState(() {
              verificationCodeStr = output;
              if (verificationCodeStr != "" &&
                  verificationCodeStr.length == otpLength) {
                setState(() {
                  errorMessage = '';
                });
                FocusScope.of(context).requestFocus(FocusNode());
                // Navigator.push(
                //   context,
                //   SlideRightRoute(
                //       widget: NamesScreen()),
                // );
              }
              // });
              // Your logic with pin code
              print(output + "Final $verificationCodeStr");
            },
          ));
    }



    Widget otpErrorMsg = (errorMessage != '')
        ? Container(
        height: 24,
        child: Padding(
          padding: EdgeInsets.only(top: 2.0, left: 3),
          child: Text(
            errorMessage,
            style: appStyles.errorStyle(),
          ),
        ))
        : Container(
      height: 10,
    );

    Widget time = Container(
      margin: EdgeInsets.only(bottom: 10),
       child: Text("00:25",
       style: TextStyle(fontSize: 13,color: AppColors().textHeadingColor1),
       ),
    );



    return ContainerFirst(
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      reverse: false,
      contextCurrentView: context,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar:Container(
        // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: "Phone Verification",
            textStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
            ),
            leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
            leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 13),
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      containChild: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _welcomeTextView(),
            verificationCode(),
            otpErrorMsg,
            time,
            resendCode,
            bottomButton()
          ],
        ),
      ),
    );
  }
}
