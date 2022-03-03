import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BookingDetailCardView extends StatelessWidget {
  final onClickCardCallBack;

  const BookingDetailCardView({Key? key, this.onClickCardCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15,),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: AppColors().appBgColor3,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                this.onClickCardCallBack?.call(0);
                // print(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Html(data: "Salon: RedBox Barber",
                      style: {'html': Style.fromTextStyle(
                          TextStyle(
                            backgroundColor: Colors.transparent,
                            fontSize: 17.5,
                            fontWeight: FontWeight.w600,
                            height: 0,
                            color: Colors.white,
                          ))
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(Icons.location_on,size: 16,color: Color(0xff3885FF),),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Html(data: "288 McClure Court,Arkansas",
                              style: {'html': Style.fromTextStyle(
                                  TextStyle(
                                    backgroundColor: Colors.transparent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    color: Colors.white.withOpacity(0.9),
                                  )
                              )},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 55.0,
                          width: 55.0,
                          margin: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: "https://www.spadash.com/assets/img/blog/barber-spray-bottle.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left:10.0),
                                child: Text("Stylist",style: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(height: 8,),
                              Html(data:"Julia Chan",
                                style: {'html': Style.fromTextStyle(
                                    TextStyle(
                                      backgroundColor: Colors.transparent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                      color: Colors.white,
                                    )
                                )},
                              ),
                              // Text("Julia Chan",style:TextStyle(color: Colors.white,
                              //     fontSize: 12,fontWeight:FontWeight.w500 ),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Material(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 0.0,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero,
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:AppColors().textHeadingColor1,
                                        ),
                                        child:Align(
                                          alignment: Alignment.center,
                                          child:iconApps.iconImage(imageUrl: iconApps.bottomMenuChatIcon,iconSize: Size(18, 18)),
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero,
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:AppColors().textHeadingColor1,
                                        ),
                                        child:Align(
                                          alignment: Alignment.center,
                                          child:iconApps.iconImage(imageUrl: iconApps.phoneIcon,
                                              imageColor: Colors.white,
                                              iconSize: Size(18, 18)),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  }
}

