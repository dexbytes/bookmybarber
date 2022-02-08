import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
/*This is same like another container but in this there is not status and bottom safe area include because
* because it always use with bottom menu there is not bottom menu include in this call but in this class we are not managing status bar and safe area color.
* */

class ContainerMenuPage extends StatelessWidget {
  final Widget containChild;
  final EdgeInsetsGeometry scrollPadding;
  final bool isFixedDeviceHeight; // if it true than
  final bool isSingleChildScrollViewNeed; // if it true than
  final Widget? appBar; // if it true than
  final double
      appBarHeight; // if it true than   custom height appBarHeight>0, no app bar appBarHeight < 0, Default system appBar height  appBarHeight == 0
  final bool scrollingOnKeyboardOpen; // if it true than
  final BuildContext contextCurrentView; // if it true than
  const ContainerMenuPage({
    Key? key,
    required this.contextCurrentView,
    required this.containChild,
    this.isFixedDeviceHeight = true,
    this.scrollingOnKeyboardOpen = true,
    this.appBar,
    this.scrollPadding: const EdgeInsets.all(0),
    this.appBarHeight = -1,
    this.isSingleChildScrollViewNeed = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isKeyBoardOpen = false;
    // Main view return according to Scroll need condition
    Widget returnSubMainView(
        {ScrollPhysics scrollPhysics = const ClampingScrollPhysics()}) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: scrollPhysics,
            padding: scrollPadding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.minHeight,
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
        return returnSubMainView();
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
        });
      } else if (!isSingleChildScrollViewNeed && isFixedDeviceHeight) {
        return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
          isKeyBoardOpen = isKeyboardVisible;
          print("Keyboard open status $isKeyBoardOpen");
          return returnSubMainView(
              scrollPhysics: scrollingOnKeyboardOpen
                  ? (isKeyBoardOpen
                      ? ClampingScrollPhysics()
                      : NeverScrollableScrollPhysics())
                  : NeverScrollableScrollPhysics());
        });
      } else {
        return returnSubMainView();
      }
    }

    return Scaffold(
      backgroundColor:Color(0xff212327),
      body: SafeArea(
        bottom: false,
        top: false,
        // maintainBottomViewPadding: true,
        child: Column(
          children: [
            AppBarViewContainerManPage(
                appBar: this.appBar, appBarHeight: calculateAppBarHeight()),
            Expanded(
              child: ScrollConfiguration(
                  behavior: MyBehavior(), child: returnMainView()),
            ),
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

class AppBarViewContainerManPage extends StatelessWidget {
  final double appBarHeight;
  final Widget? appBar;
  const AppBarViewContainerManPage(
      {Key? key, this.appBarHeight = 0, this.appBar})
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
