import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/package_detail_sevices_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_about_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_gallery_view.dart';
import 'package:base_flutter_app/src/pages/salon_detail_review_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_services_screen.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:base_flutter_app/src/pages/user_package_offer_screen.dart';
import 'package:base_flutter_app/src/widgets/Review_screen_view.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/detail_address_view.dart';
import 'package:base_flutter_app/src/widgets/detail_hour_text.dart';
import 'package:base_flutter_app/src/widgets/detail_photo_row_widget.dart';
import 'package:base_flutter_app/src/widgets/detail_screen_heading_widget.dart';
import 'package:base_flutter_app/src/widgets/detail_screen_star_row.dart';
import 'package:base_flutter_app/src/widgets/detail_screen_top_row.dart';
import 'package:base_flutter_app/src/widgets/flexible_spacebar_widget.dart';
import 'package:base_flutter_app/src/widgets/package_card_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:readmore/readmore.dart';

import 'barber_profile_screen.dart';
import 'book_appointment_screen.dart';
import 'categories_screen.dart';
import 'map_intregation.dart';

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
  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double playPauseButtonSize;
  late double infoBoxHeight;
  late ScrollController _scrollController;
  bool isAppBarCollapsed = false;
  late double collapsedHeight;

  // int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController =
    new TabController(initialIndex: selectedTab, length: 4, vsync: this);
    super.initState();
    tabController =
    new TabController(initialIndex: selectedTab, length: 4, vsync: this);

    _scrollController = ScrollController()
      ..addListener(
            (){
              print(_scrollController.position.pixels);

              isAppBarCollapsed =  _scrollController.position.pixels >= collapsedHeight;
              setState(() {

              });
            }
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    double hedingHeight = 55;
    double starHeight = 30;
    double toolBarHeight = 60;
    double expandedHeight = MediaQuery.of(context).size.height /3.9;
    collapsedHeight =  toolBarHeight + hedingHeight+starHeight + 5;

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
                    SalonGalleryViewScreen(title: "Gallrey",),
                    SalonDetailReviewScreen()
                  ],
                ),
              ),
            ),
          )
        ]);

    Widget topSection = Container(
        // height: 226,
        color: !isDarkMode? Colors.white:appColors.appBgColor3,
        child: Column(
          children: [
            Container(
                margin:EdgeInsets.only(top: 10,bottom: 16) ,
                height: 55,
                child: DetailScreenTopRowWidget()),
            SeeAllTextRow(
              leftTitle: "Salon specialists",
              isRightTextVisible: false,
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: !isDarkMode?Color(0xff323446):Colors.white,) ,
            ),
            Container(
                margin:EdgeInsets.only(top: 10,bottom: 15) ,
                height: 111,
                child:BarberSpecialistCircularWidget(
                  height: 63,
                  width: 63,
                  isSubtitleVisible: true,
                  isSecondDataVisible: true,
                  isFeatureVisible: false,
                  titleTextStyle: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500,color: !isDarkMode? Color(0xff323446):Colors.white),
                  subtitleTextStyle: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400, color:  !isDarkMode? appColors.buttonColor2:Color(0xffCBAD90)),
                )),
          ],
        )
    );

    Widget starRow = Container(
      margin: EdgeInsets.only(
          right: 14, left: 14,bottom: 10),
      height: starHeight,
      child: DetailScreenStarRow(
        reviewTextStyle: isAppBarCollapsed ?
        TextStyle(color: !isDarkMode? Colors.black:Colors.white,fontSize: 14,fontWeight: FontWeight.w400,)
        :TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,),
        unratedStarColor: isAppBarCollapsed ?Colors.grey:Colors.white,
      ),
    );

    Widget heading = Container(
        margin: EdgeInsets.only(bottom: 0,left: 0),
        height: hedingHeight,
        child:DetailHeadingWidget(
          titleTextStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,
              color: isAppBarCollapsed ?
              !isDarkMode? Colors.black:Colors.white
                  :!isDarkMode? Colors.white:Colors.white),
          subtitleTextStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,
              color:isAppBarCollapsed ?
              !isDarkMode? Colors.black:Colors.white
                  :!isDarkMode? Colors.white:Colors.white),
          mainAxisAlignment: MainAxisAlignment.end,)

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
          buttonColor: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327),),
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


    Widget readMoreText = Container(
        padding: EdgeInsets.only(left: 20,right: 15,bottom: 20),
        // height: 110,
        child: ReadMoreText(
          'RedBox Barber salon is one of the most powerful brands in the hair & beauty care sector in Northern India,'
              ' that has given hairstyling a new horizon. Our barbers are professionally trained, one of them holds international certifications',
          // 'international certifications. They’re always updated with the latest trend in men’s grooming by'
          // ' participating in professional training and workshops conducted by International barbers ',
          style:TextStyle(fontSize: 15,
              fontWeight: FontWeight.w500,
              color:Color(0xff828588),
              wordSpacing: 1

          ),
          trimLines: 4,
          colorClickableText:  Color(0xffCCA76A),
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText:  'Less',

        ));

    Widget openHours = Container(
        padding: EdgeInsets.only(left: 20,right: 15),
        height: 70,
        child:Column(
          children: [
            DetailHourView(),
            DetailHourView(
              days: "Saturday - Sunday",
              time: "9:00 AM - 1:00PM",
              padding:EdgeInsets.only(right: 20),

            ),

          ],
        )
    );



    Widget address = Container(
        margin: EdgeInsets.only(left: 10,right: 15),
        height: 100,
        child: DetailAddressView(
          onMapCallBack: (){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: MapIntregationScreen()),
            );
          },
        ));


    Widget image = Container(
        margin: EdgeInsets.only(left: 14),
        height: 80,
        child: DetailPhotoView());

    Widget review = Container(
        padding: EdgeInsets.only(left: 10,),
        // height: MediaQuery.of(context).size.height +250,
        child: ReviewListView(
          itemCount: 1,
        )


    );

    Widget categories = Container(
        height: 130,
        child: CategoriesCircularWidget(
          onClickCardCallBack: (){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: SalonListViewAllScreen(title: "Salons",)),
            );
          },
        ));


    Widget packageOffers = Container(
        child: PackageCardWidget(
         padding :EdgeInsets.only(right: 10,left: 10,),
          itemCount: 1,
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

    );





    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: ContainerFirst(
          contextCurrentView: context,
          // scrollPadding: EdgeInsets.only(bottom: 110),
          isSingleChildScrollViewNeed: true,
          // bottomBarSafeAreaColor: AppColors().appBgColor2,
          appBackgroundColor:!isDarkMode? Colors.white:AppColors().appBgColor2,
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
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      toolbarHeight: toolBarHeight,
                      leading: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,
                            iconSize: Size(22, 22),
                            imageColor:isAppBarCollapsed ?
                            !isDarkMode? Colors.black:Colors.white
                           :!isDarkMode? Colors.white:Colors.white
                        ),
                        iconSize: 50,
                      ),
                      titleSpacing: 0,
                      title:
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.max,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           isAppBarCollapsed?Text("RedBox Barber Salon",
                      //             maxLines: 1,
                      //             style:TextStyle(
                      //                 color:isAppBarCollapsed ?
                      //                 !isDarkMode? Colors.black:Colors.white
                      //                     :!isDarkMode? Colors.white:Colors.white,
                      //                 fontSize: 21,fontWeight: FontWeight.w700),
                      //           ): Container()
                      //         ],
                      //       ),
                      //     ),
                      //     IconButton(
                      //       splashRadius: 25,
                      //       padding: EdgeInsets.zero,
                      //       alignment: Alignment.center,
                      //       onPressed: (){},
                      //       icon:iconApps.iconImage(imageUrl: iconApps.detailAppbarIcon,
                      //           imageColor: isAppBarCollapsed ?
                      //           !isDarkMode? Colors.black:Colors.white
                      //               :!isDarkMode? Colors.white:Colors.white,
                      //           iconSize: Size(25, 25)),
                      //     ) ,
                      //   ],
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            splashRadius: 25,
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            onPressed: (){},
                            icon:iconApps.iconImage(imageUrl: iconApps.detailAppbarIcon,
                                imageColor: isAppBarCollapsed ?
                                !isDarkMode? Colors.black:Colors.white
                                    :!isDarkMode? Colors.white:Colors.white,
                                iconSize: Size(25, 25)),
                          ) ,
                        ],
                      ),
                      backgroundColor: !isDarkMode?Colors.white:Color(0xff212327),
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
                           // !isAppBarCollapsed?Container():Container(
                           //    color:!isDarkMode?Colors.white:Color(0xff323446),
                           //    child: TabBar(
                           //      onTap: (index){
                           //        setState(() {
                           //          selectedTab = index;
                           //        });
                           //      },
                           //      controller: tabController,
                           //      tabs: [
                           //        Tab(text: "About",),
                           //        Tab(text: "Services",),
                           //        Tab(text: "Gallery",),
                           //        Tab(text: "Review",),
                           //      ],
                           //      labelColor:Color(0xffE4B343),
                           //      isScrollable: false,
                           //      unselectedLabelColor: Color(0xff828588),
                           //      labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
                           //      unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),
                           //      labelPadding: EdgeInsets.only(right: 2,bottom: 0,top: 2),
                           //      indicatorPadding: EdgeInsets.symmetric(horizontal: 12,),
                           //      indicatorColor: Color(0xffE4B343),
                           //    ),
                           //  ),
                          ],
                        ) ,
                        titlePadding: EdgeInsets.only(bottom: 2),
                        // child: Image( image:AssetImage('assets/images/home_screen_image.png',),fit: BoxFit.cover,)),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 0),
                            child: Column(
                              // padding: EdgeInsets.only(top: 0,bottom: 0),
                              // physics: NeverScrollableScrollPhysics(),
                              children: [
                                topSection,
                                // BarberCompanyInfoRow(
                                //   rightTitleTextStyle:  TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color:!isDarkMode? Colors.black:Colors.white),
                                //   leftTitleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: !isDarkMode? Colors.black:Colors.white),),

                                Column(
                                  children: [
                                    SeeAllTextRow(
                                      margin: EdgeInsets.only(left: 20,top: 20,bottom: 10),
                                      leftTitle: "About",
                                      isRightTextVisible: false,
                                      leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:Colors.white) ,
                                    ),
                                    readMoreText,
                                  ],
                                ),

                                SeeAllTextRow(
                                  margin: EdgeInsets.only(left: 20,bottom: 10),
                                  leftTitle: "Opening Hour",
                                  isRightTextVisible: false,
                                  leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:Colors.white),
                                ),
                                openHours,
                                address,

                                Padding(
                                  padding: EdgeInsets.only(top: 20.0,left: 13,right: 13),
                                  child: Divider(height: 1,thickness: 0.3,color: Colors.grey,),
                                ),
                                SeeAllTextRow(
                                    margin: EdgeInsets.only(left: 20,bottom: 15,top: 25,right: 20),
                                    leftTitle: "Services",
                                    leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
                                  rightTextCallBack: (){
                                    Navigator.push(
                                     context,
                                      SlideRightRoute(
                                          widget: CategoriesViewAllScreen(
                                            title: "Services",
                                          )),
                                    );
                                  },
                                ),
                                categories,
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0,left: 13,right: 13),
                                  child: Divider(height: 1,thickness: 0.3,color: Colors.grey,),
                                ),
                                SeeAllTextRow(
                                  margin: EdgeInsets.only(left: 20,bottom: 15,top: 25,right: 20),
                                  leftTitle: "Package&Offers",
                                  leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
                                  rightTextCallBack: (){
                                    Navigator.push(
                                      context,
                                      SlideRightRoute(
                                          widget:PackageOfferScreen()),
                                    );
                                  },
                                ),
                                packageOffers,
                                Padding(
                                  padding: EdgeInsets.only(left: 13,right: 13),
                                  child: Divider(height: 1,thickness: 0.3,color: Colors.grey,),
                                ),

                                SeeAllTextRow(
                                    margin: EdgeInsets.only(left: 20,bottom: 15,top: 25,right: 20),
                                    leftTitle: "Gallery",
                                    leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
                                    rightTextCallBack:() {
                                      Navigator.push(
                                        context,
                                        SlideRightRoute(
                                            widget: SalonGalleryViewScreen(title:"Gallery",)),
                                      );
                                    }
                                ),
                                image,
                                SizedBox(height:  0,),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0,left: 13,right: 13),
                                  child: Divider(height: 1,thickness: 0.3,color: Colors.grey,),
                                ),
                                SeeAllTextRow(
                                    margin: EdgeInsets.only(left: 20,bottom: 15,top: 25,right: 20),
                                    leftTitle: "Reviews",
                                    leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
                                    rightTextCallBack:() {
                                      Navigator.push(
                                        context,
                                        SlideRightRoute(
                                            widget: SalonDetailReviewScreen()),
                                      );
                                    }
                                ),
                                review,
                                SizedBox(height: 80,)
                              ],
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    ),

                    // SliverFillRemaining(
                    //   fillOverscroll: true,
                    //   child:Column(
                    //     children: [
                    //       isAppBarCollapsed?Container():topSection,
                    //       isAppBarCollapsed?Container():Container(
                    //         color: !isDarkMode?Colors.white:AppColors().appBgColor3,
                    //         child: TabBar(
                    //           onTap: (index){
                    //             setState(() {
                    //               selectedTab = index;
                    //               isAppBarCollapsed = isAppBarCollapsed;
                    //             });
                    //           },
                    //           controller: tabController,
                    //           tabs: [
                    //             Tab(text: "About",),
                    //             Tab(text: "Services",),
                    //             Tab(text: "Gallery",),
                    //             Tab(text: "Review",),
                    //           ],
                    //           labelColor: !isDarkMode?Colors.black :Color(0xffE4B343),
                    //           isScrollable: false,
                    //           unselectedLabelColor: Color(0xff828588),
                    //           labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
                    //           unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),
                    //           labelPadding: EdgeInsets.only(right: 2,bottom: 0,top: 2),
                    //           indicatorPadding: EdgeInsets.symmetric(horizontal: 12,),
                    //           indicatorColor:!isDarkMode? appColors.buttonColor2:Color(0xffE4B343),
                    //         ),
                    //       ),
                    //       DefaultTabController(
                    //         length: 4,
                    //         initialIndex: selectedTab,
                    //         child: Container(
                    //           // height: MediaQuery.of(context).size.height + 333,
                    //           child: Expanded(
                    //             child: TabBarView(
                    //               physics: NeverScrollableScrollPhysics(),
                    //               controller: tabController,
                    //               children: [
                    //                 SalonDetailAboutScreen(
                    //                     isDataScroll: isAppBarCollapsed,
                    //                     collapsedheight:collapsedHeight,
                    //                   onPhotoClickCallBack: (){
                    //                     setState(() {
                    //                       selectedTab = 2;
                    //                       tabController!.index = 2;
                    //                       isAppBarCollapsed = isAppBarCollapsed;
                    //                     });
                    //                   },
                    //                 ),
                    //                 SalonDetailSevicesScreen(isDataScroll: isAppBarCollapsed,collapsedheight:collapsedHeight),
                    //                 SalonGalleryViewScreen(isDataScroll: isAppBarCollapsed,collapsedheight:collapsedHeight),
                    //                 SalonDetailReviewScreen(isDataScroll: isAppBarCollapsed,collapsedheight:collapsedHeight),
                    //
                    //                 // SalonDetailSevicesScreen(),
                    //                 // SalonGalleryViewScreen(),
                    //                 // SalonDetailReviewScreen()
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   )
                    // )
                  ],
                ),
                Align(alignment: Alignment.bottomCenter,
                  child: bottomButton(),
                )
              ],
            ),
          )
          )

    );
  }
}



