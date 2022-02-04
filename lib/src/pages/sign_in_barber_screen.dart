import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(30),
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/sign_in_image.png'),
          ),
        ),
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
        autoFocus: true,
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
            autoFocus: true,
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
        backCallback:(){},
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
          onTap: (){},
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
        child: Column(
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

