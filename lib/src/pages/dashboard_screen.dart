import 'package:base_flutter_app/src/all_file_import/app_screens_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
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
    //Appbar
    Widget _appBar = Container();

    Map<String, dynamic> setting = MainAppBloc.configTheme["setting"];
    List<dynamic> statusBarColors = setting.containsKey("statusBarColors")
        ? setting["statusBarColors"]
        : [];
    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: BlocBuilder<MainAppBloc, MainAppState>(
          // ignore: non_constant_identifier_names
          builder: (_, mainAppState) {
        int selectedMenuIndex = 0;
        if (mainAppState is HomeBottomNavigationBarTapedState) {
          selectedMenuIndex = mainAppState.tapedBottomBarIndex;
        }
        return ContainerDashboard(
            contextCurrentView: context,
            statusBarColor: statusBarColors.length > selectedMenuIndex
                ? projectUtil.colorFromIntString(
                    stringColor: statusBarColors[selectedMenuIndex])
                : Colors.amber,
            bottomBarSafeAreaColor: Colors.amber,
            appBarHeight: 0,
            bottomMenuHeight: 56,
            bottomMenuView: Container(
              color: Colors.transparent,
              child: Center(
                child: BottomNavigationBarMaterial(
                    /* showLabels: true,
                    disableItemColor: Colors.green,
                    enableItemColor: Colors.red,
                    navigationBarItems: [
                      BarItemsDetails(
                          icon: iconApps.addIcon,
                          iconSelected: iconApps.addIcon,
                          menuName: "Menu"),
                      BarItemsDetails(
                          icon: iconApps.addIcon,
                          iconSelected: iconApps.addIcon,
                          menuName: "Menu"),
                      BarItemsDetails(
                          icon: iconApps.addIcon,
                          iconSelected: iconApps.addIcon,
                          menuName: "Menu")
                    ],*/
                    onItemTapped: (int selectedMenuIndex, String menuPageId) {
                  mainAppBloc.add(HomeBottomNavigationBarTapedEvent(
                      tapedBottomBarIndex: selectedMenuIndex,
                      tapedBottomBarPageId: menuPageId));
                  print("Selected Menu index $selectedMenuIndex");
                }),
              ),
            ),
            appBar: Container(
              color: statusBarColors.length > selectedMenuIndex
                  ? projectUtil.colorFromIntString(
                      stringColor: statusBarColors[selectedMenuIndex])
                  : Colors.red,
            ),
            containChild: BlocBuilder<MainAppBloc, MainAppState>(
                // ignore: non_constant_identifier_names
                builder: (_, mainAppState) {
              String selectedMenuPageId = "";

              if (mainAppState is HomeBottomNavigationBarTapedState) {
                selectedMenuPageId = mainAppState.tapedBottomBarPageId;
                selectedMenuIndex = mainAppState.tapedBottomBarIndex;
              }
              Widget menuPage = Container();
              switch (selectedMenuPageId) {
                case "menu1":
                  {
                    menuPage = HomeMenuScreen();
                  }
                  break;
                case "menu2":
                  {
                    menuPage = Container(
                      child: Center(child: Text("Menu 2")),
                    );
                  }
                  break;
                case "menu3":
                  {
                    menuPage = Container(
                      child: Center(child: Text("Menu 3")),
                    );
                  }
                  break;
                case "menu4":
                  {
                    menuPage = Container(
                      child: Center(child: Text("Menu 4")),
                    );
                  }
                  break;
                case "menu5":
                  {
                    menuPage = Container(
                      child: Center(child: Text("Menu 5")),
                    );
                  }
                  break;
              }
              return menuPage;
            })

            /*ContainerMenuPage(
            scrollPadding: EdgeInsets.only(bottom: 90),
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: false,
            containChild: Stack(
              children: [
                Column(
                  children: [
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
                                  Container(
                                    height: 100,
                                    color: Colors.green,
                                  ),
                                ],
                              )),
                              // continueButton(),
                              Expanded(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 100,
                                  color: Colors.green,
                                ),
                              )),
                            ],
                          ),
                        )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.green,
                        child: Container(
                          height: 50,
                          color: Colors.green,
                        ),
                      ),
                    )),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 50,
                      color: Colors.green,
                    )
                  ],
                ),
              ],
            ),
            contextCurrentView: context,
          ),*/
            );
      }),
    );
  }
}
