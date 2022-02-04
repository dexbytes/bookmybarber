import 'package:base_flutter_app/src/image_res/iconApp.dart';

import 'package:base_flutter_app/src/model/select_contact_model.dart';

import 'package:flutter/material.dart';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';

class AccountSetUpPage extends StatefulWidget {
  final String? userEmailId;
  final bool canBackArrow;

  const AccountSetUpPage(
      {Key? key, this.userEmailId, this.canBackArrow = false})
      : super(key: key);
  @override
  _VerificationCodePage createState() => _VerificationCodePage();
}

AppStyle _appStyle = new AppStyle();
bool isClickedValue = false;

class _VerificationCodePage extends State<AccountSetUpPage>
    with TickerProviderStateMixin {
  int counter = 0;
  late List<SelectContactModel> selectContactList = [];
  bool isEnableNext = false;
  bool isClicked = false;

  @override
  void initState() {
    selectContactList.add(
      SelectContactModel(
        clickStatus: false,
        name: "Outlook",
        id: 0,
        image: iconApps.outlookPhoto,
        image1: iconApps.outlookPhoto,
      ),
    );
    selectContactList.add(SelectContactModel(
        clickStatus: false,
        name: "Google ",
        id: 1,
        image: iconApps.googlePhoto,
        image1: iconApps.googlePhoto));
    selectContactList.add(SelectContactModel(
        clickStatus: false,
        name: "Phone",
        id: 2,
        image: iconApps.phonePhoto,
        image1: iconApps.phonePhoto));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Container(
                color: appColors.appBgColor,
                child: SafeArea(
                    bottom: false,
                    child: Stack(
                      //    physics:  new NeverScrollableScrollPhysics() ,
                      children: [
                        Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 39.0, right: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                                height: appDimens
                                                        .heightFullScreen() /
                                                    5.5),
                                            hiNickHeadingText(),
                                            setUpAccountText(),
                                            step1Of2Text(),
                                            importContactText(),
                                            selectOption(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35.0, right: 20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        nextButtonAndSkipText(),
                                        //      continueButton(),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    )))),
      ),
    );
  }

  Widget selectOption() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Row(
        children: selectContactList
            .map((SelectContactModel selectContactModel) => Expanded(
                    child: Container(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      isClicked = selectContactModel.clickStatus;
                      int clickedId = selectContactModel.id;
                      bool isAnySelected = false;
                      isEnableNext = false;

                      setState(() {});
                      selectContactList = selectContactList.map((e) {
                        // e.clickStatus = false;
                        if (clickedId == e.id) {
                          e.clickStatus = !isClicked;
                        }
                        if (e.clickStatus || isAnySelected) {
                          setState(() {
                            isEnableNext = true;
                            print('hello');
                            print(isEnableNext);
                          });
                        } else {
                          setState(() {
                            isEnableNext = false;
                            print('hello1');
                            print(isEnableNext);
                          });
                        }

                        return e;
                      }).toList();

                      setState(() {});
                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Container(
                          width: 55,
                          height: 39,
                          child: selectContactModel.clickStatus
                              ? iconApps.iconImage(
                                  imageUrl: selectContactModel.image,
                                  iconSize: Size.fromHeight(15),
                                )
                              : iconApps.iconImage(
                                  imageUrl: selectContactModel.image1,
                                  iconSize: Size.fromHeight(15),
                                ),
                        ),
                      ),
                      subtitle: Container(
                          width: 113,
                          child: Text(
                            selectContactModel.name,
                            style: _appStyle.hStyle9(
                                texColor: selectContactModel.clickStatus
                                    ? appColors.textNormalColor3
                                    : appColors.textNormalColor),
                          )),
                    ),
                  ),
                )))
            .toList(),
      ),
    );
  }

  Widget howManyWorkText() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 39.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            appString.trans(context, appString.howManyContactText),
            style: _appStyle.hStyle9(),
          ),
        ),
      ),
    );
  }

  Widget importContactText() {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0, bottom: 22, left: 2.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          appString.trans(
            context,
            appString.importContact,
          ),
          style: _appStyle.hStyle11(),
        ),
      ),
    );
  }

  Widget step1Of2Text() {
    return Padding(
      padding: const EdgeInsets.only(top: 42, left: 2.0),
      child: Row(
        children: [
          Container(
            child: Text(
              appString.trans(
                context,
                appString.step1Of3,
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

  Widget hiNickHeadingText() {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(
          appString.trans(context, appString.hiNickText),
          style: _appStyle.hStyle14(
              texColor: AppColors().textNormalColor7, fontSize: 38),
        ));
  }

  Widget setUpAccountText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        appString.trans(
          context,
          appString.setUpYours,
        ),
        style: _appStyle.hStyle14(fontSize: 34),
      ),
    );
  }

  Widget nextButtonAndSkipText() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 55.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: appDimens.widthFullScreen() / 2.2,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    appString.trans(
                      context,
                      appString.skip,
                    ),
                    style: _appStyle.privacyPolicyWithUnderlineStyle1(),
                  ),
                ),
              ),
              SizedBox(width: 35),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CommonButton(
                    backCallback: () {
                      setState(() {});
                    },
                    buttonWidth: 94,
                    buttonHeight: 48,
                    isBottomMarginRequired: true,
                    buttonBorderWidth: 2.0,
                    buttonColor: isEnableNext
                        ? appColors.buttonBgColor
                        : appColors.buttonTextColor3,
                    buttonName: appString.trans(
                      context,
                      appString.nextBtn,
                    ),
                    textStyle: TextStyle(
                      color: appColors.buttonTextColor4,

                      fontSize: 16,
                      fontFamily: appFonts.defaultFont2,

                      //   fontWeight: appFonts.defaultFont
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
