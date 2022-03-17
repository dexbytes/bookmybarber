import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/mobile_number_screen.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/date_picker.dart';
import 'package:base_flutter_app/src/widgets/dropdown_button.dart';
import 'package:base_flutter_app/src/widgets/terms_and_condition_row.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
    'user_name': new TextEditingController(),
    'email': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
    'user_name': new FocusNode(),
    'email': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
    'user_name': "",
    'email': "",
    'password': "",
  };


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

  final items = ["Afghanistan","Algeria","Argentina","Armenia","Australia","Austria",
    "Baden","Bangladesh","Barbados","Bavaria*","Belgium","Brazil","Bulgaria","Burma",
    "Cabo Verde","Cambodia","Canada","Central African Republic","China","Colombia","Costa Rica","Czechoslovakia",
     "Democratic Republic of the Congo","Denmark","Djibouti","Dominican Republic",
    "Egypt","El Salvador","Eritrea","Estonia","Eswatini","Ethiopia",
    "Fiji","Finland","France",
    "Gabon","Georgia","Germany","Ghana","Greece","Guinea","Guyana",
    "Haiti","Hanover*","Hawaii*","Holy See","Honduras","Hungary",
    "Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy",
    "Jamaica","Japan","Jordan",
    "Kazakhstan","Kenya","Korea","Kuwait",
    "Laos","Lebanon","Liberia","Lithuania","Luxembourg",
    "Madagascar","Malaysia","Maldives","Mexico","Morocco",
    "Namibia","Nepal","New Zealand","Nicaragua","Nigeria","Norway"
    "Oldenburg*","Oman","Orange Free State*",
    "Pakistan","Panama",'Panama',"Philippines","Poland","Portugal"
  ];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    bool isChecked = false;

    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(
            top: 5,
            left: 25,
            right: 25,
            bottom: 15
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Create an Account",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors().textHeadingColor1
              ),
              textAlign: TextAlign.start,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text("We have sent you an SMS with a code to number ${controllers['phone']?.text.toString()}",
            //   style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w500,
            //       color: AppColors().textNormalColor6.withOpacity(0.8)
            //   ),
            //   textAlign: TextAlign.center,
            // )
          ],
        ),
      );
    }

    //Check username field
    _checkName(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        setState(() {
          if (Validation().restrictNumbersOnly(value.trim())) {
            errorMessages[fieldName] = '';
          } else {
            if (!onchange) {
              errorMessages[fieldName] =
                  appString.trans(context, appString.validName);
            }
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'user_name') {
              errorMessages[fieldName] = appString.trans(context, appString.enterFirstName);
            } else if (fieldName == 'last_name') {
              errorMessages[fieldName] = appString.trans(context, appString.enterLastName);
            }
          }
        });
      }
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

    //Check password field
    _checkPassword(value, fieldEmail, {onchange = false}) {
      if (validation.isNotEmpty(value.trim())) {
        setState(() {
          if (validation.validatePassword(value.trim())) {
            errorMessages[fieldEmail] = "";
          } else {
            if (!onchange) {
              errorMessages[fieldEmail] = appString.trans(
                  context, appString.mustContain1LetterAndNumber);
            }
          }
        });
      }else {
        setState(() {
          if (!onchange) {
            if (fieldEmail == 'password') {
              errorMessages[fieldEmail] =
                  appString.trans(context, appString.pleaseEnterPassword);
            } else if (fieldEmail == 'last_name') {
              errorMessages[fieldEmail] =
                  appString.trans(context, appString.enterLastName);
            }
          }
        });
      }
    }





    //Username Field
    _userNameField() {
      return Container(
        padding: EdgeInsets.only(
            left: 22,right: 22,top: 20
        ),
        width: MediaQuery.of(context).size.width,
        child: CommonTextFieldWithError(
          focusNode: focusNodes['user_name'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['user_name']?.toString()??'',
          controllerT: controllers['user_name'],
          borderRadius: 50,
          inputHeight: 46,
          errorLeftRightMargin: 0,
          errorMsgHeight: 20,
          autoFocus: false,
          capitalization: CapitalizationText.none,
          cursorColor: Colors.grey,
          enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.text,
          textInputAction: TextInputAction.next,
          inputFieldSuffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.5),
            child: IconButton(
                onPressed:(){},
                icon: iconApps.iconImage(imageUrl: iconApps.personIcon2,imageColor:Color(0xff828588),iconSize: Size(20, 20)),
            ),
          ),
          hintText: "User name",
          hintStyle: TextStyle(
            fontSize: 16,
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
            _checkName(value, 'user_name', onchange: true);
          },
          onEndEditing: (value) {
            _checkName(value, 'user_name');
            FocusScope.of(context).requestFocus(focusNodes['email']);
          },
        ),
      );
    }

    //Email Field
    _emailField() {
      return Container(
        padding: EdgeInsets.only(
            left: 20,right: 20,
        ),
        width: MediaQuery.of(context).size.width,
        child: CommonTextFieldWithError(
          focusNode: focusNodes['email'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['email']?.toString()??'',
          controllerT: controllers['email'],
          borderRadius: 50,
          inputHeight: 46,
          errorLeftRightMargin: 0,
          errorMsgHeight: 20,
          autoFocus: false,
          capitalization: CapitalizationText.none,
          cursorColor: Colors.grey,
          enabledBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          textInputAction: TextInputAction.next,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.email,
          hintText: "Email address",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode? Colors.black:Colors.white,
          ),
          inputFieldSuffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed:(){},
              icon: Icon(CupertinoIcons.mail,color:Color(0xff828588),size: 22,)
              // iconApps.iconImage(imageUrl: iconApps.personIcon2,imageColor:Color(0xff828588),iconSize: Size(22, 22)),
            ),
          ),
          contentPadding: EdgeInsets.only(left: 25),
          onTextChange: (value) {
            _checkEmail(value, 'email', onchange: true);
          },
          onEndEditing: (value) {
            _checkEmail(value, 'email');
            FocusScope.of(context).requestFocus(focusNodes['phone']);
          },
        ),
      );
    }

    //Visibility icons
    Widget visibilityOffIcon = Icon(
      Icons.visibility_off_outlined,
      color: Color(0xff828588),
      size: 26,
    );
    Widget visibilityOnIcon = Icon(
      Icons.visibility_outlined,
      color:  Color(0xff828588),
      size: 26,
    );

    //Password Field
    _passwordField() {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0
        ),
        width:MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonTextFieldWithError(
              focusNode: focusNodes['password'],
              isShowBottomErrorMsg: true,
              errorMessages: errorMessages['password']?.toString()??'',
              controllerT: controllers['password'],
              borderRadius: 50,
              inputHeight: 46,
              errorMsgHeight: 24,
              autoFocus: false,
              errorLeftRightMargin: 0,
              capitalization: CapitalizationText.sentences,
              cursorColor: Colors.grey,
              enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
              focusedBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
              textInputAction: TextInputAction.done,
              backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
              borderStyle: BorderStyle.none,
              inputKeyboardType: InputKeyboardTypeWithError.email,
              obscureText: hideNewPassword,
              hintText: appString.trans(context, appString.password), //appString.trans(context, appString.createAPassword),
              hintStyle:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff828588),
              ),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: !isDarkMode? Colors.black: Colors.white,
              ),
              contentPadding: EdgeInsets.only(left: 25),
              inputFieldSuffixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  icon:
                  hideNewPassword ? visibilityOffIcon : visibilityOnIcon,
                  onPressed: togglePasswordVisibility1,
                ),
              ),
              onTextChange: (value) {
                //_validateFields(isButtonClicked: true);
                _checkPassword(value, 'password', onchange: false);
              },
              onEndEditing: (value) {
                // _validateFields(isButtonClicked: true);
                _checkPassword(value, 'password');
                FocusScope.of(context)
                    .requestFocus(focusNodes['confirm_password']);
              },
              // errorMessages: errorMessages['password'],
            ),
          ],
        ),
      );
    }

    //Phone field
    _phoneField() {
      return Container(
        margin: EdgeInsets.only(
            left: 20,right: 20,
        ),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['phone'],
          showError: true,
          isShowBottomErrorMsg:true,
          errorMessages:  errorMessages['phone']!= null ?errorMessages['phone'].toString():'',
          controllerT: controllers['phone'],
          borderRadius: 50,
          inputHeight: 45,
          autoFocus: false,
          errorMsgHeight: 20,
          errorLeftRightMargin: 0,
          enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          cursorColor: Colors.grey,
          borderStyle: BorderStyle.none,
          backgroundColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          inputKeyboardType: InputKeyboardTypeWithError.phone,
          contentPadding: EdgeInsets.only(left: 0,right: 0),
          // textStyle: _appStyle.labelTextStyle(),
          hintText: "Mobile Number",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode? Colors.black:Colors.white,
          ),
          // inputFieldSuffixIcon:controllers['phone']!.text.isEmpty
          //     ?Container(height: 0,width: 0,)
          //     :IconButton(
          //   padding: EdgeInsets.only(right: 10),
          //   icon:iconApps.iconImage(imageUrl: iconApps.closeIcon,) ,
          //   onPressed: () =>  controllers['phone']?.clear(),
          // ),
          inputFieldSuffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed:(){},
                icon: Icon(CupertinoIcons.phone,color:Color(0xff828588),size: 24,)
              // iconApps.iconImage(imageUrl: iconApps.personIcon2,imageColor:Color(0xff828588),iconSize: Size(22, 22)),
            ),
          ),
          inputFieldPrefixIcon: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.only(top: 0,left:9,right: 0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width/4.2,
                      top: 10,
                      bottom: 10,
                      right: 15
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
                  flagWidth: 18,
                  showFlagDialog: true,
                  showDropDownButton: true,
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
        margin: EdgeInsets.only(left: 28,right: 28,bottom: 5),
        child: CommonButton(
          buttonName: "Sign Up",
          buttonHeight: 48,
          buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327),
          ),
          isBottomMarginRequired: false,
          backCallback: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
              return DashBoardPage();
            }), (route) => false);
            if(phoneNumber.toString().trim() != "" && Validation().validatePhoneNumber(phoneNumber)
                && ( phoneNumber.length == 10 )
            ){
              setState(() {
                errorMessages['phone'] = '';
              });
              // Navigator.push(
              //   context,
              //   SlideRightRoute(
              //       widget: OtpVerificationScreen()),
              // );
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

    Widget signInText = Container(
      margin: EdgeInsets.only(bottom: 20),
      child: AlreadyHaveAccountRow(
        leftText: "Already have an account\?",
        leftTextStyle: !isDarkMode? TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff828588))
        :TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),
        rightText: "Sign In",
        signInCallBack: (){
          Navigator.push(
            context,
            SlideRightRoute(
                widget: MobileNumberScreen()),
          );
        },
      ),
    );

    Widget selectGenderFiled = DropDownDataPicker();
    Widget locationFiled = DropDownDataPicker(
      hint:"Location",
      itemList: items.map(buildMenuItem).toList(),
    );


    Widget checkBox = Container(
      margin: EdgeInsets.only(left: 20,right: 11,bottom: 30,top: 5),
    child: CustomCheckBox(
      isChecked: isChecked,
      onChange: (value) {
        isChecked = value;
        print(isChecked);
      },
      backgroundColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
      borderColor: Colors.grey,
      icon: Icons.done,
      size: 20,
      iconSize: 14,
    ));

    return ContainerFirst(
      reverse: false,
      contextCurrentView: context,
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        // color:AppColors().appBgColor3,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: "Create an Account",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _userNameField(),
            _emailField(),
            _phoneField(),
            DatePickerWidget(),
            selectGenderFiled,
             locationFiled,
            _passwordField(),
             checkBox,
            bottomButton(),
            signInText
          ],
        ),
      ),
    );

  }


  DropdownMenuItem<String> buildMenuItem(String item) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return DropdownMenuItem(
      value:item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color:!isDarkMode?  Colors.black:Colors.white,
        ),
      )
  );}
}
