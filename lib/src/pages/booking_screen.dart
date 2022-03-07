import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/booking_detail_screen.dart';
import 'package:base_flutter_app/src/widgets/booking_card_view.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String title;
  final bool isShowBackArrow;
  const BookingScreen({Key? key, this.title = "Salon", this.isShowBackArrow = false}) : super(key: key);
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



    // Widget tabBar = Column(
    //     children:[
    //       Container(
    //         color: AppColors().appBgColor3,
    //         child: Container(
    //           margin: EdgeInsets.only(top: 10,bottom: 25,left: 15,right: 15),
    //           height: 40,
    //           decoration: BoxDecoration(
    //               color:Colors.transparent,
    //               borderRadius: BorderRadius.circular(5),
    //               border: Border.all(width: 1,color:Color(0xffCCA76A))
    //           ),
    //           child: TabBar(
    //             onTap: (index){
    //               setState(() {
    //                 selectedTab = index;
    //               });
    //             },
    //             controller: tabController,
    //             tabs: [
    //               Tab(text: "UPCOMING",),
    //               Tab(text: "PAST",),
    //             ],
    //             labelColor: Color(0xff323446),
    //             isScrollable: false,
    //             unselectedLabelColor:Color(0xffCCA76A),
    //             labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color:Colors.black),
    //             labelPadding: EdgeInsets.zero,
    //             padding: EdgeInsets.zero,
    //             unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),
    //             indicator:BoxDecoration(
    //               color:Color(0xffCCA76A),
    //               borderRadius: BorderRadius.circular(3),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: DefaultTabController(
    //           length: 2,
    //           initialIndex: selectedTab,
    //           child: Container(
    //             // height: 1050,
    //             child: TabBarView(
    //               controller: tabController,
    //               children: [
    //                 bookingList,
    //                 bookingList,
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ]);

    Widget appbar = Container(
      padding: EdgeInsets.only(left: 15),
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
                    Navigator.pop(context);
                       },
                   icon: iconApps.iconImage(imageUrl: iconApps.backArrow2,iconSize: Size(26, 26)),),
                ),
              ),
              SizedBox(width:  widget.isShowBackArrow ? MediaQuery.of(context).size.width /5.3 :MediaQuery.of(context).size.width /3.35 ,),
              Text("My Bookings",style: TextStyle(fontSize: 22,
              color:AppColors().textHeadingColor1,fontWeight: FontWeight.w700),),
            ],
          ),
          SizedBox(height: 19,),
          Container(
            color: AppColors().appBgColor3,
            child: Container(
              margin: EdgeInsets.only(top: 5,bottom: 15,left: 15,right: 15),
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
                  Tab(text: "UPCOMING",),
                  Tab(text: "PAST",),
                ],
                labelColor: Color(0xff323446),
                isScrollable: false,
                unselectedLabelColor:Color(0xffCCA76A),
                labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color:Colors.black),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),
                indicator:BoxDecoration(
                  color:Color(0xffCCA76A),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),

        ],
      ),
    );



    return ContainerMenuPage(
      contextCurrentView: context,
      scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 170,
      appBar: Container(
        color: AppColors().appBgColor3,
        child: appbar
      ),
      containChild: Container(
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
      ),
    );

  }
}

