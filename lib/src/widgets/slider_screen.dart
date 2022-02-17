import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/photo_raw_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SliderScreen extends StatefulWidget {
  final double imageHeight;
  final double imageWidth;
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
     this.imageHeight = 600,
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
     this.imageWidth = 100,
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

      },      child: PhotoView(
        imageProvider: NetworkImage(photo,
          // fit: BoxFit.cover,
          // width:  widget.imageWidth == null? MediaQuery.of(context).size.width:widget.imageWidth, ,
        ),
      backgroundDecoration: BoxDecoration(
        color: AppColors().appBgColor2,
      ),
      maxScale: PhotoViewComputedScale.covered * 1.8,
      minScale: PhotoViewComputedScale.contained * 1,
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
