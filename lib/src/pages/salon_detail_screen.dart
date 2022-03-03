import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/salon_detail_about_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_gallery_view.dart';
import 'package:base_flutter_app/src/pages/salon_detail_review_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_services_screen.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/detail_screen_heading_widget.dart';
import 'package:base_flutter_app/src/widgets/detail_screen_star_row.dart';
import 'package:base_flutter_app/src/widgets/detail_screen_top_row.dart';
import 'package:base_flutter_app/src/widgets/flexible_spacebar_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'barber_profile_screen.dart';
import 'book_appointment_screen.dart';

class SalonDetailScreen extends StatefulWidget {
  final int selectedTab;
  const SalonDetailScreen({Key? key, this.selectedTab = 0,})
      : super(key: key);
  @override

  _SalonDetailScreenState createState() => _SalonDetailScreenState();
}

class _SalonDetailScreenState extends State<SalonDetailScreen>
    with TickerProviderStateMixin {
  int selectedTab;
  _SalonDetailScreenState({this.selectedTab = 0});
  TabController? tabController;
  // int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController =
    new TabController(initialIndex: selectedTab, length: 4, vsync: this);
    super.initState();
    tabController =
    new TabController(initialIndex: selectedTab, length: 4, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = MediaQuery.of(context).size.height /3.3;
    double collapsedHeight =  MediaQuery.of(context).size.height /4.8;


    Widget tabBar = Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Container(
            color: Color(0xff323446),
            child: TabBar(
              onTap: (index){
                setState(() {
                  selectedTab = index;
                });
              },
              controller: tabController,
              tabs: [
                Tab(text: "About",),
                Tab(text: "Services",),
                Tab(text: "Gallery",),
                Tab(text: "Review",),
              ],
              labelColor:Color(0xffE4B343),
              isScrollable: false,
              unselectedLabelColor: Color(0xff828588),
              labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
              unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),
              labelPadding: EdgeInsets.only(right: 2,bottom: 0,),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 12,),
              indicatorColor: Color(0xffE4B343),
            ),
          ),
          DefaultTabController(
            length: 4,
            initialIndex: selectedTab,
            child: Container(
              // height: MediaQuery.of(context).size.height + 333,
              child: Center(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // DescriptionPage(),
                    SalonDetailAboutScreen(),
                    SalonDetailSevicesScreen(),
                    SalonGalleryViewScreen(),
                    SalonDetailReviewScreen()
                  ],
                ),
              ),
            ),
          )
        ]);

    Widget topSection = Container(
        height: 226,
        color: Color(0xff323446),
        child: Column(
          children: [
            Container(
                margin:EdgeInsets.only(top: 10,bottom: 16) ,
                height: 55,
                child: DetailScreenTopRowWidget()),
            SeeAllTextRow(
              leftTitle: "Salon specialists",
              isRightTextVisible: false,
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color:Colors.white) ,
            ),
            Container(
                margin:EdgeInsets.only(top: 10) ,
                height: 111,
                child:BarberSpecialistCircularWidget(
                  height: 63,
                  width: 63,
                  isSubtitleVisible: true,
                  isSecondDataVisible: true,
                  isFeatureVisible: false,
                  titleTextStyle: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500, color:Colors.white),
                  onClickCardCallBack: (){
                    Navigator.push(
                      context,
                      SlideRightRoute(
                          widget: BarberProfileScreen()),
                    );
                  },
                )),
          ],
        )
    );



    Widget starRow = Container(
      margin: EdgeInsets.only(
          right: 14, left: 14,bottom: 10),
      height: 30,
      child: DetailScreenStarRow(),
    );

    Widget heading = Container(
        margin: EdgeInsets.only(bottom: 0,left: 0),
        height: 55,
        child:DetailHeadingWidget(mainAxisAlignment: MainAxisAlignment.end,)

    );

    Widget backgroundImage = ShaderMask(
      shaderCallback: (bound) =>LinearGradient(
        colors: [Colors.black38.withOpacity(0.2),Colors.black87],
        begin:Alignment.center,
        end: Alignment.bottomCenter,
      ).createShader(bound),
      blendMode: BlendMode.darken,
      child: Container(
        child: CachedNetworkImage(
          imageUrl: "https://us.123rf.com/450wm/gstockstudio/gstockstudio1601/gstockstudio160100134/51259655-making-haircut-look-perfect-young-bearded-man-getting-haircut-by-hairdresser-while-sitting-in-chair-.jpg?ver=6",
          fit:  BoxFit.cover,),
      ),
    );

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 25,right: 25,bottom: 0),
        child:selectedTab <= 0 ?CommonButton(
          buttonHeight: 52,
          buttonName: "Book now",
          buttonColor:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),
          backCallback:(){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: BookAppointmentScreen()),
            );
          },
          isBottomMarginRequired: false,
        ):Container(),
      );
    }



    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: ContainerFirst(
          contextCurrentView: context,
          // scrollPadding: EdgeInsets.only(bottom: 110),
          isSingleChildScrollViewNeed: true,
          bottomBarSafeAreaColor: AppColors().appBgColor2,
          appBackgroundColor:AppColors().appBgColor2,
          isOverLayAppBar: true,
          isOverLayStatusBar: true,
          isFixedDeviceHeight: true,
          appBarHeight: -1,
          appBar: Container(
            height: 0,
          ),
          containChild: Container(
            height: 1,
            child: Stack(
              children: [
                CustomScrollView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverAppBar(
                        elevation: 0,
                        toolbarHeight: 60,
                        leading: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,
                              iconSize: Size(30, 30),
                              imageColor: Colors.white),
                          iconSize: 50,
                        ),
                        titleSpacing: 0,
                        title:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              splashRadius: 25,
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              onPressed: (){},
                              icon:iconApps.iconImage(imageUrl: iconApps.detailAppbarIcon,iconSize: Size(25, 25)),
                            ) ,
                          ],
                        ),
                        backgroundColor: Color(0xff212327),
                        pinned: true,
                        floating: true,
                        expandedHeight:expandedHeight,
                        collapsedHeight:collapsedHeight,
                        flexibleSpace: FlexibleSpaceBarWidget(
                            expandedTitleScale: 1,
                            background:Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                    child:backgroundImage
                                ),
                                // starRow,
                                // heading
                              ],
                            ),
                            title:Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heading,
                                starRow,
                              ],
                            ) ,
                            titlePadding: EdgeInsets.only(bottom: 2),


                          // child: Image( image:AssetImage('assets/images/home_screen_image.png',),fit: BoxFit.cover,)),
                        ),
                      ),
                      SliverFillRemaining(
                        child: Column(
                          children:[
                            topSection,
                            Container(
                              color: Color(0xff323446),
                              child: TabBar(
                                onTap: (index){
                                  setState(() {
                                    selectedTab = index;
                                  });
                                },
                                controller: tabController,
                                tabs: [
                                  Tab(text: "About",),
                                  Tab(text: "Services",),
                                  Tab(text: "Gallery",),
                                  Tab(text: "Review",),
                                ],
                                labelColor:Color(0xffE4B343),
                                isScrollable: false,
                                unselectedLabelColor: Color(0xff828588),
                                labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
                                unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),
                                labelPadding: EdgeInsets.only(right: 2,bottom: 0,top: 2),
                                indicatorPadding: EdgeInsets.symmetric(horizontal: 12,),
                                indicatorColor: Color(0xffE4B343),
                              ),
                            ),
                            DefaultTabController(
                              length: 4,
                              initialIndex: selectedTab,
                              child: Container(
                                // height: MediaQuery.of(context).size.height + 333,
                                child: Expanded(
                                  child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      // DescriptionPage(),
                                      SalonDetailAboutScreen(),
                                      SalonDetailSevicesScreen(),
                                      SalonGalleryViewScreen(),
                                      SalonDetailReviewScreen()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                      // SliverList(
                      //   delegate: SliverChildBuilderDelegate(
                      //         (context, index) {
                      //       return Container(
                      //         margin: EdgeInsets.only(bottom: 25),
                      //         color: Color(0xff212327),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //           topSection,
                      //           tabBar
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //     childCount: 1,
                      //   ),
                      // ),
                    ]
                ),
                Align(alignment: Alignment.bottomCenter,
                  child: bottomButton(),
                )
              ],
            ),
          )
      ),


    );
  }
}



