import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ContainerFirst extends StatelessWidget {
  final Color appBackgroundColor;
  final Color? backgroundColor;
  final Color? bottomBarSafeAreaColor;
  final Color? statusBarColor;
  final Widget containChild;
  final bool isFixedDeviceHeight; // if it true than
  final bool reverse; // if it true than
  final bool isSingleChildScrollViewNeed; // if it true than
  final Widget? appBar; // if it true than
  final double
      appBarHeight; // if it true than   custom height appBarHeight>0, no app bar appBarHeight < 0, Default system appBar height  appBarHeight == 0
  final bool scrollingOnKeyboardOpen; // if it true than
  final BuildContext contextCurrentView; // if it true than
  const ContainerFirst({
    Key? key,
    required this.contextCurrentView,
    required this.containChild,
    this.bottomBarSafeAreaColor,
    this.appBackgroundColor = Colors.white,
    this.statusBarColor,
    this.isFixedDeviceHeight = true,
    this.scrollingOnKeyboardOpen = true,
    this.appBar,
    this.appBarHeight = 0,
    this.isSingleChildScrollViewNeed = true,
    this.reverse = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double remainingViewFullHeight = calculateHeight(context: context);
    bool isKeyBoardOpen = false;
    // Check if keyboard opened or not
    /*try {
      isKeyBoardOpen =
          KeyboardVisibilityProvider.isKeyboardVisible(contextCurrentView);
      print("Keyboard open status $isKeyBoardOpen");
    } catch (e) {
      print(e);
    }*/
    //Set status bar and bottom sef area color
    Color? statusBarColor = this.statusBarColor;
    Color? bottomBarSafeAreaColor = this.bottomBarSafeAreaColor;

    //Set status bar and bottom sef area color
    if (statusBarColor == null) {
      statusBarColor = appBackgroundColor;
    }
    if (bottomBarSafeAreaColor == null) {
      bottomBarSafeAreaColor = appBackgroundColor;
    }

    // Main view return according to Scroll need condition
    Widget returnSubMainView(
        {ScrollPhysics scrollPhysics = const ClampingScrollPhysics(),
        double remainingViewFullHeight = -1}) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            reverse: reverse,
            physics: scrollPhysics,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: remainingViewFullHeight > 0
                    ? remainingViewFullHeight
                    : viewportConstraints.minHeight,
              ),
              child: IntrinsicHeight(child: containChild),
            ),
          );
        },
      );
    }

    // Main view return according to Scroll need condition
    Widget returnMainView() {
      if (isSingleChildScrollViewNeed && !isFixedDeviceHeight) {
        return returnSubMainView() /*SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: containChild,
        )*/
            ;
      } else if (!isSingleChildScrollViewNeed && !isFixedDeviceHeight) {
        return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
          isKeyBoardOpen = isKeyboardVisible;
          print("Keyboard open status $isKeyBoardOpen");
          return returnSubMainView(
              scrollPhysics: scrollingOnKeyboardOpen
                  ? (isKeyBoardOpen
                      ? ClampingScrollPhysics()
                      : NeverScrollableScrollPhysics())
                  : NeverScrollableScrollPhysics());
        }); /*SingleChildScrollView(
          physics: scrollingOnKeyboardOpen
              ? (isKeyBoardOpen
                  ? ClampingScrollPhysics()
                  : NeverScrollableScrollPhysics())
              : NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 100,
              )
            ],
          ),
        )*/
        ;
      } else if (!isSingleChildScrollViewNeed && isFixedDeviceHeight) {
        return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
          isKeyBoardOpen = isKeyboardVisible;
          print("Keyboard open status $isKeyBoardOpen");
          return returnSubMainView(
              scrollPhysics: scrollingOnKeyboardOpen
                  ? (isKeyBoardOpen
                      ? ClampingScrollPhysics()
                      : NeverScrollableScrollPhysics())
                  : NeverScrollableScrollPhysics(),
              remainingViewFullHeight: remainingViewFullHeight);
        })

            /*ConstrainedBox(
          constraints: BoxConstraints(maxHeight: remainingViewFullHeight),
          child:
          SingleChildScrollView(
            physics: scrollingOnKeyboardOpen
                ? (isKeyBoardOpen
                    ? ClampingScrollPhysics()
                    : NeverScrollableScrollPhysics())
                : NeverScrollableScrollPhysics(),
            child: containChild,
          ),
        )*/
            ;
      } else {
        return returnSubMainView(
                remainingViewFullHeight:
                    remainingViewFullHeight) /*ConstrainedBox(
          constraints: BoxConstraints(maxHeight: remainingViewFullHeight),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: containChild,
          ),
        )*/
            ;
      }
    }

    return Scaffold(
      backgroundColor:backgroundColor ??Color(0xff212327),
      body: SafeArea(
        bottom: false,
        top: false,
        // maintainBottomViewPadding: true,
        child: Column(
          children: [
            StatusBar(statusBarColor: statusBarColor),
            AppBarView(
                appBar: this.appBar, appBarHeight: calculateAppBarHeight()),
            Expanded(
              child: ScrollConfiguration(
                  behavior: MyBehavior(), child: returnMainView()),
            ),
            BottomBarSafeArea(bottomBarSafeAreaColor: bottomBarSafeAreaColor),
          ],
        ),
      ),
    );
  }

  double calculateHeight({required BuildContext context}) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double fullScreenSize = mediaQueryData.size.height;
    double remainingViewFullHeight = fullScreenSize;

    double statusBarHeight = mediaQueryData.padding.top;
    double bottomBarSafeAreaHeight = mediaQueryData.padding.bottom;

    double appBarHeight = calculateAppBarHeight();

    remainingViewFullHeight = fullScreenSize -
        (statusBarHeight + bottomBarSafeAreaHeight + appBarHeight);

    return remainingViewFullHeight;
  }

  double calculateAppBarHeight() {
    double appBarHeight = 0;
    //User define height
    if (this.appBarHeight > 0) {
      appBarHeight = this.appBarHeight;
    }
    // No appBar height
    else if (this.appBarHeight < 0) {
      appBarHeight = 0;
    }
    //Default system appBar height
    else if (this.appBarHeight == 0) {
      appBarHeight = kToolbarHeight;
    }
    return appBarHeight;
  }
}

class AppBarView extends StatelessWidget {
  final double appBarHeight;
  final Widget? appBar;
  const AppBarView({Key? key, this.appBarHeight = 0, this.appBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double appBarHeight = this.appBarHeight;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      height: appBarHeight,
      child: PreferredSize(
          child: (appBar == null || appBarHeight == 0)
              ? Container(
                  height: appBarHeight,
                  color: Colors.blue,
                  child: Text(
                    "custom height appBarHeight>0, no app bar appBarHeight < 0, Default system appBar height  appBarHeight == 0",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                )
              : appBar!,
          preferredSize: Size(double.infinity, appBarHeight)),
    );
  }
}
