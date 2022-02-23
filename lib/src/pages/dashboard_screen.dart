import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bottom_navigation_bar/bottom_navigator_with_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/bloc/sign_in_bloc/sign_in_bloc.dart';

class DashBoardPage extends StatefulWidget {

  const DashBoardPage({Key? key}) : super(key: key);
  @override
  _DashBoardPage createState() => _DashBoardPage();
}


class _DashBoardPage extends State<DashBoardPage>
    with TickerProviderStateMixin {
  _DashBoardPage();

  Color statusBarColors = Color(0xff212327);
  // GlobalKey<ScaffoldState>? scaffoldKey;

  GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey();
  double bottomMenuHeight = 56;
  //Current index
  TabItemBottomNavigatorWithStack _currentTab =
      TabItemBottomNavigatorWithStack.menu1;

  //Get selected menu
  Widget buildOffstageNavigator(TabItemBottomNavigatorWithStack tabItem,{item}) {
    return Offstage(
        offstage: _currentTab != tabItem,
        child: AppNavigator(
          navigatorKey: _navigatorKeys[tabItem]!,
          tabItem: tabItem,item: item,));
  }

  //Add Menu navigation key according to added menu
  Map<TabItemBottomNavigatorWithStack, GlobalKey<NavigatorState>>
  _navigatorKeys = {
    TabItemBottomNavigatorWithStack.menu1: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu2: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu3: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu4: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu5: GlobalKey<NavigatorState>(),
  };

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
    appDimens.appDimensFind(context: context);
    SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);
    MainAppBloc mainAppBloc = BlocProvider.of<MainAppBloc>(context);

    MainAppBloc.dashboardContext = context;
    //Appbar
    Widget _appBar = Container();

    Map<String, dynamic> setting =
    MainAppBloc.configTheme.containsKey("setting")
        ? MainAppBloc.configTheme["setting"]
        : {};
    /*statusBarColors = setting.containsKey("statusBarColors")
        ? projectUtil.colorFromIntString(
        stringColor: setting["statusBarColors"])
        : Colors.grey;*/


    //Selected bottom menu index
    void _selectTab(TapedItemModel capedItemModel) {
      TabItemBottomNavigatorWithStack tabItem = capedItemModel.tabItemBottomNavigatorWithStack;
      try {
        statusBarColors = Color(int.parse(capedItemModel.statusBarColor!));
      } catch (e) {
        print(e);
      }
      /* mainAppBloc.add(HomeBottomNavigationBarTapedEvent(
          tapedBottomBarIndex: 0,
          tapedBottomBarPageId: tabItem.name,
          statusBarColor: capedItemModel.statusBarColor));*/

      if (tabItem == _currentTab) {
        // pop to first route
        _navigatorKeys[tabItem]!
            .currentState!
            .popUntil((route) => route.isFirst);
      } else {
        setState(() => _currentTab = tabItem);
      }

      //print("Selected Menu index ${tabItem.name}");
    }

    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: BlocBuilder<MainAppBloc, MainAppState>(
        // ignore: non_constant_identifier_names
          builder: (_, mainAppState) {
            int selectedMenuIndex = 0;
            Color statusBarColorsLocal = statusBarColors;

            if (mainAppState is HomeBottomNavigationBarTapedState) {
              selectedMenuIndex = mainAppState.tapedBottomBarIndex;
              statusBarColorsLocal = mainAppState.statusBarColor != null
                  ? projectUtil.colorFromIntString(
                  stringColor: mainAppState.statusBarColor!)
                  : statusBarColors;
            }


            return ContainerDashboard(
                // globalScaffoldKey: globalScaffoldKey ,
                // appBackgroundColor: Colors.red,
                contextCurrentView: context,
                isOverLayStatusBar: true,
                statusBarColor: statusBarColorsLocal,
                bottomBarSafeAreaColor:AppColors().appBgColor2,
                appBackgroundColor:AppColors().appBgColor3,
                appBarHeight: -1,
                bottomMenuHeight: 85,
                bottomMenuView: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      child: BottomNavigatorWithStack(
                        currentTab: _currentTab,
                        onSelectTab: _selectTab,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: FloatingActionButton(onPressed: (){},
                        backgroundColor: Color(0xffE4B343),
                        child: iconApps.iconImage(imageUrl: iconApps.bottomMenuChatIcon),
                      ),
                    )
                  ],
                ),
                appBar: Container(
                  color: statusBarColorsLocal,
                ),
                containChild: BlocBuilder<MainAppBloc, MainAppState>(
                  // ignore: non_constant_identifier_names
                    builder: (_, mainAppState) {
                      String selectedMenuPageId = "";
                      if (mainAppState is HomeBottomNavigationBarTapedState) {
                        selectedMenuPageId = mainAppState.tapedBottomBarPageId;
                        selectedMenuIndex = mainAppState.tapedBottomBarIndex;
                      }
                      return Stack(children: <Widget>[
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu1,item: (){
                          globalScaffoldKey.currentState?.openDrawer();
                        }),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu2),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu3),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu4),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu5),
                      ]);
                    }));

          }),
    );
  }
}