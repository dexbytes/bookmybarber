import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/my_booking_raw_model.dart';
import 'package:base_flutter_app/src/model/salon_list_raw_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BookingCardView extends StatelessWidget {
  final onClickCardCallBack;

  const BookingCardView({Key? key, this.onClickCardCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 80),
        physics: ClampingScrollPhysics(),
        itemCount: booking.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: AppColors().appBgColor3,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    this.onClickCardCallBack?.call(0);
                    print(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight:  Radius.circular(8))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,size: 12,color: Colors.white,),
                              SizedBox(width: 5,),
                              Text("${booking[index].date}At",
                              style: TextStyle(fontSize:12,fontWeight: FontWeight.w500,color: Colors.white ),
                              ),
                                SizedBox(width: 5,),
                              Text(booking[index].time,
                              style: TextStyle(fontSize:12,fontWeight: FontWeight.w500,color: Colors.white ),
                              )
                              ],
                            ),
                            Text(booking[index].status ?"Accepted" : "Pending",
                            style:booking[index].status
                                ? TextStyle(fontSize:13,fontWeight: FontWeight.w500,color: AppColors().textHeadingColor1 )
                                : TextStyle(fontSize:13,fontWeight: FontWeight.w500,color:Colors.grey )
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              height: 70.0,
                              width: 70.0,
                              margin: EdgeInsets.all(5),
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                            color: Colors.white,
                                          ))
                                      },
                                    ),
                                    Html(data: booking[index].service,
                                      style: {'html': Style(
                                        fontSize: FontSize.medium,
                                        lineHeight: LineHeight(0.5),
                                        color: Colors.grey,
                                        height: 18,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        fontWeight: FontWeight.w400,
                                        padding: EdgeInsets.all(0),
                                        margin: EdgeInsets.all(0),
                                      )},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0,top: 2),
                                      child: Row(
                                        children: [
                                          Text("Stylist:",style: TextStyle(color: Colors.grey, fontSize: 11,),),
                                          SizedBox(width: 2,),
                                          Text(booking[index].stylistName,style: TextStyle(color: Colors.white,
                                              fontSize: 11,fontWeight:FontWeight.w400 ),),

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
                            Material(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 20.0,right: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: (){},
                                      child: Container(
                                          padding: EdgeInsets.zero,
                                          margin: EdgeInsets.zero,
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:AppColors().textHeadingColor1,
                                          ),
                                          child:Align(
                                            alignment: Alignment.center,
                                            child:iconApps.iconImage(imageUrl: iconApps.bottomMenuChatIcon,iconSize: Size(13, 13)),
                                      )
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    InkWell(
                                      onTap: (){},
                                      child: Container(
                                          padding: EdgeInsets.zero,
                                          margin: EdgeInsets.zero,
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:AppColors().textHeadingColor1,
                                          ),
                                          child:Align(
                                            alignment: Alignment.center,
                                            child:iconApps.iconImage(imageUrl: iconApps.phoneIcon,
                                                imageColor: Colors.white,
                                                iconSize: Size(13, 13)),
                                      )
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
