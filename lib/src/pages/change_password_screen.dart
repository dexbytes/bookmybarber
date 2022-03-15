import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  double _leftRightMargin = 24;
  double opacity = 1.0;

  GlobalKey key = GlobalKey(); // declare a global key

  Map<String, TextEditingController> controllers = {
    'new_password': new TextEditingController(),
    'confirm_password': new TextEditingController(),
    'current_password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'new_password': new FocusNode(),
    'confirm_password': new FocusNode(),
    'current_password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'new_password': "",
    'confirm_password': "",
    'current_password': "",
  };
  Color color = Colors.green;
  bool hideCurrentPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmPassword = true;

  void togglePasswordVisibility() =>
      setState(() => hideCurrentPassword = !hideCurrentPassword);
  void togglePasswordVisibility1() =>
      setState(() => hideNewPassword = !hideNewPassword);
  void togglePasswordVisibility2() =>
      setState(() => hideConfirmPassword = !hideConfirmPassword);

  @override
  void initState() {
    controllers['current_password']?.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    controllers['current_password']?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    appDimens.appDimensFind(context: context);

    bool _validateFields({isButtonClicked = false}) {
      if (controllers['current_password']?.text.trim() == null ||
          controllers['current_password']?.text.trim() == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['current_password'] =
                appString.trans(context, appString.pleaseEnterCurrentPassword);
          }
        });
        return false;
      } else if (controllers['new_password']?.text.trim() == null ||
          controllers['new_password']?.text.trim() == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['new_password'] =
                appString.trans(context, appString.pleaseEnterNewPassword);
          }
        });
        return false;
      } /*else if (controllers['new_password'].text.trim().length < 6) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['new_password'] =
                appString.trans(context, appString.passwordLength);
          }
        });
        return false;
      }*/
      else if (!Validation()
          .validatePassword(controllers['new_password']!.text.trim())) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['new_password'] =
                appString.trans(context, appString.mustContain1LetterAndNumber);
          }
        });
        return false;
      } else if (controllers['confirm_password']?.text.trim() == null ||
          controllers['confirm_password']?.text.trim() == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['confirm_password'] =
                appString.trans(context, appString.pleaseReEnterPassword);
          }
        });
        return false;
      } else if (controllers['new_password']?.text.trim() !=
          controllers['confirm_password']?.text.trim()) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['new_password'] = appString.trans(
                context, appString.enterValidEmail);
          }
        });
        return false;
      } else {
        return true;
      }
    }

    //Check password on change
    _checkPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value)) {
        setState(() {
          if (value.length >= 4) {
            errorMessages['new_password'] = "";
            errorMessages['confirm_password'] = "";
            errorMessages['current_password'] = "";
            if (Validation().validatePassword(controllers[fieldName]!.text.trim())) {
              if ((controllers['confirm_password']?.text != null &&
                  controllers['confirm_password']?.text != "") &&
                  controllers['new_password']?.text !=
                      controllers['confirm_password']?.text) {
                errorMessages['confirm_password'] =
                "Password and confirm password must be same";
              } else {
                errorMessages['new_password'] = "";
                errorMessages['confirm_password'] = "";
              }
            } else {
              if (!onchange) {
                errorMessages[fieldName] = appString.trans(
                    context, appString.mustContain1LetterAndNumber);
              }
            }
          } else {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(
                  context, appString.mustContain1LetterAndNumber);
            }
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'current_password') {
              errorMessages[fieldName] = appString.trans(
                  context, appString.pleaseEnterCurrentPassword);
            }
            if (fieldName == 'new_password') {
              errorMessages[fieldName] =
                  appString.trans(context, appString.pleaseEnterCurrentPassword);
            } else if (fieldName == 'confirm_password') {
              errorMessages[fieldName] =
                  appString.trans(context, appString.pleaseReEnterPassword);
            }
          }
        });
      }
    }

    //Check confirm password on change
    _checkConfirmPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value)) {
        setState(() {
          if ((controllers['confirm_password']?.text != null &&
              controllers['confirm_password']?.text != "") &&
              controllers['new_password']?.text !=
                  controllers['confirm_password']?.text) {
            errorMessages[fieldName] =
            "Password and confirm password must be same";
          } else {
            errorMessages[fieldName] = "";
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'confirm_password') {
              errorMessages[fieldName] =
                  appString.trans(context, appString.pleaseReEnterPassword);
            }
          }
        });
      }
    }



    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,top: 30),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "SAVE",
          buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327),),
          backCallback: (){
            setState(() {

            });
            if (_validateFields(isButtonClicked: true)) {

              // Map data = {
              //   "password": controllers['current_password']?.text,
              //   "newPassword": controllers['new_password']?.text
              // };
              // Navigator.pushAndRemoveUntil(context, SlideRightRoute(widget: DashBoardPage()
              //             ), (route) => false);
              //
              // Navigator.pushAndRemoveUntil(context, SlideRightRoute(widget: ConfirmationScreen()
              // ), (route) => false);

            }
          },
          isBottomMarginRequired: false,
        ),
      );
    }


    //Visibility icons
    Widget visibilityOffIcon = Icon(
      Icons.visibility_off,
      color: appColors.grey,
      size: 20,
    );
    Widget visibilityOnIcon = Icon(
      Icons.visibility,
      color: appColors.grey,
      size: 20,
    );

    //current Password Field
    _currentPasswordField() {
      return Container(
        padding: EdgeInsets.only(
          right: _leftRightMargin,
          left: _leftRightMargin,
          top: 30,
          bottom: 0,
        ),
        width: appDimens.widthFullScreen(),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['current_password'],
          showError: true,
          errorText: errorMessages['current_password']?.toString()??'',
          errorMessages:errorMessages['current_password']?.toString()??'',
          controllerT: controllers['current_password'],
          borderRadius: 50,
          inputHeight: 50,
          errorMsgHeight: 24,
          autoFocus: false,
          errorLeftRightMargin: 0,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          textInputAction: TextInputAction.next,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.password,
          obscureText: hideCurrentPassword,
          hintText: "Current Password",
          placeHolderTextWidget: Text( "Current Password",
            style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,),),
          placeHolderEdgeInsets: EdgeInsets.only(left: 12,bottom: 8),

          hintStyle:TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode? Colors.black:Colors.white,
          ),
          contentPadding: EdgeInsets.only(left: 25),
          inputFieldSuffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: hideCurrentPassword ? visibilityOffIcon : visibilityOnIcon,
              onPressed: togglePasswordVisibility,
            ),
          ),
          onTextChange: (value) {
            _checkPassword(value, 'current_password', onchange: true);
          },
          isShowBottomErrorMsg: true,
          // errorMessages: errorMessages['current_password'],
          onEndEditing: (value) {
            _checkPassword(value, 'current_password');
            FocusScope.of(context).requestFocus(focusNodes['new_password']);
          },
        ),
      );
    }

    //new Password Field
    _newPasswordField() {
      return Container(
        padding: EdgeInsets.only(
            right: _leftRightMargin,
            left: _leftRightMargin,
            top: 5,bottom: 20
        ),
        width: appDimens.widthFullScreen(),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['new_password'],
          showError: true,
          errorText: errorMessages['new_password']?.toString()??'',
          errorMessages:errorMessages['new_password']?.toString()??'',
          controllerT: controllers['new_password'],
          borderRadius: 50,
          inputHeight: 50,
          errorMsgHeight: 24,
          autoFocus: false,
          errorLeftRightMargin: 0,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          textInputAction: TextInputAction.next,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.password,
          obscureText: hideNewPassword,
          hintText: "New Password",
          placeHolderTextWidget: Text( "New Password",
           style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,),),
          placeHolderEdgeInsets: EdgeInsets.only(left: 12,bottom: 8),
          hintStyle:TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle:TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode? Colors.black:Colors.white,
          ),
          contentPadding: EdgeInsets.only(left: 25),
          inputFieldSuffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: hideNewPassword ? visibilityOffIcon : visibilityOnIcon,
              onPressed: togglePasswordVisibility1,
            ),
          ),
          onTextChange: (value) {
            _checkPassword(value, 'new_password', onchange: true);
          },
          onEndEditing: (value) {
            _checkPassword(value, 'new_password');
            FocusScope.of(context).requestFocus(focusNodes['confirm_password']);
          },
          isShowBottomErrorMsg: true,
          // errorMessages: errorMessages['new_password'],
        ),
      );
    }

    //Confirm password field
    _confirmPasswordField() {
      return Container(
        padding: EdgeInsets.only(
          right: _leftRightMargin,
          left: _leftRightMargin,
        ),
        width: appDimens.widthFullScreen(),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['confirm_password'],
          showError: true,
          errorText: errorMessages['confirm_password']?.toString()??'',
          errorMessages: errorMessages['confirm_password']?.toString()??'',
          controllerT: controllers['confirm_password'],
          borderRadius: 50,
          inputHeight: 50,
          errorMsgHeight: 24,
          autoFocus: false,
          errorLeftRightMargin: 0,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          textInputAction: TextInputAction.done,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.password,
          obscureText: hideConfirmPassword,
          inputFieldSuffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: hideConfirmPassword ? visibilityOffIcon : visibilityOnIcon,
              onPressed: togglePasswordVisibility2,
            ),
          ),
          hintText: "Confirm Password",
          placeHolderTextWidget: Text("Confirm Password",
            style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,),),
          placeHolderEdgeInsets: EdgeInsets.only(left: 12,bottom: 8),
          hintStyle:TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode? Colors.black:Colors.white,
          ),
          contentPadding: EdgeInsets.only(left: 25),
          onTextChange: (value) {
            _checkConfirmPassword(value, 'confirm_password', onchange: true);
          },
          onEndEditing: (value) {
            _checkConfirmPassword(value, 'confirm_password');
            // FocusScope.of(context).requestFocus(focusNodes[bottomButton]);
          },
          isShowBottomErrorMsg: true,
          // errorMessages: errorMessages['confirm_password'],
        ),
      );
    }

    //Background view


    //Return main Ui view
    return ContainerFirst(
        appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        reverse: false,
        contextCurrentView: context,
        isSingleChildScrollViewNeed: false,
        isFixedDeviceHeight: false,
        appBar: Container(
          // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
          child: appBarWithBackArrow(
              isTitleVisible: true,
              isTrailingIconVisible: false,
              title: "Change Password",
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
        containChild:
        Container(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),

                  _currentPasswordField(),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20,top: 25,bottom: 25),
                    child: Divider(
                      height: 10,
                      thickness: 0.5,
                      color: Colors.grey,
                      indent: 0,
                      endIndent: 1,

                    ),
                  ),


                  _newPasswordField(),

                  _confirmPasswordField(),

                  SizedBox(height: 20,),
                  
                  bottomButton(),
                ],
              ),
            ],
          ),
        )
    );
  }
}