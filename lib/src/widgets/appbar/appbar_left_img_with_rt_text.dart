/*
import 'package:flutter/material.dart';

class AppbarLeftImgWithRtText extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget;
  final height;
  final bool canBackArrow;
  AppbarLeftImgWithRtText({
    Key? key,
    this.commonAppBarOf,
    this.height = 56,
    this.canBackArrow = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Container(
          color: appBarColorSetting(),
          child: Stack(
            children: [
              //Top right icon
              Positioned(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: commonAppBarOf == CommonBgOf.WELCOME_SCREEN ||
                              commonAppBarOf == CommonBgOf.VERIFICATION_CODE ||
                              commonAppBarOf == CommonBgOf.SIGN_IN_SCREEN ||
                              commonAppBarOf == CommonBgOf.SIGN_UP_SCREEN
                          ? Container()
                          : Container(
                              width: commonAppBarOf == CommonBgOf.GROUP_GIFT
                                  ? appDimens.widthDynamic(value: 110)
                                  : appDimens.widthDynamic(value: 140),
                              child: getTopRightIcon(),
                            ))),

              //Elephant icon
              commonAppBarOf == CommonBgOf.PHOTO_SCREEN ||
                      commonAppBarOf == CommonBgOf.VERIFICATION_CODE ||
                      commonAppBarOf == CommonBgOf.SIGN_IN_SCREEN ||
                      commonAppBarOf == CommonBgOf.SIGN_UP_SCREEN
                  ? Container()
                  : Positioned(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.only(top: 15),
                              child: getElephantIcon())),
                    ),

              //App bar title and back arrow
              (!canBackArrow &&
                      (commonAppBarOf == CommonBgOf.SIGN_UP_SCREEN ||
                          commonAppBarOf == CommonBgOf.SIGN_IN_SCREEN))
                  ? Container()
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TitleWithBackArrow(
                            showBackArrow: showBackArrowValue(),
                            title: getAppBarTitle(),
                            backArrowCallback: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),

                        //Progress bar
                        commonAppBarOf == CommonBgOf.WELCOME_SCREEN ||
                                commonAppBarOf == CommonBgOf.SIGN_UP_SCREEN ||
                                commonAppBarOf == CommonBgOf.SIGN_IN_SCREEN ||
                                commonAppBarOf == CommonBgOf.VERIFICATION_CODE
                            ? Container()
                            : Container(
                                padding: EdgeInsets.only(
                                    top: commonAppBarOf == CommonBgOf.GROUP_GIFT
                                        ? 15.0
                                        : 40),
                                margin: EdgeInsets.symmetric(
                                    horizontal: _leftRightMargin),
                                child: Container(
                                  child: BarProgress(
                                    // text:TextSpan(text: index == 0?'${_appState2.getUploadFileCounts}':''),
                                    text: TextSpan(text: ''),
                                    percentage: getPercentage(),
                                    backColor: getHighlightedColor(),
                                    color: getBackColor(),
                                    showPercentage: true,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                    stroke: 4,
                                    round: true,
                                  ),
                                ),
                              ),
                      ],
                    )
            ],
          ),
        ),
        preferredSize: Size(
            appDimens.widthFullScreen(),
            (commonAppBarOf == CommonBgOf.GROUP_GIFT)
                ? 110
                : commonAppBarOf == CommonBgOf.WELCOME_SCREEN
                    ? 80
                    : 140));
  }
}

//welcomeGiraffeMask
*/
