import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/date_picker.dart';
import 'package:base_flutter_app/src/widgets/dropdown_button.dart';
import 'package:base_flutter_app/src/widgets/image_shapes_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class UserProfileEditScreen extends StatefulWidget {
  final String userName;
  final String email;
  final String image;

  const UserProfileEditScreen({Key? key,
    this.userName ="Dino Waelchi",
    this.email ="Dino_waelchi@gmail.com",
    this.image ="https://pyxis.nymag.com/v1/imgs/51d/e5c/bb6f6065a9676bda462b93f24fd790368e-17-gal-gadot.rsquare.w700.jpg",
  })
      : super(key: key);
  @override
  _UserProfileEditScreenState createState() => _UserProfileEditScreenState();
}


class _UserProfileEditScreenState extends State<UserProfileEditScreen>
    with TickerProviderStateMixin {


  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
    'user_name': new TextEditingController(),
    'email': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
    'user_name': new FocusNode(),
    'email': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
    'user_name': "",
    'email': "",
  };

  int selectValue = 0;
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




    Widget profileImage = InkWell(
      onTap: (){
        print("click");
      },
    child: Container(
      color: !isDarkMode ?Colors.white:AppColors().appBgColor3,
    child:
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Container(
      height: 140,
      child: FlutterClipPolygon(
        sides: 6,
        borderRadius: 18.0, // Defaults to 0.0 degrees
        rotate: 90.0,
        // Defaults to 0.0 degrees
        child: Container(
          decoration: BoxDecoration(
              color: !isDarkMode? appColors.buttonColor2: Color(0xffE4B343),
              border: Border.all(width: 2)
          ),
          child: FlutterClipPolygon(
            sides: 6,
            borderRadius: 18.0, // Defaults to 0.0 degrees
            rotate: 90.0,
            child: Container(
              decoration: BoxDecoration(
                  color:!isDarkMode? appColors.white:appColors.appBgColor3,
                  border: Border.all(width: 4)
              ),
              child: FlutterClipPolygon(
                borderRadius: 18.0,
                rotate: 90.0,
                sides: 6,
                child: Container(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffE4B343).withOpacity(0.5),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile_camera_icon.png'),
                            scale: 20
                          )
                        ),
                        // child: Image(image: AssetImage('assets/images/setting_icon.png'),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )])));

    Widget gender = Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.grey.withOpacity(0.6),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 22),
        child: Row(
          children: [
            Text("Gender",style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500,
                color: !isDarkMode ?Colors.black.withOpacity(0.85):Colors.grey),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: Radio<int>(
                    value: 0,
                    groupValue: selectValue,
                    activeColor:  !isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                    onChanged: (value) =>setState(()=>selectValue = value!),
                  ),
                ),
                Text("Male",style:!isDarkMode ?
                    TextStyle(fontSize: 15,fontWeight: FontWeight.w500,
                    color: selectValue == 0?appColors.buttonColor2:Colors.black.withOpacity(0.9))
                    :TextStyle(fontSize: 15,fontWeight: FontWeight.w500,
                    color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                SizedBox(width: 40,),
                Transform.scale(
                  scale: 1.1,
                  child: Radio<int>(
                      value: 1,
                      activeColor:  !isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                      focusColor: Colors.white,

                      groupValue: selectValue,
                      onChanged: (value) =>setState(()=>selectValue = value! )
                  ),
                ),
                Text("Female",style: !isDarkMode?
                TextStyle(fontSize: 15,fontWeight: FontWeight.w500,
                    color: selectValue == 1?appColors.buttonColor2:Colors.black.withOpacity(0.9))
                :TextStyle(fontSize: 15,fontWeight: FontWeight.w500,
                    color: selectValue == 1?Color(0xffE4B343):Colors.white),)
              ],
            ),
          ],
        ),
      ),
    );

    //Username Field
    _userNameField() {
      return Container(
        padding: EdgeInsets.only(
            left: 20,right: 20,top: 25
        ),
        width: MediaQuery.of(context).size.width,
        child: CommonTextFieldWithError(
          focusNode: focusNodes['user_name'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['user_name']?.toString()??'',
          controllerT: controllers['user_name'],
          borderRadius: 50,
          inputHeight: 45,
          errorLeftRightMargin: 0,
          errorMsgHeight: 20,
          autoFocus: false,
          capitalization: CapitalizationText.none,
          cursorColor: Colors.grey,
          enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          backgroundColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
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
            color:!isDarkMode? Colors.black :Colors.white,
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
          inputHeight: 45,
          errorLeftRightMargin: 0,
          errorMsgHeight: 20,
          autoFocus: false,
          capitalization: CapitalizationText.none,
          cursorColor: Colors.grey,
          enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          textInputAction: TextInputAction.next,
          backgroundColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
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
            color:!isDarkMode? Colors.black :Colors.white,
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

    //Phone field
    _phoneField() {
      return Container(
        margin: EdgeInsets.only(
          left: 20,right: 20,top: 8,bottom: 5
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
          focusedBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          cursorColor: Colors.grey,
          borderStyle: BorderStyle.none,
          backgroundColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          inputKeyboardType: InputKeyboardTypeWithError.phone,
          textInputAction: TextInputAction.done,
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
            color:!isDarkMode? Colors.black :Colors.white,
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
                      left: MediaQuery.of(context).size.width/4.5,
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
                  flagWidth: 20,
                  showFlagDialog: true,
                  showDropDownButton: false,
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
                  textStyle: TextStyle(fontSize: 15,color: !isDarkMode?Colors.black:Color(0xffFE9654)),
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

    Widget dateOfBirth = DropDownDataPicker(
      hint:"Location" ,
      itemList: items.map(buildMenuItem).toList(),
    );

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 2),
        child: CommonButton(
          buttonName: "Update Profile",
          buttonHeight: 48,
          buttonColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327),),
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


    Widget bottomText = Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text("Your email verification is still pending.\n"
          " Please verify your account.",style: TextStyle(fontSize: 13,color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );



    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerFirst(
          bottomSafeArea: true,
          appBackgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
          contextCurrentView: context,
          // scrollPadding: EdgeInsets.only(bottom: 110),
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
          appBarHeight: 60,
          appBar: Container(
            color:!isDarkMode ?Colors.white:AppColors().appBgColor3,
            child: appBarWithBackArrow(
                backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
                isTitleVisible: true,
                isTrailingIconVisible: false,
                title: "Edit Profile",
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
          containChild:Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  profileImage,
                  _userNameField(),
                  _emailField(),
                  DatePickerWidget(isShowMonthName: true,errorHeight: 15,),
                  gender,
                  _phoneField(),
                  dateOfBirth,
                  SizedBox(height: 20,)
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: bottomButton(),
              )
            ],
          ),
        )
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item)  {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return DropdownMenuItem(
      value:item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: !isDarkMode?  Colors.black:Colors.white,
        ),
      )
  );}

}
