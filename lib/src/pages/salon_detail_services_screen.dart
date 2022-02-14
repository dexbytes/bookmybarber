import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/package_card_widget.dart';
import 'package:base_flutter_app/src/widgets/services_list_view.dart';
import 'package:flutter/material.dart';


class SalonDetailSevicesScreen extends StatefulWidget {
  const  SalonDetailSevicesScreen({Key? key,})
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
    new TabController(initialIndex: selectedTab, length: 3, vsync: this);
    super.initState();
    tabController =
    new TabController(initialIndex: selectedTab, length: 3, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget tabBar = Column(
        children:[
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 25,left: 15,right: 15),
            height: 40,
            decoration: BoxDecoration(
                color:Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color:Color(0xffCCA76A))
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
                Tab(text: "Price Table",),
              ],
              labelColor: Color(0xff323446),
              isScrollable: false,
              unselectedLabelColor:Color(0xffCCA76A),
              labelStyle: TextStyle(fontSize: 13.5,fontWeight: FontWeight.w600,color:Colors.black),
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              unselectedLabelStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,),
              indicator:BoxDecoration(
                  color:Color(0xffCCA76A),
                  borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          DefaultTabController(
            length: 3,
            initialIndex: selectedTab,
            child: Container(
              height:750,
              child: TabBarView(
                controller: tabController,
                children: [
                  ServicesListView(),
                  PackageCardWidget(),
                  Center(child: Text("Tab2")),

                ],
              ),
            ),
          ),
        ]);


    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: ContainerMenuPage(
          contextCurrentView: context,
          // scrollPadding: EdgeInsets.only(bottom: 110),
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          appBarHeight: -1,
          appBar: Container(
            height: 0,
          ),
          containChild: Container(
            height: 1,
            child: Stack(
              children: [
                tabBar
              ],
            ),
          )
      ),


    );
  }
}
