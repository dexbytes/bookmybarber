import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';

class BookingDetailPaymentCard extends StatelessWidget {

  const BookingDetailPaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
        color:!isDarkMode ?Colors.white:AppColors().appBgColor3,
        height: 152,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110.0,
                  width: 110.0,
                  margin: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:"https://t4.ftcdn.net/jpg/03/70/54/57/360_F_370545759_BB79gT7Uw9kdvy9TBIrQsEDnNwr56H38.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Html(data: "RedBox Barber",
                                style: {'html': Style.fromTextStyle(
                                    TextStyle(
                                      backgroundColor: Colors.transparent,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                      color:!isDarkMode ?Colors.black:Colors.white,
                                    ))
                                },
                              ),
                            ),

                            StarRatingBar(
                              padding: EdgeInsets.only(right:0),
                              removeViewCount: true,
                              itemRatingTextStyle: TextStyle(color: Colors.black),
                              initialRating:4
                            ),
                            // Text("1.2Km"),
                          ],
                        ),
                        Html(data: "288 McClure Court, Arkansas",
                          style: {'html': Style(
                            fontSize: FontSize.medium,
                            lineHeight: LineHeight(0.6),
                            color: Colors.grey,
                            height: 20,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fontWeight: FontWeight.w500,
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(0),
                          )},
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(Icons.location_on,size: 18,color: Colors.grey,),
                            ),
                            Expanded(
                              child: Html(data: "1.2Km",
                                style: {'html': Style(
                                  fontSize: FontSize.medium,
                                  lineHeight: LineHeight(0.6),
                                  color: Colors.grey,
                                  height: 20,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  fontWeight: FontWeight.w600,
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.all(0),

                                )},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text("Services:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: !isDarkMode ?Colors.black:AppColors().textHeadingColor1,
                                ),

                              ),
                            ),
                            Expanded(
                              child: Html(data:"Haircut, Facial & MakeUp",
                                style: {'html': Style(
                                  fontSize: FontSize.medium,
                                  lineHeight: LineHeight(0.6),
                                  color:!isDarkMode ?Colors.grey:AppColors().textHeadingColor1,
                                  height: 20,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  fontWeight: FontWeight.w500,
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.all(0),

                                )},
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0,top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text( "Total:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: !isDarkMode ?Colors.black:AppColors().white,
                    ),

                  ),
                  SizedBox(width: 5,),
                  Text("\$45.00",
                  style: TextStyle(
                    backgroundColor: Colors.transparent,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color:!isDarkMode ?AppColors().textHeadingColor2:Color(0xff14D9D4),
                  ),
                  ),
                ],
              ),
            )

          ],
        ),
      );

  }
}
