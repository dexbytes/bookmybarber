import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/pin_code_fields.dart';
import 'package:flutter/material.dart';

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


    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(
            top: 5,
            left: 25,
            right: 25,
            bottom: MediaQuery.of(context).size.height/ 11
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Phone Verification",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors().textHeadingColor1
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Enter your OTP code here",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors().textNormalColor6.withOpacity(0.8)
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
          buttonColor: Color(0xFFCCA76A),
          buttonName: "CONTINUE",
          buttonHeight: 50,
          isBottomMarginRequired: false,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),          backCallback: (){
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
      margin: EdgeInsets.only(bottom: 50,top: 35),
      child: AlreadyHaveAccountRow(
        leftText: "Did't you receive any code?",
        leftTextStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Color(0xff828588),),
        rightText: "Resend a new code",
        isSubtitleTextVisible: true,
        isRightTextVisible: false,
      ),
    );

    verificationCode() {
      Color fieldBackgroundColor = Color(0xFFCCA76A);
      Color activeBorderColor = Color(0xFF5D3F30).withOpacity(0.1);
      Color activeBackgroundColor = Color(0xFFCCA76A);
      Color borderColor = Color(0xFF5D3F30).withOpacity(0.1);
      Color disableBackgroundColor = Color(0xFF384054);

      return Container(
        // color: Colors.red,
          margin: EdgeInsets.only(bottom: 0, top: 0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
          child: PinCodeFields(
            controller: inputController,
            length: otpLength,
            margin: EdgeInsets.only(left: 10,right:10,top: 10),
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
      appBarHeight: 68,
      appBar: Container(
        color: Color(0xff212327),
        child: appBarWithBackArrow(
            isTitleVisible: false,
            isTrailingIconVisible: false,
            leadingIconColor:Color(0xFFCCA76A),
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
