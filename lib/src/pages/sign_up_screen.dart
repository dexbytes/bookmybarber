import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/verification_code_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignUpPage extends StatefulWidget {
  final String? userEmailId;
  final bool canBackArrow;

  const SignUpPage({Key? key, this.userEmailId, this.canBackArrow = false})
      : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

AppStyle _appStyle = new AppStyle();
AppColors _appColors = new AppColors();

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  late FocusNode emailFocusNode;
  bool isScrolled = false;
  _SignUpPageState();

  @override
  void initState() {
    emailFocusNode = FocusNode();
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
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

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
                  // resizeToAvoidBottomInset: false,
                  // appBar: _appBar,
                  backgroundColor: appColors.appBgColor,
                  body: SingleChildScrollView(
                    //  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    //reverse: true,
                    //       padding:EdgeInsets.only(bottom:40) ,
                    //     scrollPadding: EdgeInsets.only(bottom:40),

                    physics: isScrolled
                        ? ClampingScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: appDimens.heightFullScreen(),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 20.0,
                          ),
                          child: Column(
                            children: [
                              /*  Container(
                                height: 78,
                                 child: _appBar,),*/
                              /*  ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: (appDimens.heightFullScreen() -
                                        (appDimens.appBarHeight() +
                                            (appDimens.statusBarHeight() * 2) +
                                            2))),

                                child: Container()

                                ),*/
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        signUpHeading(),
                                        //   SizedBox(height:appDimens.heightFullScreen() / 10 ,),

                                        /* SizedBox(
                                    height: 33.0,
                                  ),*/

                                        signUpWithYour(),
                                        /*SizedBox(
                                    height: 10.0,
                                  ),*/
                                        combineRecommendedAndContactText(),
                                        /* SizedBox(
                                    height: 22.0,
                                  ),*/
                                        emailTextField(keyboardHeight),

                                        SizedBox(
                                          height:
                                              appDimens.heightFullScreen() / 20,
                                        ),
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
                                    termsAndConditionText()
                                  ],
                                )),
                              )
                            ],
                          )),
                    ),
                  ),

                  //  resizeToAvoidBottomInset: true,
                  // appBar: _appBar,
                  //    backgroundColor: appColors.appBgColor,
                ))),
      ),
    ));
  }

  Widget signUpHeading() {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(
          appString.trans(context, appString.signUpText),
          style: _appStyle.hStyle14(),
        ));
  }

  Widget combineRecommendedAndContactText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          recommendedChangesText(),
          SizedBox(
            height: 10.0,
          ),
          contactText(),
        ],
      ),
    );
  }

  Widget signUpWithYour() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        children: [
          Container(
            child: Text(
              appString.trans(context, appString.signUpWith),
              style: _appStyle.hStyle3(
                  fontSize: 16,
                  fontFamily: appFonts.defaultFont2,
                  fontWeight: appFonts.semiBold600,
                  texColor: _appColors.textNormalColor3),
            ),
          ),
          Container(
            child: Text(
              appString.trans(context, appString.personalEmail),
              style: _appStyle.hStyle6(
                  fontSize: 16,
                  fontFamily: appFonts.defaultFont,
                  fontWeight: appFonts.semiBold600,
                  texColor: _appColors.textNormalColor4
//font style light italic
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommendedChangesText() {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Row(
        //   mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconApps.iconImage(
            imageUrl: iconApps.rightIcon,
          ),
          SizedBox(
            width: 13.0,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child: Text(
                appString.trans(
                  context,
                  appString.recommendedText,
                ),
                style: _appStyle.hStyle1(
                  //fontStyle: FontStyle.italic
                  texColor: _appColors.textNormalColor3,
                  fontWeight: appFonts.light300,
                  fontSize: 13,
                  fontFamily: appFonts.defaultFont2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contactText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.visibility_off_rounded,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          width: 13.0,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            child: Text(
              appString.trans(
                context,
                appString.contactWillText,
              ),
              style: _appStyle.hStyle1(
                texColor: _appColors.textNormalColor3,
                fontWeight: appFonts.light300,
                fontSize: 13,
                fontFamily: appFonts.defaultFont2,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget emailTextField(keyboardHeight) {
    return CommonTextFieldWithError(
      //scrollPadding: EdgeInsets.symmetric(vertical: keyboardHeight + 20),
      //  focusNode: focusNodes['password'],
      placeHolderEdgeInsets:
          EdgeInsets.only(bottom: appDimens.heightFullScreen() / 85),
      showError: false,
      autoFocus: true,

      inputKeyboardType: InputKeyboardTypeWithError.email,
      controllerT: emailController,
      borderRadius: 8,
      onTextChange: (value) {},
      onEndEditing: (value) {},

      // enabledBorderColor: _appColors.buttonBorderColor1,
      //  focusedBorderColor: _appColors.buttonBorderColor1,
      errorText: null,
      //buttonBorderColor1
      //  backgroundColor: _appColors.editTextBgColor,
      // inputKeyboardType: InputKeyboardType.text,
      textStyle: _appStyle.hStyle5(
        texColor: _appColors.textNormalColor3,
        fontFamily: appFonts.defaultFont2,
        fontWeight: appFonts.light300,
        fontSize: 16,
      ),
      hintText: appString.trans(
        context,
        appString.hintText,
      ),
      hintStyle: _appStyle.hStyle5(
        texColor: _appColors.textNormalColor3,
        fontFamily: appFonts.defaultFont2,
        fontWeight: appFonts.light300,
        fontSize: 16,
      ),
    );
  }

  Widget continueButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: CommonButton(
        backCallback: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationCodePage(),
            ),
          );
        },
// buttonColor: Colors.pink,
        //    buttonBorderColor: Colors.green,
        buttonBorderWidth: 1,
        buttonName: appString.trans(
          context,
          appString.continueBtnT,
        ),
        textStyle: TextStyle(color: AppColors().buttonTextColor),
      ),
    );
  }

  Widget termsAndConditionText() {
    return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(
          //  top: 24.0,
          left: 1.0,
          right: 1.0,
          /*appDimens.verticalMarginPadding(
              value: appDimens.heightFullScreen() / 30),*/
          bottom: 10.0,
          /*appDimens.verticalMarginPadding(
              value:appDimens.heightFullScreen() / 30*/
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: appString.trans(
                context,
                appString.byTappingText,
              ),
              style: _appStyle.hStyle1(
                texColor: _appColors.textNormalColor3,
                fontWeight: appFonts.light300,
                fontSize: 14,
                fontFamily: appFonts.defaultFont2,
              ),
              children: [
                TextSpan(
                    text: appString.trans(context, appString.termsOfServices),
                    style: _appStyle.privacyPolicyWithUnderlineStyle1(),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => TermsScreen(),
                        //   ),
                        // );
                      }),
                TextSpan(
                  text: appString.trans(context, appString.and),
                  style: _appStyle.hStyle1(
                    texColor: _appColors.textNormalColor3,
                    fontWeight: appFonts.light300,
                    fontSize: 14,
                    fontFamily: appFonts.defaultFont2,
                  ),
                ),
                TextSpan(
                  text: " ",
                  style: _appStyle.hStyle6(
                      fontSize: 14,
                      fontFamily: appFonts.defaultFont,
                      fontWeight: appFonts.semiBold600,
                      texColor: _appColors.textNormalColor4
//font style light italic
                      ),
                ),
                TextSpan(
                    text: appString.trans(
                      context,
                      appString.privacyPolicy,
                    ),
                    style: _appStyle.privacyPolicyWithUnderlineStyle1(),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PrivacyPolicyScreen(),
                        //   ),
                        // );
                      })
              ]),
        ));
  }
}
