import 'package:base_flutter_app/src/model/photo_raw_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPhotoView extends StatelessWidget {
  final String imageUrl;
  final cardCallBack;
  final double imageHeight;
  final double imageWidth;
  final BoxFit boxFit;

  DetailPhotoView({
    this.imageUrl = "https://st2.depositphotos.com/1017228/11421/i/950/depositphotos_114213658-stock-photo-woman-getting-haircut-by-female.jpg",
    this.cardCallBack,
    this.imageHeight= 75,
    this.imageWidth = 80,
    this.boxFit = BoxFit.cover,
  });


  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 0,),
      physics: ClampingScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            this.cardCallBack?.call();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:photo[index].imageUrl,fit: boxFit,
                  height:imageHeight ,width:imageWidth ,
                ),
              ),
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 5,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 90
    ),
    );
  }
}


