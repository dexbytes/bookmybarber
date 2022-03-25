import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/model/photo_raw_data_model.dart';
import 'package:base_flutter_app/src/pages/salon_detail_gallery_view.dart';
import 'package:base_flutter_app/src/values/app_color.dart';
import 'package:base_flutter_app/src/widgets/photo_slider_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class DetailPhotoView extends StatelessWidget {
  final String imageUrl;
  final cardCallBack;
  final seeAllCallBack;
  final double imageHeight;
  final double imageWidth;
  final BoxFit boxFit;

  DetailPhotoView({
    this.imageUrl = "https://st2.depositphotos.com/1017228/11421/i/950/depositphotos_114213658-stock-photo-woman-getting-haircut-by-female.jpg",
    this.cardCallBack,
    this.imageHeight= 70,
    this.imageWidth = 75,
    this.boxFit = BoxFit.cover,
    this.seeAllCallBack,
  });

  int maxItemToShow = 6;

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 0,right: 15),
      physics: ClampingScrollPhysics(),
      // itemCount: isListTwoVisible ? categories2.length : categories.length ,
        itemCount:photo.length>
            maxItemToShow?maxItemToShow+1
            :  photo.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
    if(index < maxItemToShow) {
      return GestureDetector(
        onTap: () {
          this.cardCallBack?.call();

          print(photo[index].id,);
          Navigator.push(
            context,
            SlideRightRoute(
                widget: PhotoSliderScreen(
                  urlImages: photo,
                  initialPage: index,
                  isDotVisible: true,
                  activeDotColor: Color(0xffE4B343),
                  dotHeight: 8,
                  dotWidth: 8,

                )),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: photo[index].imageUrl, fit: boxFit,
                height: imageHeight, width: imageWidth,
              ),
            ),
          ),
        ),
      );
    }else{
      return GestureDetector(
        onTap: (){
          this.seeAllCallBack?.call();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.25)
          ),
            alignment: Alignment.center,
            child: Text("See All",
              style: TextStyle(
                  color: !isDarkMode ?appColors.black:Colors.white,
                  fontSize: 15,fontWeight: FontWeight.w600),)),
      );
    }
      },
    );
  }

}


