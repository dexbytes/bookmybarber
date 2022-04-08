import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  Map<String, TextEditingController> controllers = {
    'email': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'email': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'email': "",
  };
  TextEditingController inputController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    //Check email field
    _checkEmail(value, fieldEmail, {onchange = false}) {
      if (validation.isNotEmpty(value.trim())) {
        setState(() {
          if (validation.validateEmail(value.trim())) {
            errorMessages[fieldEmail] = "";
          } else {
            if (!onchange) {
              errorMessages[fieldEmail] =
                  appString.trans(context, appString.enterValidEmail);
            }
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldEmail == 'email') {
              errorMessages[fieldEmail] =
                  appString.trans(context, appString.enterFirstEmail);
            } else if (fieldEmail == 'last_name') {
              errorMessages[fieldEmail] =
                  appString.trans(context, appString.enterLastName);
            }
          }
        });
      }
    }

    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(
          top: 5,
          left: 25,
          right: 25,
          bottom: 40
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(appString.trans(context, appString.forgotHeadingText),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color:!isDarkMode? AppColors().textNormalColor8: AppColors().textNormalColor6.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    //Email Field
    _emailField() {
      return Container(
        padding: EdgeInsets.only(
            left: 25,right: 20,
            top: 0,
            bottom: 0
        ),
        width: MediaQuery.of(context).size.width,
        child: CommonTextFieldWithError(
          focusNode: focusNodes['email'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['email']?.toString()??'',
          controllerT: controllers['email'],
          borderRadius: 50,
          inputHeight: 50,
          errorLeftRightMargin: 0,
          errorMsgHeight: 24,
          autoFocus: true,
          capitalization: CapitalizationText.none,
          cursorColor: Colors.grey,
          enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          textInputAction: TextInputAction.done,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.email,
          hintText: "Your email address",
          hintStyle: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode? Colors.black:Colors.white,
          ),
          inputFieldSuffixIcon: Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed:(){},
              icon: iconApps.iconImage(imageUrl: iconApps.personIcon2,imageColor:Color(0xff828588),iconSize: Size(22, 22)),
            ),
          ),
          contentPadding: EdgeInsets.only(left: 25),
          onTextChange: (value) {
            _checkEmail(value, 'email', onchange: true);
          },
          onEndEditing: (value) {
            _checkEmail(value, 'email');
            FocusScope.of(context).requestFocus(focusNodes['password']);
          },
        ),
      );
    }

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,top: 12),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: appString.trans(context, appString.resetPassword),
          buttonColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327),
          ),
          backCallback:(){
            alertDialog(context);
          },
          isBottomMarginRequired: false,
        ),
      );
    }

    Widget resendCode = Container(
      margin: EdgeInsets.only(bottom: 30,top: 22),
      child: AlreadyHaveAccountRow(
        leftText:  appString.trans(context, appString.didntReceiveCode),
        leftTextStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Color(0xff828588),),
        rightText: appString.trans(context, appString.resendCode),
        isSubtitleTextVisible: true,
        isRightTextVisible: false,
      ),
    );


    return ContainerFirst(
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      reverse: false,
      contextCurrentView: context,
      // bottomBarSafeAreaColor: Color(0xff212327),
      // statusBarColor: Color(0xff212327),
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: appString.trans(context, appString.forgotPasswordTitle),
            textStyle: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
            ),
            leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
            leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 15),
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
            SizedBox(height: 8,),
            _emailField(),
            resendCode,
            bottomButton()
          ],
        ),
      ),
    );

  }

  void alertDialog(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

       showDialog(
         barrierDismissible: false,
          context: context,
          builder: (context){
           return Dialog(
             insetPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding:EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: !isDarkMode? AppColors().white:AppColors().appBgColor3,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    iconApps.iconImage(
                      imageUrl: iconApps.passwordIcon,
                    ),
                    SizedBox(height: 25,),
                    Text(appString.trans(context, appString.forgotAlertBoxTitle),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color:!isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20,),
                    Text(appString.trans(context, appString.forgotAlertBoxSubtitle),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: !isDarkMode? AppColors().textNormalColor8: AppColors().textNormalColor6.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 45,),
                    CommonButton(
                      buttonHeight: 50,
                      buttonName:appString.trans(context, appString.done),
                      buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
                      textStyle: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: !isDarkMode? Colors.white:Color(0xff212327),
                      ),
                      backCallback:(){
                        Navigator.pop(context);
                      },
                      isBottomMarginRequired: false,
                    ),
                  ],
                ),
              ),
            );

          });

  }
}

