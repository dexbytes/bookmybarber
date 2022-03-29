import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/model/salon_list_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';


class SalonListBottomSheetScreen extends StatefulWidget {

  const SalonListBottomSheetScreen({Key? key,


  }) : super(key: key);
  @override
  _SalonListBottomSheetScreenState createState() => _SalonListBottomSheetScreenState();
}

class _SalonListBottomSheetScreenState extends State<SalonListBottomSheetScreen> {


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    _dataView() {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 0,right: 0,top: 12,bottom: 25),
          physics: ClampingScrollPhysics(),
          itemCount: salonList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                  border: Border(bottom: BorderSide(width: 0.3,color: Colors.grey))
              ),
              child: Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 115.0,
                    margin: EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: salonList[index].imageUrl,
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
                                child: Html(data: salonList[index].title,
                                  style: {'html': Style.fromTextStyle(
                                      TextStyle(
                                        backgroundColor: Colors.transparent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        color:!isDarkMode ?Colors.black:Colors.white,
                                      )
                                  )
                                  },
                                ),
                              ),
                              // Text("RedBox Barber"),
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
                              // Text("1.2Km"),
                            ],
                          ),
                          Html(data: salonList[index].subtitle,
                            style: {'html': Style(
                              fontSize: FontSize.medium,
                              lineHeight: LineHeight(0.6),
                              color: Colors.grey,
                              height: 20,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              fontWeight: FontWeight.w400,
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(0),
                            )},
                          ),
                          //  Text("288 McClure Court, Arkansas"),
                          SizedBox(height: 5,),
                          StarRatingBar(
                            color: !isDarkMode ? Color(0xffFD6C57):Color(0xffE4B343),
                            padding: EdgeInsets.only(left: 5, bottom: 0),
                            removeViewCount: true,
                            itemRatingTextStyle: TextStyle(color: !isDarkMode ?Colors.black:Colors.white),
                            initialRating:salonList[index].rating,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data: salonList[index].timing,
                                  style: {'html': Style(
                                    fontSize: FontSize.medium,
                                    lineHeight: LineHeight(0.6),
                                    color:  !isDarkMode ? Color(0xffFE9654):AppColors().textHeadingColor1,
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
                              // Text("8:30AM - 9:00PM"),
                              ElevatedButton(
                                onPressed: () {
                                  // this.onBookClickCallBack.call();
                                },
                                child: Text(
                                    "Book"
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    primary: !isDarkMode ? Color(0xffFE9654):Color(0xffE4B343),
                                    onPrimary: !isDarkMode ?Colors.white :Colors.black,
                                    minimumSize: Size(70, 30)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
      );
    }


    return _dataView();

  }
}