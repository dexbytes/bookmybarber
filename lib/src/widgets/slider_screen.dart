import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/photo_raw_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SliderScreen extends StatefulWidget {
  final double imageHeight;
  final double? imageWidth;
  final int activeIndex;
  final int initialPage;
  final bool enlargeCenterPage;
  final bool autoPlay;
  final bool enableInfiniteScroll;
  final double viewportFraction;
  final bool isDotVisible;
  final bool dotBackgroundVisible;
  final Color activeDotColor;
  final Color inActiveDotColor;
  final Color? dotBackgroundColor;
  final double dotHeight;
  final double dotWidth;
  final bool   isDotOverlay;
  final List<PhotosRawData> urlImages;
  final Function(dynamic)? imageClickCallBack;
  final double borderRadius;
  final double backgroundWidth;
  final double backgroundHeight;
  final double topMargin;



   SliderScreen({Key? key,
     this.imageHeight = 400,
     this.activeIndex = 0,
     this.initialPage = 0,
     this.enlargeCenterPage = true,
     this.enableInfiniteScroll = false,
     this.autoPlay = false,
     this.viewportFraction = 0.95,
     this.isDotVisible = false,
     this.dotBackgroundVisible = false,
     this.activeDotColor = const Color(0xffE4B343),
     this.inActiveDotColor = Colors.grey,
     this.dotHeight = 6,
     this.dotWidth = 6,
     this.isDotOverlay = false,
     required this.urlImages,
     this.imageClickCallBack,
     this.dotBackgroundColor,
     this.borderRadius = 20,
     this.backgroundWidth = 90,
     this.backgroundHeight =15,
     this.imageWidth,
     this.topMargin = 0,
   }) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {


    Widget buildImage(String photo ,int index) => GestureDetector(
      onTap:() {
        this.widget.imageClickCallBack?.call(index);
        print('$index');

      },      child: CachedNetworkImage(
        imageUrl: photo,
        fit: BoxFit.cover,
        width:  widget.imageWidth == null? MediaQuery.of(context).size.width:widget.imageWidth,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors().appBgColor2,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
        ),
      leadingWidth: 80,
      elevation: 0,
      backgroundColor: AppColors().appBgColor2,
      title: Text("Gallery"),
      titleTextStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin:EdgeInsets.only(top:widget.topMargin,bottom: !widget.isDotVisible?0:(widget.isDotOverlay?0:20)),
                  child: CarouselSlider.builder(
                        itemBuilder: (BuildContext context,index,realIndex) {
                          final urlImage = widget.urlImages[index].imageUrl;
                          return buildImage(urlImage,index);
                        },
                        itemCount: widget.urlImages.length,
                          options: CarouselOptions(
                              height: widget.imageHeight,
                              enlargeCenterPage: widget.enlargeCenterPage,
                              autoPlay: widget.autoPlay,
                              // aspectRatio: 16/9,
                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                              viewportFraction: widget.viewportFraction,
                              enableInfiniteScroll: widget.enableInfiniteScroll,
                              initialPage: widget.initialPage,
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),

                          ),),
                ),
                Visibility(
                  visible: widget.urlImages.length>1?widget.isDotVisible:false,
                  child: Container(
                    height: widget.backgroundHeight,
                    width: widget.backgroundWidth,
                    margin: EdgeInsets.symmetric(vertical: widget.isDotOverlay?8:0),
                    padding: EdgeInsets.only(top: widget.isDotOverlay?0:10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      color: widget.dotBackgroundVisible
                          ? widget.dotBackgroundColor == null? Color(0xffB8BCBF).withOpacity(0.2):widget.dotBackgroundColor
                          :Colors.transparent
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedSmoothIndicator(
                          activeIndex:activeIndex,
                          count:photo.length,
                          effect: ScrollingDotsEffect(
                            dotHeight: widget.dotHeight,
                            dotWidth: widget.dotWidth,
                            activeDotColor:widget.activeDotColor,
                            dotColor: widget.inActiveDotColor,

                          )),
                    ),
                  ),
                )
              ],
              alignment: Alignment.bottomCenter,
            ),
             ],
           ),
    );


  }
}

//
// class FullPhotoView extends StatelessWidget {
//   final imageRatio;
//   final String? imageUrl;
//   final bool? isImage;
//   final String? appBarTitle;
//   FullPhotoView(
//       {Key? key, this.imageUrl, this.imageRatio, this.appBarTitle = "",this.isImage = true});
//
//   //Back press
//   Future<bool> onBackPress() {
//     return Future.value(true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //AppFonts _appFonts = Provider.of<AppFonts>(context);
//     // appDimens.appDimensFind(context: context);
//     //AppString _appString = Provider.of<AppString>(context);
//
//     // Widget _appBar = BackArrowAppBar(
//     //   appBarBgColor: appColors.appTransColor,
//     //   // backArrowImage: iconApps.backArrowPng,
//     //   leftIconSize: 60,
//     //   title: appBarTitle ?? "",
//     //   titleStyle: appStyles.appBarT1Style(
//     //       fontSize: 18, texColor: appColors.textNormalColor[100]),
//     //   appBar: true,
//     //   onPressed: () {
//     //     Navigator.pop(context);
//     //   },
//     // );
//
//     return Material(
//         child: AnnotatedRegion<SystemUiOverlayStyle>(
//             value: SystemUiOverlayStyle(
//               statusBarColor: appColors.appBgColor[100],
//             ),
//             child: Container(
//               color: appColors.appBgColor[100],
//               child: SafeArea(
//                 child: Scaffold(
//                   appBar: _appBar as PreferredSizeWidget?,
//                   body: Container(
//                     color: appColors.yellow,
//                     child: new FullPhotoScreen(
//                         imageUrl: imageUrl, imageRatio: this.imageRatio,isImage:isImage),
//                   ),
//                 ),
//               ),
//             )));
//   }
// }
//
// class FullPhotoScreen extends StatefulWidget {
//   final index;
//   final imageRatio;
//   final String? imageUrl;
//   final bool? isImage;
//   FullPhotoScreen(
//       {Key? key, required this.imageUrl, this.index, this.imageRatio,this.isImage})
//       : super(key: key);
//
//   @override
//   State createState() => new FullPhotoScreenState(
//       url: this.imageUrl, index: this.index, imageRatio: this.imageRatio,isImage:this.isImage);
// }
//
// class FullPhotoScreenState extends State<FullPhotoScreen> {
//   String? url;
//   int? index = 0;
//   int imageRatio = 7;
//
//   double? mainViewHeight;
//   late double mainViewWidth;
//   double horizontalDeviceMargin = 300;
// //      AppValuesFilesLink().appValuesDimens.horizontalMarginPadding(value: 80);
//
//   //Image size
//   List<double> imageWidth = [];
//   List<double?> imageHeight = [];
//
//   bool isScaleStateZooming = false;
//   bool? isImage;
//   FullPhotoScreenState({Key? key, required this.url, this.index, imageRatio,this.isImage = true}) {
//     if (imageRatio == null) {
//       this.imageRatio = 7;
//     } else {
//       this.imageRatio = imageRatio;
//     }
//   }
//
//   @override
//   void initState() {
//     projectUtil.statusBarColor(
//         statusBarColor: appColors.appStatusBarColor[200]);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     projectUtil.statusBarColor();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // AppDimens _appDimens = Provider.of<AppDimens>(context);
//     //AppStyle _appStyle = Provider.of<AppStyle>(context);
//     //AppColors _appColors = Provider.of<AppColors>(context);
//     // AppFonts _appFonts = Provider.of<AppFonts>(context);
//     appDimens.appDimensFind(context: context);
//
//     Widget singleImage(url) {
//       bool isVideo = !isImage!;
//
//       return Container(
//           color: appColors.white,
//           margin: EdgeInsets.only(left: 0, right: 0),
//           //  child: isVideo?Container(height: _appDimens.heightFullScreen(),color: Colors.red,)
//           child: isVideo
//               ? url != null
//               ? Container(
//             child: VideoView(url: url),
//           )
//               : Container()
//               :
//           ( (url.contains('http') || url.contains('https'))? PhotoView(
//             imageProvider: NetworkImage(url),
//             maxScale: PhotoViewComputedScale.covered * 1.8,
//             minScale: PhotoViewComputedScale.contained * 1,
//             tightMode: false,
//             /* scaleStateChangedCallback: (state) {
//                     setState(() {
//                       isScaleStateZooming = state.isScaleStateZooming;
//                     });
//                   },*/
//             backgroundDecoration: BoxDecoration(
//               //color: appColors.white,
//                 color: appColors.white),
//             loadingBuilder:
//                 (BuildContext context, ImageChunkEvent? loadingProgress) {
//               return Center(
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     // color: Colors.yellow,
//                     child: ProgressBar()
//                         .showLoaderOnUi(false, Colors.transparent),
//                   ));
//             },
//           ): PhotoView(
//             imageProvider: FileImage(File(url)),
//             maxScale: PhotoViewComputedScale.covered * 1.8,
//             minScale: PhotoViewComputedScale.contained * 1,
//             tightMode: false,
//             /* scaleStateChangedCallback: (state) {
//                     setState(() {
//                       isScaleStateZooming = state.isScaleStateZooming;
//                     });
//                   },*/
//             backgroundDecoration: BoxDecoration(
//               //color: appColors.white,
//                 color: appColors.white),
//             loadingBuilder:
//                 (BuildContext context, ImageChunkEvent? loadingProgress) {
//               return Center(
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     // color: Colors.yellow,
//                     child: ProgressBar()
//                         .showLoaderOnUi(false, Colors.transparent),
//                   ));
//             },
//           )));
//     }
//
//     /*  Widget singleImage1(url) {
//       return Container(
//         color: appColors.red,
//         child: new Swiper(
//           itemBuilder: (BuildContext context, int index) {
//             return singleImage(itemList[index]);
//           },
//           itemCount: itemList.length,
//           control: new SwiperControl(
//               iconNext: Icons.navigate_next,
//               iconPrevious: Icons.navigate_before,
//               color: appColors.white,
//               size: 28),
//           index: index,
//         ),
//       );
//     }
// */
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle(
//           statusBarColor: appColors.appStatusBarColor[200],
//         ),
//         child: Scaffold(
//           backgroundColor: appColors.white,
//           body: GestureDetector(
//             /*  onVerticalDragStart: (value) {
//           //PhotoViewComputedScale.covered * 1.8
//             if (!isScaleStateZooming) {
//               Navigator.pop(context);
//             }
//         },*/
//             child: Container(
//               color: appColors.grey,
//               //color: Colors.white,
//               padding: EdgeInsets.only(left: 0, right: 0),
//               child: Center(
//                 child: Stack(
//                   children: <Widget>[
//                     singleImage(url),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
//
//   heightCalculate() {
//     mainViewWidth =
//     300; // AppValuesFilesLink().appValuesDimens.widthFullScreen();
//     double width = mainViewWidth - horizontalDeviceMargin;
//     mainViewHeight = width * 0.5625;
//     imageWidth.add(width);
//     imageHeight.add(mainViewHeight);
//   }
// }

