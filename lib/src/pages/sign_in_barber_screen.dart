import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/forgot_password_screen.dart';
import 'package:base_flutter_app/src/pages/sign_up_barber_screen.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  Map<String, TextEditingController> controllers = {
    'email': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'email': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'email': "",
    'password': "",
  };
  TextEditingController inputController = new TextEditingController();


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

  _topView() {
      return Container(
          alignment: Alignment.topCenter,
          child: ShaderMask(
            shaderCallback: (bound) =>LinearGradient(
              colors: [Colors.black38.withOpacity(0.1),Colors.black87.withOpacity(0.1)],
              begin:Alignment.topRight,
              end: Alignment.bottomRight,
            ).createShader(bound),
            blendMode: BlendMode.darken,
            child:CachedNetworkImage(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width,
              imageUrl: "https://media1.popsugar-assets.com/files/thumbor/objfVkqK2u27teSwF05B732vpHg/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2021/04/09/609/n/29590734/tmp_hzooXG_c3a3612a3e8fdf28_GettyImages-1235174298.jpg",
              fit:BoxFit.cover,
            ),
          )
      );
    }

  _welcomeTextView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Welcome back",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors().textHeadingColor1
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10,
        ),
        Text("STYLE THAT FIT YOUR LIFESTYLE",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors().textNormalColor6.withOpacity(0.8)
          ),
          textAlign: TextAlign.start,
        )
      ],
    );
  }

 //Email Field
  _emailField() {
    return Container(
      padding: EdgeInsets.only(
          left: 25,right: 20,
          top: 25
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
        autoFocus: false,
        capitalization: CapitalizationText.sentences,
        cursorColor: Colors.grey,
        enabledBorderColor: Color(0xff323446),
        focusedBorderColor:Color(0xff323446),
        textInputAction: TextInputAction.next,
        backgroundColor: Color(0xff323446),
        borderStyle: BorderStyle.none,
        inputKeyboardType: InputKeyboardTypeWithError.email,
        hintText: "Email",
        hintStyle: TextStyle(
          fontSize: 17,
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

  //Visibility icons
  Widget visibilityOffIcon = Icon(
    Icons.visibility_off,
    color: Color(0xff828588),
    size: 25,
  );
  Widget visibilityOnIcon = Icon(
    Icons.visibility,
    color:  Color(0xff828588),
    size: 25,
  );

  //Password Field
  _passwordField() {
    return Container(
       padding: EdgeInsets.symmetric(
        horizontal: 25,
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
            inputHeight: 50,
            errorMsgHeight: 24,
            autoFocus: false,
            errorLeftRightMargin: 0,
            capitalization: CapitalizationText.sentences,
            cursorColor: Colors.grey,
            enabledBorderColor: Color(0xff323446),
            focusedBorderColor: Color(0xff323446),
            textInputAction: TextInputAction.next,
            backgroundColor: Color(0xff323446),
            borderStyle: BorderStyle.none,
            inputKeyboardType: InputKeyboardTypeWithError.email,
            obscureText: hideNewPassword,
            hintText: appString.trans(context, appString.password), //appString.trans(context, appString.createAPassword),
            hintStyle:TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xff828588),
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.only(left: 25),
            inputFieldSuffixIcon: Padding(
              padding: EdgeInsets.only(right: 12),
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


  bottomButton(){
    return Container(
      margin: EdgeInsets.only(left: 28,right: 28,top: 30),
      child:CommonButton(
        buttonHeight: 50,
        buttonName: "Login",
        buttonColor: AppColors().buttonColor,
        textStyle: TextStyle(fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xff212327),),
        backCallback:(){
          Navigator.push(
            context,
            SlideRightRoute(
                widget: DashBoardPage()),
          );
        },
        isBottomMarginRequired: false,
      ),
    );
  }

  forgotText(){
    return Container(
      margin: EdgeInsets.only(left: 28,right: 28,top: 30),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: ForgotPasswordScreen()),
            );
          },
          child: Text("Forgot your password\?",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color:AppColors().buttonTextColor
            ),
          ),
        ),
      )
    );
  }

  Widget signUpText = Container(
    margin: EdgeInsets.only(bottom: 20),
      child: AlreadyHaveAccountRow(
        leftText: "Don't have an account\?",
        leftTextStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color:Color(0xff828588),),
        rightText: "Sign Up",
        signInCallBack: (){
          Navigator.push(
            context,
            SlideRightRoute(
                widget: SignUpScreen()),
          );
        },
      ),
    );



  Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/2.8,
      child: Container(
        padding: EdgeInsets.only(top: 35),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Color(0xff212327),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ContainerMenuPage(
          contextCurrentView: context,
          scrollPadding: EdgeInsets.only(bottom: 70),
          /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          appBarHeight: -1,
          appBar: Container(),
          containChild: Column(
            children: [
              _welcomeTextView(),
              SizedBox(height: 18),
              _emailField(),
              _passwordField(),
              bottomButton(),
              forgotText(),
              SizedBox(height: 28,),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: signUpText
              )
            ],
          ),
        )

        // Column(
        //   children: [
        //     _welcomeTextView(),
        //     SizedBox(height: 18),
        //     _emailField(),
        //     _passwordField(),
        //     bottomButton(),
        //     forgotText(),
        //     SizedBox(height: 28,),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: signUpText
        //     )
        //   ],
        // ),
      ),
    );




    return ContainerMenuPage(
      contextCurrentView: context,
      // scrollPadding: EdgeInsets.only(bottom: 81),
      /* statusBarColor: Colors.amber,
        bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: false,
      isFixedDeviceHeight: true,
      appBarHeight: -1,
      appBar: Container(),
      containChild:Container(
          height: size.height,
          width: size.height,
          child: Stack(
            children: [
              _topView(),
              bottomCardView
            ],
          ),
        ),

    );
  }
}

