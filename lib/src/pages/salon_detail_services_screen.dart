import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/pages/package_detail_sevices_screen.dart';
import 'package:base_flutter_app/src/widgets/package_card_widget.dart';
import 'package:base_flutter_app/src/widgets/services_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class SalonDetailSevicesScreen extends StatefulWidget {
  final bool isDataScroll;

  final collapsedheight;
  const  SalonDetailSevicesScreen({Key? key, this.isDataScroll = true, this.collapsedheight,})
      : super(key: key);
  @override

  _SalonDetailScreenState createState() => _SalonDetailScreenState();
}

class _SalonDetailScreenState extends State< SalonDetailSevicesScreen>
    with TickerProviderStateMixin {
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

    Widget tabBar = Column(
     /* shrinkWrap: true,
        physics: widget.isDataScroll?AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),
     */   children: [
          SizedBox(height:  widget.isDataScroll?widget.collapsedheight+35:0,),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 25,left: 15,right: 15),
            height: 40,
            decoration: BoxDecoration(
                color:Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,)
            ),
            child: TabBar(
              onTap: (index){
                setState(() {
                  selectedTab = index;
                });
              },
              controller: tabController,
              tabs: [
                Tab(text: "Services",),
                Tab(text: "Package & Offers",),
              ],
              labelColor: !isDarkMode? Colors.white:Color(0xff323446),
              isScrollable: false,
              unselectedLabelColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
              labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color:Colors.black),
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),
              indicator:BoxDecoration(
                  color: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
                  borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: selectedTab,
              child: Container(
                // height: 1050,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ServicesListView(isDataScroll: widget.isDataScroll,),
                    PackageCardWidget(
                      titleTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                          color: !isDarkMode?  Colors.black :Colors.white,
                          height: 0.5),
                      onCardClickCallBack: (){
                      Navigator.push(
                        context,
                        SlideRightRoute(
                            widget: PackageDetailServicesScreen()),
                      );
                    },),
                  ],
                ),
              ),
            ),
          ),
        ]);


    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: tabBar,
    );
  }
}
