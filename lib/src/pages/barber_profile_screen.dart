import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/salon_detail_about_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_review_screen.dart';
import 'package:base_flutter_app/src/widgets/barber_profile_top_row.dart';
import 'package:base_flutter_app/src/widgets/custom_curve_maker_widget.dart';
import 'package:base_flutter_app/src/widgets/flexible_spacebar_widget.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BarberProfileScreen extends StatefulWidget {
  final onImageCallBack;
  final String profileImgUrl;
  final String userName;
  final String subtitle;


  const BarberProfileScreen({Key? key,
    this.onImageCallBack,
    this.profileImgUrl = "https://s3-media0.fl.yelpcdn.com/bphoto/JlcWA9GcKhJaggojJuV8sw/348s.jpg",
    this.userName = "Daniel William",
    this.subtitle = "Barberman at RedBox Barber",

  })
      : super(key: key);
  @override
  _BarberProfileScreenState createState() => _BarberProfileScreenState();
}


class _BarberProfileScreenState extends State<BarberProfileScreen>
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
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    Widget profileImageWithName =Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(top: appDimens.heightFullScreen()/6.2 /* MediaQuery.of(context).size.height /6.8*/),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 2,color:  Color(0xffCCA76A)),
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: CachedNetworkImage(
                imageUrl:widget.profileImgUrl,
                fit: BoxFit.cover,
              ),
            )
        ),
        Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.only(right: 2,bottom: 5),
          decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(width: 2.5,color: Colors.white)
          ),
        )
      ]),
         SizedBox(height: 10,),
         Text(widget.userName,
         style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700),
       ),
        SizedBox(height: 5,),
         Text(widget.subtitle,
        style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors().textHeadingColor1)),
        SizedBox(height: 5,),
        StarRatingBar(
       iconCount: 5,
       iconSize: 23,
       padding: EdgeInsets.all(2),
       removeItemRating: true,
       itemReviewCount: 125,
       itemViewCountTextStyle:TextStyle(color: AppColors().textNormalColor8,fontSize: 15,fontWeight: FontWeight.w400,),
       mainAxisAlignment: MainAxisAlignment.center,
     )
  ]));

    Widget tabBar = Column(
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
                Tab(text: "Basic Info",),
                Tab(text: "Portfolio",),
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
            length: 3,
            initialIndex: selectedTab,
            child: Container(
              height: MediaQuery.of(context).size.height /3.5,
              child: TabBarView(
                controller: tabController,
                children: [
                  // DescriptionPage(),
                  SalonDetailAboutScreen(isBarberInfoShow: true,isDataScroll: false,),
                  Center(child: Text("Tab2"),),
                  SalonDetailReviewScreen()

                ],
              ),
            ),
          ),
        ]);


    Widget topSection = Container(
        height: 85,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top:appDimens.heightFullScreen()/2.4 /*MediaQuery.of(context).size.height /2.6*/),
        color: Color(0xff323446),
        child: BarberProfileTopRowWidget(),
    );


    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerMenuPage(
            contextCurrentView: context,
            // scrollPadding: EdgeInsets.only(bottom: 110),
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: -1,
            appBar: Container(),
            containChild: Container(
              height: 1,
              child: Stack(
                children: [
                  Container(
                    child: CustomScrollView(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        slivers: <Widget>[
                          SliverAppBar(
                            elevation: 0,
                            leading: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor:Colors.white,iconSize: Size(21, 21)),
                            ),
                            leadingWidth: 65,
                            toolbarHeight: 60,
                            titleSpacing: 0,
                            title: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Profile",
                                      style:TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  splashRadius: 25,
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  onPressed: (){},
                                  icon:iconApps.iconImage(imageUrl: iconApps.detailAppbarIcon,
                                      imageColor: Color(0xffE4B343),
                                      iconSize: Size(25, 25)),
                                ),
                              ],
                            ),
                            backgroundColor:Color(0xff212327),  //Color(0xff323446),
                            pinned: true,
                            floating: false,
                            expandedHeight:appDimens.heightFullScreen()/2.1, // MediaQuery.of(context).size.height /2.1,  //2.47,
                            collapsedHeight:appDimens.heightFullScreen()/10,   //MediaQuery.of(context).size.height/8,
                            flexibleSpace: FlexibleSpaceBarWidget(
                              expandedTitleScale: 1,
                              background:Container(
                                color: Color(0xff323446),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bound) =>LinearGradient(
                                        colors: [Colors.black38.withOpacity(0.35),Colors.black87.withOpacity(0.35)],
                                        begin:Alignment.topLeft,
                                        end: Alignment.topRight,
                                      ).createShader(bound),
                                      blendMode: BlendMode.dstOut,
                                      child:ClipPath(
                                          clipper:CustomProfileAppBar(),
                                          child: CachedNetworkImage(
                                          imageUrl: "https://northernvirginiamag.com/wp-content/uploads/2018/01/man-having-hair-cut-at-barber-shop.jpg",
                                            fit:BoxFit.cover,
                                            width: MediaQuery.of(context).size.width,
                                            height:MediaQuery.of(context).size.height /4,
                                          )
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: profileImageWithName,
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: topSection,
                                    ),
                                  ],
                                ),
                              ),
                              // title:   Container(
                              //   padding: EdgeInsets.zero,
                              //   margin: EdgeInsets.zero,
                              //   color: Colors.transparent,
                              //   child: TabBar(
                              //     onTap: (index){
                              //       setState(() {
                              //         selectedTab = index;
                              //       });
                              //     },
                              //     controller: tabController,
                              //     tabs: [
                              //       Tab(text: "Basic Info",),
                              //       Tab(text: "Portfolio",),
                              //       Tab(text: "Review",),
                              //     ],
                              //     labelColor:Color(0xffE4B343),
                              //     isScrollable: false,
                              //     unselectedLabelColor: Color(0xff828588),
                              //     labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
                              //     unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),
                              //     labelPadding: EdgeInsets.only(right: 2,bottom: 0,),
                              //     indicatorPadding: EdgeInsets.symmetric(horizontal: 12,),
                              //     indicatorColor: Color(0xffE4B343),
                              //     padding: EdgeInsets.zero,
                              //   ),
                              // ),
                              // titlePadding: EdgeInsets.zero,
                            ),
                          ),
                          SliverFillRemaining(
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.only(bottom: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // topSection,
                                  // tabBar
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
                                        Tab(text: "Basic Info",),
                                        Tab(text: "Portfolio",),
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
                                  Expanded(
                                    child: DefaultTabController(
                                      length: 3,
                                      initialIndex: selectedTab,
                                      child: Container(
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero,
                                        child: TabBarView(
                                          controller: tabController,
                                          children: [
                                            // DescriptionPage(),
                                            SalonDetailAboutScreen(isBarberInfoShow: true,isDataScroll: false,),
                                            Center(child: Text("Tab2"),),
                                            SalonDetailReviewScreen(isScrollable: false,)

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          )
                          // SliverList(
                          //   delegate: SliverChildBuilderDelegate(
                          //         (context, index) {
                          //       return Container(
                          //         padding: EdgeInsets.zero,
                          //         margin: EdgeInsets.only(bottom: 0),
                          //         child: Column(
                          //           mainAxisSize: MainAxisSize.min,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             // topSection,
                          //             // tabBar
                          //             DefaultTabController(
                          //               length: 3,
                          //               initialIndex: selectedTab,
                          //               child: Container(
                          //                 padding: EdgeInsets.zero,
                          //                 margin: EdgeInsets.zero,
                          //                 height: MediaQuery.of(context).size.height /1.45,
                          //                 child: TabBarView(
                          //                   controller: tabController,
                          //                   children: [
                          //                     // DescriptionPage(),
                          //                     SalonDetailAboutScreen(isBarberInfoShow: true,),
                          //                     Center(child: Text("Tab2"),),
                          //                     SalonDetailReviewScreen()
                          //
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //     childCount: 1,
                          //   ),
                          // ),
                        ]
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
