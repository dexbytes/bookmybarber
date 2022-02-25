import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_screens_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignInWithEmailPage extends StatefulWidget {
  final String? userEmailId;
  final bool canBackArrow;

  const SignInWithEmailPage(
      {Key? key, this.userEmailId, this.canBackArrow = false})
      : super(key: key);
  @override
  _SignInWithEmailPageState createState() => _SignInWithEmailPageState();
}

AppStyle _appStyle = new AppStyle();
AppColors _appColors = new AppColors();

class _SignInWithEmailPageState extends State<SignInWithEmailPage>
    with TickerProviderStateMixin {
  final emailController = TextEditingController();
  bool isScrolled = false;
  late FocusNode myFocusNode;

  _SignInWithEmailPageState();

  @override
  void initState() {
    myFocusNode = FocusNode();
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
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appDimens.appDimensFind(context: context);
    SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);
    MainAppBloc mainAppBloc = BlocProvider.of<MainAppBloc>(context);
    //  AppStyle _appStyle = BlocProvider.of<AppStyle>(context);
    //   AppColors _appColors =  BlocProvider.of<AppColors>(context);
    //Appbar
    Widget _appBar = Container();

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
                        //      resizeToAvoidBottomInset: false,
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
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Column(
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
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

                                                  /* SizedBox(
                                  height: 22.0,
                                ),*/
                                                  emailTextField(),

                                                  SizedBox(
                                                    height: appDimens
                                                            .heightFullScreen() /
                                                        20,
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  continueButton(),
                                                  termsAndConditionText()
                                                ],
                                              ),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              //  resizeToAvoidBottomInset: true,
                              // appBar: _appBar,
                              //    backgroundColor: appColors.appBgColor,
                            ))),
                  )))),
    );
  }

  Widget signUpHeading() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        appString.trans(context, appString.signInTitle),
        style: _appStyle.hStyle1(fontSize: 36),
      ),
    );
  }

  Widget signUpWithYour() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          appString.trans(context, appString.signInEmail),
          style: _appStyle.hStyle3(
              fontSize: 16,
              fontFamily: appFonts.defaultFont2,
              fontWeight: appFonts.semiBold600,
              texColor: _appColors.textNormalColor3),
        ),
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

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
      ),
      child: CommonTextFieldWithError(
        //  focusNode: focusNodes['password'],
        showError: false,
        autoFocus: true,
        inputKeyboardType: InputKeyboardTypeWithError.email,
        controllerT: emailController,
        borderRadius: 8,
        onTextChange: (value) {},
        onEndEditing: (value) {},
//E5E5E5
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
      ),
    );
  }

  Widget continueButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: CommonButton(
        backCallback: () {
          /*  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TermsScreen(),
            ),
          );*/
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
          left: 2.0,
          right: 2.0,
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
                      }),
              ]),
        ));
  }
}
