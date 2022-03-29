import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/my_booking_raw_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';

class BookingCardView extends StatelessWidget {
  final onClickCardCallBack;

  const BookingCardView({Key? key, this.onClickCardCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 2,right: 2,top: 10,bottom: 80),
        physics: ClampingScrollPhysics(),
        itemCount: booking.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color:!isDarkMode?Colors.grey.withOpacity(0.05):AppColors().appBgColor3,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    this.onClickCardCallBack?.call();
                    print(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                            color: !isDarkMode?Colors.grey.withOpacity(0.18):Colors.black87,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight:  Radius.circular(8))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,size: 14,color:!isDarkMode? Colors.black:Colors.white,),
                              SizedBox(width: 5,),
                              Text("${booking[index].date} At",
                              style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,color:!isDarkMode? Colors.black:Colors.white,),
                              ),
                                SizedBox(width: 5,),
                              Text(booking[index].time,
                              style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,color: !isDarkMode? Colors.black:Colors.white,),
                              )
                              ],
                            ),
                            Text(booking[index].status ?"Accepted" : "Pending",
                            style:!isDarkMode?
                            booking[index].status
                                ? TextStyle(fontSize:15.5,fontWeight: FontWeight.w600,color:Colors.green )
                                : TextStyle(fontSize:15.5,fontWeight: FontWeight.w500,color:AppColors().textNormalColor8)
                                : booking[index].status
                                ? TextStyle(fontSize:15.5,fontWeight: FontWeight.w500,color: AppColors().textHeadingColor1 )
                                : TextStyle(fontSize:15.5,fontWeight: FontWeight.w500,color:Colors.grey )
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              height: 78.0,
                              width: 78.0,
                              margin: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: booking[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Html(data: booking[index].salonName,
                                      style: {'html': Style.fromTextStyle(
                                          TextStyle(
                                            backgroundColor: Colors.transparent,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                            color:!isDarkMode? Colors.black : Colors.white,

                                          )
                                      )
                                      },
                                    ),
                                    Html(data: booking[index].service,
                                      style: {'html': Style(
                                        fontSize: FontSize.large,
                                        lineHeight: LineHeight(0.5),
                                        color: !isDarkMode? Colors.black.withOpacity(0.5) :Colors.grey,
                                        height: 18,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        fontWeight: FontWeight.w500,
                                        padding: EdgeInsets.all(0),
                                        margin: EdgeInsets.all(0),
                                      )},
                                    ),
                                    SizedBox(height: 2,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0,top: 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text("Stylist:",style: TextStyle(color: !isDarkMode? Colors.black.withOpacity(0.5) :Colors.grey, fontSize: 12.5,fontWeight:FontWeight.w500),),
                                          SizedBox(width: 2,),
                                          Text(booking[index].stylistName,style: TextStyle(
                                              color:  !isDarkMode? Colors.black:Colors.white,
                                              fontSize: 13.5,
                                              fontWeight:FontWeight.w500 ),),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                              Material(
                                                elevation: 0,
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 0.0,right: 2),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        onTap: (){},
                                                        child: Container(
                                                            padding: EdgeInsets.zero,
                                                            margin: EdgeInsets.zero,
                                                            height: 36,
                                                            width: 36,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color:!isDarkMode? Colors.black87.withOpacity(0.2):appColors.buttonColor,
                                                            ),
                                                            child:Align(
                                                              alignment: Alignment.center,
                                                              child:iconApps.iconImage(imageUrl: iconApps.bottomMenuChatIcon,
                                                                  imageColor: !isDarkMode?Colors.black87:appColors.white,
                                                                  iconSize: Size(13, 13)),
                                                            )
                                                        ),
                                                      ),
                                                      SizedBox(width: 8,),
                                                      InkWell(
                                                        onTap: (){},
                                                        child: Container(
                                                            padding: EdgeInsets.zero,
                                                            margin: EdgeInsets.zero,
                                                            height: 36,
                                                            width: 36,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color:!isDarkMode?Colors.black87.withOpacity(0.2) :appColors.buttonColor,
                                                            ),
                                                            child:Align(
                                                              alignment: Alignment.center,
                                                              child:iconApps.iconImage(imageUrl: iconApps.phoneIcon,
                                                                  imageColor: !isDarkMode?Colors.black87:appColors.white,
                                                                  iconSize: Size(13, 13)),
                                                            )
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                            ],),
                                          )
                                          // Expanded(
                                          //   child: Html(data:"Victor Black",
                                          //     style: {'html': Style(
                                          //       fontSize: FontSize.small,
                                          //       lineHeight: LineHeight(0.5),
                                          //       color: Colors.white,
                                          //       height: 18,
                                          //       width: MediaQuery
                                          //           .of(context)
                                          //           .size
                                          //           .width,
                                          //       fontWeight: FontWeight.w400,
                                          //       padding: EdgeInsets.all(0),
                                          //       margin: EdgeInsets.all(0),
                                          //     )},
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
        }
    );
  }
}
