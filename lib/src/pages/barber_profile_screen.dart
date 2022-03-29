import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/salon_detail_gallery_view.dart';
import 'package:base_flutter_app/src/pages/salon_detail_review_screen.dart';
import 'package:base_flutter_app/src/widgets/Review_screen_view.dart';
import 'package:base_flutter_app/src/widgets/barber_profile_company_info_row.dart';
import 'package:base_flutter_app/src/widgets/barber_profile_top_row.dart';
import 'package:base_flutter_app/src/widgets/custom_curve_maker_widget.dart';
import 'package:base_flutter_app/src/widgets/detail_address_view.dart';
import 'package:base_flutter_app/src/widgets/detail_hour_text.dart';
import 'package:base_flutter_app/src/widgets/detail_photo_row_widget.dart';
import 'package:base_flutter_app/src/widgets/flexible_spacebar_widget.dart';
import 'package:base_flutter_app/src/widgets/full_photo_view_screen.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'map_intregation.dart';

// class BarberProfileScreen extends StatefulWidget {
//   final onImageCallBack;
//   final String profileImgUrl;
//   final String userName;
//   final String subtitle;
//   final String salonName;
//
//
//   const BarberProfileScreen({Key? key,
//     this.onImageCallBack,
//     this.profileImgUrl = "https://s3-media0.fl.yelpcdn.com/bphoto/JlcWA9GcKhJaggojJuV8sw/348s.jpg",
//     this.userName = "Daniel William",
//     this.subtitle = "Barberman",
//     this.salonName ="RedBox Barber",
//
//   })
//       : super(key: key);
//   @override
//   _BarberProfileScreenState createState() => _BarberProfileScreenState();
// }
//
//
// class _BarberProfileScreenState extends State<BarberProfileScreen>
//     with TickerProviderStateMixin {
//   TabController? tabController;
//   late double maxAppBarHeight;
//   late double minAppBarHeight;
//   late double playPauseButtonSize;
//   late double infoBoxHeight;
//   late ScrollController _scrollController;
//   bool isAppBarCollapsed = false;
//   late double collapsedHeight;
//
//   int selectedTab = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     tabController =
//     new TabController(initialIndex: selectedTab, length: 3, vsync: this);
//     super.initState();
//     tabController =
//     new TabController(initialIndex: selectedTab, length: 3, vsync: this);
//
//
//     _scrollController = ScrollController()
//       ..addListener(
//               (){
//             print(_scrollController.position.pixels);
//
//             isAppBarCollapsed =  _scrollController.position.pixels >= collapsedHeight;
//             setState(() {
//
//             });
//           }
//       );
//
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     tabController?.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var brightness = SchedulerBinding.instance!.window.platformBrightness;
//     bool isDarkMode = brightness == Brightness.dark;
//
//     double toolBarHeight = 60;
//     double expandedHeight = MediaQuery.of(context).size.height /1.9;
//     collapsedHeight =  toolBarHeight + 50;
//
//
//     AppDimens appDimens = AppDimens();
//     appDimens.appDimensFind(context: context);
//
//     Widget topSection = Container(
//       height: 105,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.only(top:12),
//       color:!isDarkMode? appColors.white:appColors.appBgColor3,
//       child: BarberProfileTopRowWidget(),
//     );
//
//     Widget profileImageWithName = Container(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     GestureDetector(
//                       onTap:() {
//                         Navigator.push(
//                           context,
//                           SlideRightRoute(
//                               widget: FullPhotoView(profileImgUrl: widget.profileImgUrl,)),
//                         );
//                       },
//                       child: Container(
//                           padding: EdgeInsets.zero,
//                           margin: EdgeInsets.only(top: appDimens.heightFullScreen()/6.2 /* MediaQuery.of(context).size.height /6.8*/),
//                           height: 100,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 2,color:!isDarkMode? appColors.buttonColor2:Color(0xffE4B343),
//                             ),
//                             shape: BoxShape.circle,
//                             color:Colors.transparent,
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(60),
//                             child: CachedNetworkImage(
//                               imageUrl:widget.profileImgUrl,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                       ),
//                     ),
//                     Container(
//                       height: 25,
//                       width: 25,
//                       margin: EdgeInsets.only(right: 2,bottom: 5),
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           shape: BoxShape.circle,
//                           border: Border.all(width: 2.5,color: Colors.white)
//                       ),
//                     )
//                   ]),
//               SizedBox(height: 10,),
//               Text(widget.userName,
//                 style: TextStyle(fontSize: 22,color:!isDarkMode?Colors.black : Colors.white,fontWeight: FontWeight.w700),
//               ),
//               SizedBox(height: 5,),
//               Text("${widget.subtitle} at ${widget.salonName}",
//                   style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?appColors.textHeadingColor2:AppColors().textHeadingColor1)),
//               SizedBox(height: 5,),
//               StarRatingBar(
//                 iconCount: 5,
//                 iconSize: 23,
//                 color: !isDarkMode?appColors.buttonColor2 :appColors.buttonColor2,
//                 unratedColor:!isDarkMode?Colors.grey :Colors.white,
//                 padding: EdgeInsets.all(2),
//                 removeItemRating: true,
//                 itemReviewCount: 125,
//                 itemViewCountTextStyle:TextStyle(color: AppColors().textNormalColor8,fontSize: 15,fontWeight: FontWeight.w400,),
//                 mainAxisAlignment: MainAxisAlignment.center,
//               ),
//               topSection,
//             ]));
//
//
//
//     //Return main Ui view
//     return WillPopScope(
//         onWillPop: null, //_onBackPressed,
//         child: ContainerFirst(
//             isOverLayStatusBar:true,
//             appBackgroundColor: !isDarkMode?Colors.white:appColors.appBgColor2,
//             contextCurrentView: context,
//             // scrollPadding: EdgeInsets.only(bottom: 110),
//             isSingleChildScrollViewNeed: true,
//             isFixedDeviceHeight: true,
//             appBarHeight: -1,
//             appBar: Container(),
//             containChild: Container(
//               height: 1,
//               child: Stack(
//                 children: [
//                   Container(
//                     child: CustomScrollView(
//                         controller: _scrollController,
//                         physics: ClampingScrollPhysics(),
//                         shrinkWrap: true,
//                         slivers: <Widget>[
//                           SliverAppBar(
//                             elevation: 0,
//                             leading: IconButton(
//                               onPressed: (){
//                                 Navigator.pop(context);
//                               },
//                               icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,
//                                   imageColor: isAppBarCollapsed ?
//                                   !isDarkMode? Colors.black:Colors.white
//                                       :!isDarkMode? Colors.white:Colors.white,
//                                   iconSize: Size(21, 21)),
//                             ),
//                             leadingWidth: 65,
//                             toolbarHeight: 60,
//                             titleSpacing: 0,
//                             title: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text( isAppBarCollapsed ? widget.userName:"Profile",
//                                         style:TextStyle(
//                                             color:isAppBarCollapsed ?
//                                             !isDarkMode? Colors.black:Colors.white
//                                                 :!isDarkMode? Colors.white:Colors.white,
//                                             fontSize: 22,fontWeight: FontWeight.w700),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 IconButton(
//                                   splashRadius: 25,
//                                   padding: EdgeInsets.zero,
//                                   alignment: Alignment.center,
//                                   onPressed: (){},
//                                   icon:iconApps.iconImage(imageUrl: iconApps.detailAppbarIcon,
//                                       imageColor: Color(0xffE4B343),
//                                       iconSize: Size(25, 25)),
//                                 ),
//                               ],
//                             ),
//                             backgroundColor:!isDarkMode? Colors.white:Color(0xff212327),  //Color(0xff323446),
//                             pinned: true,
//                             floating: false,
//                             expandedHeight:expandedHeight, // MediaQuery.of(context).size.height /2.1,  //2.47,
//                             collapsedHeight:collapsedHeight,   //MediaQuery.of(context).size.height/8,
//                             flexibleSpace: FlexibleSpaceBarWidget(
//                               expandedTitleScale: 1,
//                               background:Container(
//                                 color: !isDarkMode?Colors.white: Color(0xff323446),
//                                 child: Stack(
//                                   alignment: Alignment.topCenter,
//                                   children: [
//                                     ShaderMask(
//                                       shaderCallback: (bound) =>LinearGradient(
//                                         colors: [Colors.black38.withOpacity(0.15),Colors.black87.withOpacity(0.15)],
//                                         begin:Alignment.topLeft,
//                                         end: Alignment.topRight,
//                                       ).createShader(bound),
//                                       blendMode: BlendMode.srcATop,
//                                       child:ClipPath(
//                                           clipper:CustomProfileAppBar(),
//                                           child: CachedNetworkImage(
//                                             imageUrl: "https://northernvirginiamag.com/wp-content/uploads/2018/01/man-having-hair-cut-at-barber-shop.jpg",
//                                             fit:BoxFit.cover,
//                                             width: MediaQuery.of(context).size.width,
//                                             height:MediaQuery.of(context).size.height /4,
//                                           )
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.topCenter,
//                                       child: profileImageWithName,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               title:Container(
//                                 padding: EdgeInsets.zero,
//                                 margin: EdgeInsets.zero,
//                                 color: !isDarkMode?Colors.transparent:Colors.transparent,
//                                 child: TabBar(
//                                   onTap: (index){
//                                     setState(() {
//                                       selectedTab = index;
//                                       isAppBarCollapsed = isAppBarCollapsed;
//                                     });
//                                   },
//                                   controller: tabController,
//                                   tabs: [
//                                     Tab(text: "Basic Info",),
//                                     Tab(text: "Portfolio",),
//                                     Tab(text: "Review",),
//                                   ],
//                                   labelColor: !isDarkMode?Colors.black :Color(0xffE4B343),
//                                   isScrollable: false,
//                                   unselectedLabelColor: Color(0xff828588),
//                                   labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xffE4B343)),
//                                   unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),
//                                   labelPadding: EdgeInsets.only(right: 2,bottom: 0,),
//                                   indicatorPadding: EdgeInsets.symmetric(horizontal: 12,),
//                                   indicatorColor:!isDarkMode? appColors.buttonColor2:Color(0xffE4B343),
//                                   padding: EdgeInsets.zero,
//                                 ),
//                               ),
//                               titlePadding: EdgeInsets.only(top: 20),
//                             ),
//                           ),
//                           SliverFillRemaining(
//                               fillOverscroll: true,
//                               child: Container(
//                                 padding: EdgeInsets.zero,
//                                 margin: EdgeInsets.only(bottom: 0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     // topSection,
//                                     // tabBar
//                                     Expanded(
//                                       child: DefaultTabController(
//                                         length: 3,
//                                         initialIndex: selectedTab,
//                                         child: Container(
//                                           padding: EdgeInsets.zero,
//                                           margin: EdgeInsets.zero,
//                                           child: TabBarView(
//                                             controller: tabController,
//                                             children: [
//                                               // DescriptionPage(),
//                                               SalonDetailAboutScreen(
//                                                 isBarberInfoShow: true,
//                                                 isDataScroll: isAppBarCollapsed,
//                                                 // collapsedheight:collapsedHeight,
//                                                 onPhotoClickCallBack: (){
//                                                   setState(() {
//                                                     selectedTab = 1;
//                                                     tabController!.index = 1;
//                                                     isAppBarCollapsed = isAppBarCollapsed;
//                                                   });
//                                                 },
//                                               ),
//                                               SalonGalleryViewScreen(isDataScroll: isAppBarCollapsed,),
//                                               SalonDetailReviewScreen(isDataScroll: isAppBarCollapsed,collapsedheight:collapsedHeight),
//
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                           )
//                           // SliverList(
//                           //   delegate: SliverChildBuilderDelegate(
//                           //         (context, index) {
//                           //       return Container(
//                           //         padding: EdgeInsets.zero,
//                           //         margin: EdgeInsets.only(bottom: 0),
//                           //         child: Column(
//                           //           mainAxisSize: MainAxisSize.min,
//                           //           mainAxisAlignment: MainAxisAlignment.start,
//                           //           children: [
//                           //             // topSection,
//                           //             // tabBar
//                           //             DefaultTabController(
//                           //               length: 3,
//                           //               initialIndex: selectedTab,
//                           //               child: Container(
//                           //                 padding: EdgeInsets.zero,
//                           //                 margin: EdgeInsets.zero,
//                           //                 height: MediaQuery.of(context).size.height /1.45,
//                           //                 child: TabBarView(
//                           //                   controller: tabController,
//                           //                   children: [
//                           //                     // DescriptionPage(),
//                           //                     SalonDetailAboutScreen(isBarberInfoShow: true,),
//                           //                     Center(child: Text("Tab2"),),
//                           //                     SalonDetailReviewScreen()
//                           //
//                           //                   ],
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //           ],
//                           //         ),
//                           //       );
//                           //     },
//                           //     childCount: 1,
//                           //   ),
//                           // ),
//                         ]
//                     ),
//                   ),
//                 ],
//               ),
//             )
//         )
//     );
//   }
// }



class BarberProfileScreen extends StatefulWidget {
  final onImageCallBack;
  final String profileImgUrl;
  final String userName;
  final String subtitle;
  final String salonName;


  const BarberProfileScreen({Key? key,
    this.onImageCallBack,
    this.profileImgUrl = "https://s3-media0.fl.yelpcdn.com/bphoto/JlcWA9GcKhJaggojJuV8sw/348s.jpg",
    this.userName = "Daniel William",
    this.subtitle = "Barberman",
    this.salonName ="RedBox Barber",

  })
      : super(key: key);
  @override
  _BarberProfileScreenState createState() => _BarberProfileScreenState();
}


class _BarberProfileScreenState extends State<BarberProfileScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double playPauseButtonSize;
  late double infoBoxHeight;
  late ScrollController _scrollController;
  bool isAppBarCollapsed = false;
  late double collapsedHeight;

  int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController =
    new TabController(initialIndex: selectedTab, length: 3, vsync: this);
    super.initState();
    tabController =
    new TabController(initialIndex: selectedTab, length: 3, vsync: this);


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
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    double toolBarHeight = 60;
    double expandedHeight = appDimens.heightFullScreen()>=700?appDimens.heightFullScreen()/2.72:appDimens.heightFullScreen()/2.35; //MediaQuery.of(context).size.height /2.35;
    collapsedHeight =  toolBarHeight +10;




    Widget topSection = Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top:12),
      color:!isDarkMode? appColors.white:appColors.appBgColor2,
      child: BarberProfileTopRowWidget(),
    );

    Widget profileImageWithName = Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GestureDetector(
                      onTap:() {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                              widget: FullPhotoView(profileImgUrl: widget.profileImgUrl,)),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.only(top: appDimens.heightFullScreen()/6.15 /* MediaQuery.of(context).size.height /6.8*/),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2,color:!isDarkMode? appColors.buttonColor2:Color(0xffE4B343),
                            ),
                            shape: BoxShape.circle,
                            color:Colors.transparent,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CachedNetworkImage(
                              imageUrl:widget.profileImgUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
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
                style: TextStyle(fontSize: 22,color:!isDarkMode?Colors.black : Colors.white,fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5,),
              Text("${widget.subtitle} at ${widget.salonName}",
                  style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: !isDarkMode?appColors.textHeadingColor2:AppColors().textHeadingColor1)),
              SizedBox(height: 5,),
              StarRatingBar(
                iconCount: 5,
                iconSize: 23,
                color: !isDarkMode?appColors.buttonColor2 :appColors.buttonColor2,
                unratedColor:!isDarkMode?Colors.grey :Colors.white,
                padding: EdgeInsets.all(2),
                removeItemRating: true,
                itemReviewCount: 125,
                itemViewCountTextStyle:TextStyle(color: AppColors().textNormalColor8,fontSize: 15,fontWeight: FontWeight.w400,),
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              // topSection,
            ]));


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
        child: DetailPhotoView(

        ));

    Widget review = Container(
        padding: EdgeInsets.only(left: 10,),
        // height: MediaQuery.of(context).size.height +250,
        child: ReviewListView(
          itemCount: 3,
        )


    );




    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerFirst(
            isOverLayStatusBar:true,
            appBackgroundColor: !isDarkMode?Colors.white:appColors.appBgColor2,
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
                        controller: _scrollController,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        slivers: <Widget>[
                          SliverAppBar(
                            elevation: 0.5,
                            leading: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,
                                  imageColor: isAppBarCollapsed ?
                                  !isDarkMode? Colors.black:Colors.white
                                      :!isDarkMode? Colors.white:Colors.white,
                                  iconSize: Size(21, 21)),
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
                                      Text( isAppBarCollapsed ? widget.userName:"Profile",
                                        style:TextStyle(
                                            color:isAppBarCollapsed ?
                                            !isDarkMode? Colors.black:Colors.white
                                                :!isDarkMode? Colors.white:Colors.white,
                                            fontSize: 22,fontWeight: FontWeight.w700),
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
                            backgroundColor:!isDarkMode? Colors.white:appColors.appBgColor2,  //Color(0xff323446),
                            pinned: true,
                            floating: false,
                            expandedHeight:expandedHeight, // MediaQuery.of(context).size.height /2.1,  //2.47,
                            collapsedHeight:collapsedHeight,   //MediaQuery.of(context).size.height/8,
                            flexibleSpace: FlexibleSpaceBarWidget(
                              expandedTitleScale: 1,
                              background:Container(
                                color: !isDarkMode?Colors.white:appColors.appBgColor2,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bound) =>LinearGradient(
                                        colors: [Colors.black38.withOpacity(0.15),Colors.black87.withOpacity(0.15)],
                                        begin:Alignment.topLeft,
                                        end: Alignment.topRight,
                                      ).createShader(bound),
                                      blendMode: BlendMode.srcATop,
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
                                  ],
                                ),
                              ),
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
                                       BarberCompanyInfoRow(
                                        rightTitleTextStyle:  TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color:!isDarkMode? Colors.black:Colors.white),
                                        leftTitleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: !isDarkMode? Colors.black:Colors.white),),

                                      // Column(
                                      //   children: [
                                      //     SeeAllTextRow(
                                      //       margin: EdgeInsets.only(left: 20,top: 20,bottom: 10),
                                      //       leftTitle: "About",
                                      //       isRightTextVisible: false,
                                      //       leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:Colors.white) ,
                                      //     ),
                                      //     readMoreText,
                                      //   ],
                                      // ),

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
                                          leftTitle: "Portfolio",
                                          leftTitleTextStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
                                          rightTextCallBack:() {
                                            Navigator.push(
                                              context,
                                              SlideRightRoute(
                                                  widget: SalonGalleryViewScreen(title: "Portfolio",)),
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
                                          leftTitleTextStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
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

