import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/model/review_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';

class ReviewListView extends StatelessWidget {
  final void Function()? onTap;
  final bool isLess;
  final Function(dynamic)? commentTypeCallBack;

  const ReviewListView({Key? key,
    this.isLess = true,
    this.commentTypeCallBack,
    this.onTap

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      itemCount: review.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(bottom: BorderSide(color: Colors.grey,width: 0.4,))
          ),
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 20.0,
            left: 0.0,
            right: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(right: 10),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color:!isDarkMode?Colors.grey:Color(0xff323446)),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2,color: !isDarkMode?Colors.white:Color(0xff212327)),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: CachedNetworkImage(
                              imageUrl: review[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                      )
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Html(data: review[index].name,
                            style: {'html' : Style.fromTextStyle(
                              TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  height: 0.85),
                              // fontSize: FontSize.xLarge,
                              // lineHeight: LineHeight(1),
                              // color:!isDarkMode? Colors.black:Colors.white,
                              // height: 30,
                              // fontWeight: FontWeight.w500,
                              // padding: EdgeInsets.zero,
                              // margin: EdgeInsets.all(0),

                            )},
                          ),
                          SizedBox(height: 1),
                          Padding(
                            padding:EdgeInsets.only(left: 5.0),
                            child: StarRatingBar(
                              removeViewCount: true,
                              removeItemRating: true,
                              iconSize: 20,
                              iconCount: 5,
                              color: !isDarkMode?appColors.buttonColor2 :appColors.buttonColor2,
                              unratedColor:!isDarkMode?Colors.grey :Colors.white,
                              initialRating: review[index].rating,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Html(data: review[index].daysAgo,
                      style: {'html' : Style(
                        fontSize: FontSize.medium,
                        lineHeight: LineHeight(0.5),
                        color: Color(0xff828588),
                        height: 28,
                        fontWeight: FontWeight.w400,
                        padding: EdgeInsets.only(left: 4,top: 9),
                        margin: EdgeInsets.all(0),

                      )},
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: onTap,
                  child: Html(data: review[index].subtitle,
                    style: {'html' : Style(
                        fontSize: FontSize.large,
                        lineHeight: LineHeight(1.3),
                        color: Color(0xff828588),
                        // height: review[index].subtitle.length.,//isLess ? 130 :52,,\
                        fontWeight: FontWeight.w500,
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        maxLines: 20
                    )},)

              ),
            ],
          ),
        );
      },
    );
  }
}




