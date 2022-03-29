import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class VerificationCodePage extends StatefulWidget {
  final String? userEmailId;
  final bool canBackArrow;

  const VerificationCodePage(
      {Key? key, this.userEmailId, this.canBackArrow = false})
      : super(key: key);
  @override
  _VerificationCodePage createState() => _VerificationCodePage();
}

AppStyle _appStyle = new AppStyle();

class _VerificationCodePage extends State<VerificationCodePage>
    with TickerProviderStateMixin {
  FocusNode otpFocusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  _VerificationCodePage();
  bool isScrolled = false;

  @override
  void initState() {
    otpController = TextEditingController();
    otpFocusNode = FocusNode();
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print(
        'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
      if (visible) {
        setState(() {
          isScrolled = true;
        });
      } else {
        setState(() {
          isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appDimens.appDimensFind(context: context);


    //Return main Ui view
    return Material(
      child: WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Container(
                color: appColors.appBgColor,
                child: SafeArea(
                    bottom: false,
                    child: Scaffold(
                      backgroundColor: appColors.appBgColor,
                      body: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 12.0),
                        child: SingleChildScrollView(
                          physics: isScrolled
                              ? ClampingScrollPhysics()
                              : NeverScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: appDimens.heightFullScreen()),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //  Container(height: 78, child: _appBar),
                                          //  SizedBox(height:appDimens.heightFullScreen() / 5.5),
                                          /*  ConstrainedBox(
                            constraints: BoxConstraints(
                            maxHeight: (appDimens.heightFullScreen() -
                            (appDimens.appBarHeight() +
                                (appDimens.statusBarHeight() * 2) +
                                2))),
              child:needHelpAndContactUs(),
            ), SizedBox(
            height: appDimens.heightFullScreen()-
      ),*/
                                          step1Of2Text(),
                                          // SizedBox(height: 16,),
                                          secretCodeText(),
                                          // SizedBox(height: 24,),
                                          verificationCodeText(),
                                          //otpField(context,otpController,myFocusNode),
                                          // SizedBox(height:appDimens.heightFullScreen() / 15 ,),
                                          //  verificationCode(),
                                          codeExpiresText(),
                                          // SizedBox(heigh
                                          // t: 8,),
                                          junkFolderText(),
                                          // SizedBox(height: 22,),
                                          resendNewCodeText(),

                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          continueButton(),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 32.0),
                                              child: needHelpAndContactUsText(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )))),
      ),
    );
  }

  Widget step1Of2Text() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            child: Text(
              appString.trans(
                context,
                appString.step1Of2,
              ),
              style: _appStyle.hStyle2(
                texColor: appColors.textNormalColor3,
                fontSize: 14,

                //fontStyle: FontStyle.italic
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          iconApps.iconImage(
            imageUrl: iconApps.active,
          ),
          SizedBox(
            width: 8,
          ),
          iconApps.iconImage(
            imageUrl: iconApps.inActive,
          ),
          SizedBox(
            width: 8,
          ),
          iconApps.iconImage(
            imageUrl: iconApps.inActive,
          ),
        ],
      ),
    );
  }

  Widget secretCodeText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        appString.trans(
          context,
          appString.secretCode,
        ),
        style: _appStyle.hStyle2(
          fontSize: 18,
          fontWeight: FontWeight.w400,

          //fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  verificationCodeText() {
    // Color fieldBackgroundColor = Color(0xFF5D3F30);
    // Color activeBorderColor = Color(0xFF6FCF97);
    // Color activeBackgroundColor = Color(0xFF5D3F30);
    //575757

    return Container(
        margin: EdgeInsets.only(bottom: 5, top: 25, left: 0, right: 0),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
        child: PinCodeFields(
            focusNode: otpFocusNode,
            obscureText: false,
            controller: otpController,
            length: 4,
            margin: EdgeInsets.all(5),
            fieldBorderStyle: FieldBorderStyle.Square,
            responsive: false,
            fieldHeight: 80.0,
            fieldWidth: 61.0,
            borderWidth: 4.0,
            activeBorderColor: appColors.activeBorderColor,
            activeBackgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            keyboardType: TextInputType.number,
            autoHideKeyboard: true,
            autofocus: true,
            enabled: true,
            fieldBackgroundColor: Colors.transparent,
            borderColor: appColors.borderColor,
            textStyle: TextStyle(
              color: appColors.activeBorderColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            onChange: (value) {
              //     verificationCodeStr = "$value";
              //   print(value + "### $verificationCodeStr");
            },
            onComplete: (output) {
              otpFocusNode.unfocus();
              FocusScope.of(context).requestFocus(otpFocusNode);
              //   if (otpController != null) otpController.dispose();
              setState(() {});

              //setState(() {
              //     verificationCodeStr = output;
              //   if (verificationCodeStr != "" &&
              //    verificationCodeStr.length == 6) {
              //    FocusScope.of(context).requestFocus(FocusNode());
            }
            // });
            // Your logic with pin code
            //     print(output + "Final $verificationCodeStr");

            ));
  }

  Widget codeExpiresText() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        child: Text(
          appString.trans(context, appString.codeExpires),
          style: _appStyle.hStyle4(
            fontSize: 14,
            fontFamily: appFonts.defaultFont2,
            fontWeight: FontWeight.w300,
            texColor: appColors.textNormalColor,
          ),
        ),
      ),
    );
  }

  Widget junkFolderText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Text(
          appString.trans(
            context,
            appString.junkFolder,
          ),
          style: _appStyle.hStyle1(
            //fontStyle: FontStyle.italic
            texColor: appColors.textNormalColor3,
            fontWeight: appFonts.light300,
            fontSize: 14,
            fontFamily: appFonts.defaultFont2,
          ),
        ),
      ),
    );
  }

  Widget resendNewCodeText() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        child: Text(
          appString.trans(context, appString.resendCode),
          style: _appStyle.privacyPolicyWithUnderlineStyle1(
            fontSize: 16,
            texColor: appColors.textNormalColor5,
            fontFamily: appFonts.defaultFont2,
          ),
          // fontSize: 16,fontFamily: appFonts.defaultFont,
          //  fontWeight:appFonts.semiBold600,
          //   texColor: appColors.primaryColor
//font style light italic
        ),
      ),
    );
  }

  Widget continueButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(right: 12),
        child: CommonButton(
          backCallback: () {},
          buttonName: appString.trans(
            context,
            appString.continueBtnT,
          ),
          textStyle: TextStyle(
            color: AppColors().buttonTextColor, fontSize: 16,
            fontFamily: appFonts.defaultFont2,

            //   fontWeight: appFonts.defaultFont
          ),
        ),
      ),
    );
  }

  Widget needHelpAndContactUsText() {
    return Container(
        child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: appString.trans(
            context,
            appString.needHelp,
          ),
          style: _appStyle.hStyle1(
            texColor: appColors.textNormalColor3,
            fontWeight: appFonts.light300,
            fontSize: 14,
            fontFamily: appFonts.defaultFont2,
          ),
          children: [
            TextSpan(
                text: appString.trans(context, appString.contactUs),
                style: _appStyle.privacyPolicyWithUnderlineStyle1(),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PrivacyPolicyScreen(),
                    //   ),
                    // );
                  }),
          ]),
    ));
  }
}
