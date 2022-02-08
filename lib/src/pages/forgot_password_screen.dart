import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';


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
    Size size = MediaQuery.of(context).size;

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
          bottom: MediaQuery.of(context).size.height/ 10
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Forgot Password",
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
            Text("Please enter your email address. You will receive a code to create a new password\nvia email.",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors().textNormalColor6.withOpacity(0.8)
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
            top: 25,
            bottom: 20
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
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor: Color(0xff323446),
          focusedBorderColor: Color(0xff323446),
          textInputAction: TextInputAction.next,
          backgroundColor: Color(0xff323446),
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
            color: Colors.white,
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
        margin: EdgeInsets.only(left: 28,right: 28,top: 30),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Reset password",
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
      appBarHeight: 62,
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
            SizedBox(height: 8,),
            _emailField(),
            bottomButton()
          ],
        ),
      ),
    );

  }

  void alertDialog(BuildContext context) {

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
                    left: 20,
                    right: 20
                    ),
                height: MediaQuery.of(context).size.height/2.3,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xff384054),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    iconApps.iconImage(
                      imageUrl: iconApps.passwordIcon,
                    ),
                    SizedBox(height: 25,),
                    Text("Code has been send to reset a new password",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors().textHeadingColor1
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20,),
                    Text("You'll shortly receive an email with a code\n to setup a new password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors().textNormalColor6.withOpacity(0.8)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 48,),
                    CommonButton(
                      buttonHeight: 50,
                      buttonName: "Done",
                      buttonColor:Color(0xFFCCA76A),
                      textStyle: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff212327),),
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

