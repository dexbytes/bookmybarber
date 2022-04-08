import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/booking_detail_screen.dart';
import 'package:base_flutter_app/src/widgets/booking_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'dashboard_screen.dart';

class BookingScreen extends StatefulWidget {
  final String title;
  final bool isShowBackArrow;
  final bool isBackArrowNavigation;
  const BookingScreen({Key? key, this.title = "Salon", this.isShowBackArrow = false, this.isBackArrowNavigation = false}) : super(key: key);
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>with TickerProviderStateMixin {

  TabController? tabController;
  int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController =
    new TabController(initialIndex: selectedTab, length: 2, vsync: this);
    super.initState();
    tabController =
    new TabController(initialIndex: selectedTab, length: 2, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget bookingList =Container(
        height: MediaQuery.of(context).size.height,
        child: BookingCardView(
          onClickCardCallBack: (){
            Navigator.push(
              MainAppBloc.getDashboardContext,
              SlideRightRoute(
                  widget: BookingDetailScreen()),
            );
          },
        )
    );

    Widget appbar = Container(
      padding: EdgeInsets.only(left: 15,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: widget.isShowBackArrow,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: (){
                     widget.isBackArrowNavigation ?
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        return DashBoardPage();
                      }), (route) => false):Navigator.pop(context);
                       },
                   icon: iconApps.iconImage(imageUrl: iconApps.backArrow2,
                       imageColor:!isDarkMode?AppColors().black:AppColors().buttonColor,
                       iconSize: Size(21, 21)),),
                ),
              ),
              SizedBox(width:  widget.isShowBackArrow ? MediaQuery.of(context).size.width /5.3 :MediaQuery.of(context).size.width /3.35 ,),
              Text(appString.trans(context, appString.myBooking),style: TextStyle(fontSize: 22,
              color:!isDarkMode? AppColors().black :AppColors().textHeadingColor1,fontWeight: FontWeight.w700),),
            ],
          ),
          SizedBox(height: 13,),
          Container(
            color:!isDarkMode? appColors.white :appColors.appBgColor3,
            child: Container(
              margin: EdgeInsets.only(top: 5,bottom: 15,left: 15,right: 15),
              height: 40,
              decoration: BoxDecoration(
                  color:Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1,color:!isDarkMode? AppColors().textHeadingColor2 :AppColors().textHeadingColor1,)
              ),
              child: TabBar(
                onTap: (index){
                  setState(() {
                    selectedTab = index;
                  });
                },
                controller: tabController,
                tabs: [
                  Tab(text: appString.trans(context, appString.upComing)),
                  Tab(text: appString.trans(context, appString.past)),
                ],
                labelColor:!isDarkMode? AppColors().white:Color(0xff323446),
                isScrollable: false,
                unselectedLabelColor:!isDarkMode? AppColors().textHeadingColor2 :AppColors().textHeadingColor1,
                labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color:Colors.black),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),
                indicator:BoxDecoration(
                  color:!isDarkMode? AppColors().textHeadingColor2 :AppColors().textHeadingColor1,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

        ],
      ),
    );

    Widget buildBody = Container(
      height: 1,
      child: DefaultTabController(
        length: 2,
        initialIndex: selectedTab,
        child: Container(
          // height: 1050,
          child: TabBarView(
            controller: tabController,
            children: [
              bookingList,
              bookingList,
            ],
          ),
        ),
      ),
    );


    return widget.isShowBackArrow?ContainerFirst(
      contextCurrentView: context,
        appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
        /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 128,
      appBar: Container(
        color:!isDarkMode? appColors.white :appColors.appBgColor3,
        child: appbar
      ),
      containChild: buildBody
    ):
    ContainerMenuPage(
      contextCurrentView: context,
      scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 150,
      appBar: Container(
        color: !isDarkMode? appColors.white :appColors.appBgColor3,
        child: appbar
      ),
      containChild: buildBody
    );

  }
}

