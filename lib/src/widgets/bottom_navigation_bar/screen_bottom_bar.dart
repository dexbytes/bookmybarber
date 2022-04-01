import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';

class ScreenBottomBar extends StatefulWidget {
  final Function(int)? menuClickedCallBack;
  final int notificationCount;
  final int selectedBottomMenu;
  final Widget? centerBigMenu;
  final Color? disableItemColor;
  final Color? enableItemColor;
  final List<BarItemsDetails>? navigationBarItems;
  final bool showLabels;
  final TextStyle? labelTextStyle;
  ScreenBottomBar(
      {Key? key,
      this.menuClickedCallBack,
      this.selectedBottomMenu = 0,
      this.notificationCount = 0,
      this.centerBigMenu,
      this.enableItemColor,
      this.disableItemColor,
      this.navigationBarItems,
      this.showLabels = false,
      this.labelTextStyle})
      : super(key: key);

  @override
  _BottomNavigationBarState createState() =>
      _BottomNavigationBarState(this.selectedBottomMenu);
}

class _BottomNavigationBarState extends State<ScreenBottomBar> {
  var screenHeight, screenWidth;
  var menuClickedCallBack;
  int selectedBottomMenu = 0;
  List<BarItemsDetails> navigationBarItems = [];
  bool isBackground = true;
  //BarItemsDetails _barItem;

  _BottomNavigationBarState(selectedBottomMenu) {
    if (selectedBottomMenu != null) {
      this.selectedBottomMenu = selectedBottomMenu;
    }
  }

  /*============add items for bottom bar===========*/
  addBottomBarItems() {
    if (widget.navigationBarItems != null &&
        widget.navigationBarItems!.length > 0) {
      if (widget.navigationBarItems!.length <= 5) {
        navigationBarItems = [];
        navigationBarItems.addAll(widget.navigationBarItems!);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  /*================on item tapped====================*/
  onItemTapped(int index) {
    setState(() {
      if (index != 4) {
        selectedBottomMenu = index;
      }
    });
    menuClickedCallBack(index);
  }

  @override
  Widget build(BuildContext context) {
    appDimens.appDimensFind(context: context);
    screenHeight = appDimens.heightFullScreen();
    screenWidth = appDimens.widthFullScreen();

    bool bottomViewPadding = appDimens.isSafeAreaRequired(context: context);

    menuClickedCallBack = widget.menuClickedCallBack;
    // selectedBottomMenu = widget.selectedBottomMenu;

    if (mounted) {
      selectedBottomMenu = widget.selectedBottomMenu;
    }

    if (navigationBarItems.length <= 0) {
      addBottomBarItems();
    }

    /*================on item tapped====================*/

    double _bottomBarHeightTemp = kBottomNavigationBarHeight;
    Color _selectedItemColor = appColors.bottomBarSelectedItemIconColor;
    Color _unSelectedItemColor = appColors.bottomBarDisabledItemColor;

    //double _bottomBarIconSize = screenHeight/10;
    double _bottomBarIconSize = _bottomBarHeightTemp / 2.65;
    double _bottomBarCenterIconSize = _bottomBarHeightTemp / 1.35;
    double _bottomBarHeight =
        _bottomBarHeightTemp; //Update app bar height according center button

    Widget menuIcon(
            String iconSelected, String icon, int itemIndex, int index) =>
        (iconSelected.contains(".svg")
            ? SvgPicture.asset(
                (itemIndex == selectedBottomMenu) ? iconSelected : icon,
                width: index == 3
                    ? (widget.centerBigMenu != null ? (0) : _bottomBarIconSize)
                    : _bottomBarIconSize,
                height: index == 3
                    ? (widget.centerBigMenu != null ? (0) : _bottomBarIconSize)
                    : _bottomBarIconSize,
                color: (itemIndex == selectedBottomMenu)
                    ? widget.enableItemColor
                    : (widget.disableItemColor != null
                        ? widget.disableItemColor
                        : appColors.bottomBarDisabledItemColor),
                fit: BoxFit.scaleDown)
            : Container(
                //  height: 69.5,
                margin: !bottomViewPadding
                    ? EdgeInsets.only(top: 0)
                    : EdgeInsets.only(top: index == 3 ? 0 : 15),
                child: Center(
                  child: Image(
                    image: AssetImage((itemIndex == selectedBottomMenu)
                        ? iconSelected
                        : icon),
                    width: index == 3
                        ? (widget.centerBigMenu != null
                            ? 0
                            : _bottomBarIconSize)
                        : _bottomBarIconSize,
                    height: index == 3
                        ? (widget.centerBigMenu != null
                            ? 0
                            : _bottomBarIconSize)
                        : _bottomBarIconSize,
                    color: (itemIndex == selectedBottomMenu)
                        ? widget.enableItemColor
                        : (widget.disableItemColor != null
                            ? widget.disableItemColor
                            : appColors.bottomBarDisabledItemColor),
                  ),
                ),
              ));

    /*===========common function for bar item ===================*/
    barItems(String icon, int itemIndex, String iconSelected, int index,
        String menuName) {
      return BottomNavigationBarItem(
        //backgroundColor: Colors.red,
        icon: Padding(
          padding: EdgeInsets.only(top: 0),
          child:
              /* (index == 4)
              ? NotificationBal(
                  iconData:
                      (itemIndex == selectedBottomMenu) ? iconSelected : icon,
                  rightIconSize:
                      appDimens.widthDynamic(value: _bottomBarIconSize),
                  iconDataColor: (itemIndex == selectedBottomMenu)
                      ? (widget.enableItemColor != null
                          ? widget.enableItemColor
                          : appColors.bottomBarSelectedItemIconColor)
                      : (widget.disableItemColor != null
                          ? widget.disableItemColor
                          : appColors.bottomBarDisabledItemColor),
                  countTextSize: 10,
                  notificationCount: widget.notificationCount,
                )
              :*/
              menuIcon(iconSelected, icon, itemIndex, index),
        ),
        /*Image(image: AssetImage((itemIndex==selectedBottomMenu)?iconSelected:icon),
          width: index==3? (widget.centerBigMenu!=null?_bottomBarCenterIconSize:_bottomBarIconSize):_bottomBarIconSize,
          height:index==3?(widget.centerBigMenu!=null?_bottomBarCenterIconSize:_bottomBarIconSize): _bottomBarIconSize,
          color: (itemIndex==selectedBottomMenu)?(widget.enableItemColor!=null?widget.enableItemColor:appColors.bottomBarSelectedItemIconColor):(widget.disableItemColor!=null?widget.disableItemColor:appColors.bottomBarDisabledItemColor),
        ),*/
        label: (widget.showLabels)
            ? (menuName != ''
                    ? menuName /*Text(
                    menuName,
                    style: widget.labelTextStyle != null
                        ? widget.labelTextStyle
                        : TextStyle(
                            fontSize: appDimens.widthFullScreen() / 29,
                            color: (itemIndex == selectedBottomMenu)
                                ? _selectedItemColor
                                : _unSelectedItemColor),
                  )*/
                    : "" /*Text(
                    "",
                    style: TextStyle(fontSize: 0),
                  )*/
                )
            /* title: (widget.showLabels != null && widget.showLabels)
            ? (menuName != null && menuName != ''
                ? Text(
                    menuName,
                    style: widget.labelTextStyle,
                  )
                : Text("",style: TextStyle(fontSize: 0),))*/
            : "" /*SizedBox.shrink()*/,
      );
    }

    /*=====================get bar items=================*/
    List<BottomNavigationBarItem>? getItems() {
      // ignore: unnecessary_null_comparison
      if (navigationBarItems != null) {
        List<BottomNavigationBarItem> items = [];
        for (int i = 0; i < navigationBarItems.length; i++) {
          items.add(barItems(
              navigationBarItems[i].icon,
              i,
              navigationBarItems[i].iconSelected,
              (i + 1),
              navigationBarItems[i].menuName));
        }
        return items;
      } else {
        print('no item');
        return null;
      }
    }

    /*=====================return navigation bar view========================*/

    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      // alignment: Alignment.bottomCenter,
      height: bottomViewPadding ? 90 : _bottomBarHeight,
      // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                // height: (_bottomBarHeight- 6),//(_bottomBarHeight - 10)
                child: Center(
                  child: BottomNavigationBar(
                    // backgroundColor: appColors.bottomBarBgColor,
                    backgroundColor: appColors.red,
                    // backgroundColor:Colors.green,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    /*backgroundColor:  _bottomBarBg,*/
                    //currentIndex: selectedBottomMenu,
                    selectedItemColor: _selectedItemColor,
                    unselectedItemColor: _unSelectedItemColor,
                    selectedLabelStyle: widget.labelTextStyle != null
                        ? widget.labelTextStyle
                        : TextStyle(
                            fontSize: appDimens.widthFullScreen() / 29,
                            color: _selectedItemColor),
                    unselectedLabelStyle: widget.labelTextStyle != null
                        ? widget.labelTextStyle
                        : TextStyle(
                            fontSize: appDimens.widthFullScreen() / 29,
                            color: _unSelectedItemColor),
                    items: getItems()!,
                    onTap: onItemTapped,
                    showSelectedLabels: (widget.showLabels) ? true : false,
                    showUnselectedLabels: (widget.showLabels) ? true : false,
                  ),
                ),
              ),
            ),
            Positioned(
                child: Align(
                    alignment: Alignment.center,
                    child: widget.centerBigMenu != null
                        ? Container(
                            margin: EdgeInsets.only(
                                bottom: !bottomViewPadding ? 0 : 15),
                            height: widget.centerBigMenu != null
                                ? _bottomBarCenterIconSize
                                : 0,
                            width: widget.centerBigMenu != null
                                ? _bottomBarCenterIconSize
                                : 0,
                            child: widget.centerBigMenu)
                        : Container()))
          ],
        ),
      ),
    );
  }
}

class BarItemsDetails {
  String icon;
  String iconSelected;
  String menuName;
  BarItemsDetails(
      {required this.icon, required this.iconSelected, required this.menuName});
}
