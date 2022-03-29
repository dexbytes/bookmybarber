import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_screens_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';

class HomeMenuScreen extends StatefulWidget {
  final String? userEmailId;
  final bool canBackArrow;

  const HomeMenuScreen({Key? key, this.userEmailId, this.canBackArrow = false})
      : super(key: key);
  @override
  _HomeMenuScreenState createState() => _HomeMenuScreenState();
}

AppStyle _appStyle = new AppStyle();

class _HomeMenuScreenState extends State<HomeMenuScreen>
    with TickerProviderStateMixin {
  _HomeMenuScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(appDimens.heightFullScreen());
    print('hello');
    appDimens.appDimensFind(context: context);

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
          //controllerT: emailController,
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
            texColor: appColors.textNormalColor3,
            fontFamily: appFonts.defaultFont2,
            fontWeight: appFonts.light300,
            fontSize: 16,
          ),
          hintText: appString.trans(
            context,
            appString.hintText,
          ),
          hintStyle: _appStyle.hStyle5(
            texColor: appColors.textNormalColor3,
            fontFamily: appFonts.defaultFont2,
            fontWeight: appFonts.light300,
            fontSize: 16,
          ),
        ),
      );
    }



    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: ContainerMenuPage(
        contextCurrentView: context,
        scrollPadding: EdgeInsets.only(bottom: 56),
/*        statusBarColor: Colors.amber,
        bottomBarSafeAreaColor: Colors.amber,*/
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        appBarHeight: -1,
        appBar: Container(
          color: Colors.red,
        ),
        containChild: Stack(
          children: [
            Column(
              children: [
                continueButton(),
                continueButton(),
                continueButton(),
                Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.orange,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              emailTextField(),
                              emailTextField(),
                              emailTextField(),
                            ],
                          )),
                          // continueButton(),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: emailTextField())),
                        ],
                      ),
                    )),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.green,
                    child: continueButton(),
                  ),
                )),
                /*continueButton(),
                emailTextField(),
                continueButton(),
                continueButton(),
                continueButton(),
                continueButton(),
                emailTextField(),
                continueButton(),
                continueButton(),
                emailTextField(),
                continueButton(),
                continueButton(),
                emailTextField(),*/
                /* Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                    ) */ /*Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(height: 78, child: _appBar),
                        addressBookImage(),
                        contactManagement(),
                        */ /* */ /*SizedBox(
                          height: appDimens.heightFullScreen() / 6,
                        ),*/ /* */ /*
                        signUpToday(),
                        SizedBox(
                          height: 8.0,
                        ),
                        noPaymentText(),
                      ],
                    )*/ /*
                    ),*/
                /*Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                    ) */ /*Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          continueButton(),
                        ])*/ /*
                    ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addressBookImage() {
    return Container(
      height: 174,
      width: 201,
      child: FittedBox(
        child: iconApps.iconImage(
          imageUrl: iconApps.appIcon, //imageColor:Colors.white
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget contactManagement() {
    return Container(
      alignment: Alignment.center,
      height: 26.0,
      child: Text(
        appString.trans(
          context,
          appString.contactManagement,
        ),
        style: _appStyle.hStyle13(
          fontSize: 20,
          texColor: appColors.textNormalColor6,
          //fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  Widget signUpToday() {
    return Container(
      child: Text(
        appString.trans(
          context,
          appString.signUpToday,
        ),
        style: _appStyle.hStyle4(
          fontSize: 17,

          //  fontStyle: FontStyle.ital
        ),
      ),
    );
  }

  Widget noPaymentText() {
    return Container(
      child: Text(
        appString.trans(
          context,
          appString.noPaymentRequired,
        ),
        style: _appStyle.hStyle2(fontSize: 13, fontWeight: FontWeight.w300
            //fontStyle: FontStyle.italic

            ),
      ),
    );
  }

  Widget continueButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: CommonButton(
        backCallback: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
          );
        },
        buttonName: appString.trans(
          context,
          appString.getStarted,
        ),
        textStyle: TextStyle(color: AppColors().buttonTextColor),
      ),
    );
  }
}
