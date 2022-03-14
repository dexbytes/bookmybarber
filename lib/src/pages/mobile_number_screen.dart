import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'otp_verification_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {

  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
  };

  @override
  void initState(){
    super.initState();
    controllers['phone']?.addListener(() => setState(() {}));
  }

  @override
  void dispose(){
    controllers['phone']?.dispose();
    super.dispose();
  }

  String phoneNumber = '';

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
            // Text("Verify Phone Number",
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
            Text("We have sent you an SMS with a code to number ${controllers['phone']?.text.toString()}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: !isDarkMode? AppColors().textNormalColor8: AppColors().textNormalColor6.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    //Check phone field
    _checkPhoneField(value, {fieldName,onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        String mobile = value.trim();
        mobile = mobile.trim().toString().replaceAll(" ", '');
        phoneNumber = mobile.trim().toString().replaceAll(" ", '');
        if (Validation().validatePhoneNumber(mobile)) {
          setState(() {
            errorMessages[fieldName] = '';
          });
        }
        else {
          setState(() {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context, appString.correctPhone);
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            errorMessages[fieldName] = appString.trans(context, appString.phoneNumber);
          }
        });
      }
    }

    //Phone field
    _phoneField() {
      return Container(
        margin: EdgeInsets.only(
            left: 25,right: 20,
            top: 0,
            bottom: 0
        ),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['phone'],
          showError: true,
          isShowBottomErrorMsg:true,
          errorMessages:  errorMessages['phone']!= null ?errorMessages['phone'].toString():'',
          controllerT: controllers['phone'],
          borderRadius: 50,
          inputHeight: 50,
          autoFocus: false,
          errorMsgHeight: 25,
          errorLeftRightMargin: 0,
          enabledBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          cursorColor: Colors.grey,
          borderStyle: BorderStyle.none,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          inputKeyboardType: InputKeyboardTypeWithError.phone,
          contentPadding: EdgeInsets.only(left: 0,right: 0),
          // textStyle: _appStyle.labelTextStyle(),
          hintText: "Mobile Number",
          hintStyle: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:!isDarkMode? Colors.black:Colors.white,
          ),
          inputFieldSuffixIcon:controllers['phone']!.text.isEmpty
              ?Container(height: 0,width: 0,)
              :IconButton(
            padding: EdgeInsets.only(right: 10),
            icon:iconApps.iconImage(imageUrl: iconApps.closeIcon,) ,
            onPressed: () =>  controllers['phone']?.clear(),
          ),

          inputFieldPrefixIcon: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.only(top: 0,left:9,right: 0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width/4.1,
                      top: 10,
                      bottom: 10,
                      right: 10
                  ),
                  child: VerticalDivider(
                    width: 10,
                    thickness: 1,
                    endIndent: 0,
                    indent: 0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                CountryCodePicker(
                  dialogSize: Size(300,500),
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  initialSelection: 'In',
                  showCountryOnly: false,
                  showFlag: true,
                  flagWidth: 21,
                  showFlagDialog: true,
                  showOnlyCountryWhenClosed: false,
                  dialogBackgroundColor:!isDarkMode? Colors.white:Color(0xff212327),
                  dialogTextStyle: TextStyle(
                      fontSize: 16,
                      color: !isDarkMode? Colors.black:Color(0xffFE9654)),
                  closeIcon: Icon(Icons.clear,size: 26,color:Color(0xFFCCA76A)),
                  hideSearch: true,
                  favorite: ['+91','In','+1','US',"+61","+55","47"],
                  // showDropDownButton: true,
                  hideMainText: false,
                  textStyle: TextStyle(fontSize: 15,color: !isDarkMode? Colors.black:Color(0xffFE9654)),
                  // flagWidth: ,
                ),

              ],
            ),
          ),
          onTextChange: (value) {
            _checkPhoneField(value, onchange: true,fieldName: 'phone');
          },
          onEndEditing: (value) {
            _checkPhoneField(value, onchange: true,fieldName: 'phone');
            FocusScope.of(context).requestFocus(focusNodes['password']);
          },

        ),
      );
    }


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: CommonButton(
          buttonName: "Continue",
          buttonHeight: 50,
          buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327),
          ),
          isBottomMarginRequired: false,
          backCallback: (){
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            //   return OtpVerificationScreen();
            // }), (route) => false);
            if(phoneNumber.toString().trim() != "" && Validation().validatePhoneNumber(phoneNumber)
                && ( phoneNumber.length == 10 )
            ){
              setState(() {
                errorMessages['phone'] = '';
              });
              Navigator.push(
                context,
                SlideRightRoute(
                    widget: OtpVerificationScreen()),
              );
            }else{
              setState(() {
                if(phoneNumber.toString().trim() == "" )
                  errorMessages['phone'] = appString.phoneNumber;
                else
                  errorMessages['phone'] = appString.correctPhone;
                //errorMessages['phone'] = appString.trans(context, appString.phoneNumber);
              });
            }
          },
        ),
      );
    }

    Widget socialNetworkText = Container(
      margin: EdgeInsets.only(bottom: 25),
      child: AlreadyHaveAccountRow(
        leftText: "Or Login with",
        leftTextStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Color(0xff828588),),
        rightText: "Social Network",
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
            title: "Verify Phone Number",
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
            _phoneField(),
            socialNetworkText,
            bottomButton()
          ],
        ),
      ),
    );

  }
}
