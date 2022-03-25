import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/model/home_card_model.dart';
import 'package:base_flutter_app/src/model/pakage_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class PackageCardWidget extends StatelessWidget {
  final Color color;
  final onCardClickCallBack;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle subtitleTextStyle2;
  final ScrollPhysics physics;
  final int? itemCount;
  final EdgeInsetsGeometry? padding;
  final bool isShowGridView;

  PackageCardWidget({
    this.color = Colors.deepOrangeAccent,
    this.onCardClickCallBack,
    this.titleTextStyle = const TextStyle(fontSize: 15.8,fontWeight: FontWeight.w600,color: Colors.white,height: 0.5),
    this.subtitleTextStyle = const TextStyle(fontSize: 13.5,fontWeight: FontWeight.w400,color: Colors.grey,height: 0.2),
    this.subtitleTextStyle2 = const TextStyle(fontSize: 10.5,fontWeight: FontWeight.w400,color: Colors.grey,height: 0.2),
    this.physics = const ClampingScrollPhysics(),
    this.itemCount,
    this.padding,
    this.isShowGridView = false,
  });



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return isShowGridView? GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: padding ??EdgeInsets.only(right: 10,left: 10,bottom: 60),
      physics: physics,
      itemCount: itemCount ?? package.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.zero,
          child: Material(
            color: Colors.transparent,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  this.onCardClickCallBack?.call();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: package[index].imageUrl,
                            fit: BoxFit.cover,
                            height:MediaQuery.of(context).size.height/6,
                            width:MediaQuery.of(context).size.height,
                          )
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data:package[index].title,
                                  style: {'html' : Style.fromTextStyle(
                                      titleTextStyle
                                  )},

                                ),
                              ),
                              Text("Book Now",
                                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: !isDarkMode? appColors.textHeadingColor2:Color(0xFFCCA76A)),)
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data:package[index].subtitle,
                                  style: {'html' : Style.fromTextStyle(
                                      subtitleTextStyle2
                                  )},

                                ),
                              ),
                              Text("\$${package[index].price}",
                                style:TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: !isDarkMode?  Colors.black :Colors.white,),)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
          mainAxisSpacing: 12,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
          mainAxisExtent: 290
      ),
    ):ListView.builder(
      scrollDirection: Axis.vertical,
      padding: padding ??EdgeInsets.only(right: 10,left: 10,bottom: 60),
      physics: physics,
      itemCount: itemCount ?? package.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.zero,
          // height: 180,
          // width: 320,
          child: Material(
            color: Colors.transparent,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  this.onCardClickCallBack?.call();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: package[index].imageUrl,
                            fit: BoxFit.cover,
                            height:MediaQuery.of(context).size.height/4.5,
                            width:MediaQuery.of(context).size.height,
                          )
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data:package[index].title,
                                  style: {'html' : Style.fromTextStyle(
                                      titleTextStyle
                                  )},

                                ),
                              ),
                              Text("Book Now",
                                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: !isDarkMode? appColors.textHeadingColor2:Color(0xFFCCA76A)),)
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data:package[index].subtitle,
                                  style: {'html' : Style.fromTextStyle(
                                      subtitleTextStyle
                                  )},

                                ),
                              ),
                              Text("\$${package[index].price}",
                                style:TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: !isDarkMode?  Colors.black :Colors.white,),)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
