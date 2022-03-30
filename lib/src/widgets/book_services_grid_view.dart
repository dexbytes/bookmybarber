import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'full_photo_view_screen.dart';

class BookServicesGridViewWidget extends StatefulWidget {
  final onAddClickCallBack;
  final bool isFeatureVisible;
  final bool isSubtitleVisible;
  final bool isBorderSelectVisible;
  final TextStyle titleTextStyle;
  final TextStyle? titleAfterSelectTextStyle;
  final TextStyle subtitleTextStyle;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final double height;
  final double width;
  final  serviceList;

  BookServicesGridViewWidget({Key? key,
    this.onAddClickCallBack,
    this.isFeatureVisible = true,
    this.titleTextStyle =  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    this.subtitleTextStyle = const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500, color:  Color(0xffCBAD90)),
    this.isSubtitleVisible = false,
    this.padding = const EdgeInsets.only(left: 15,right: 10),
    this.borderColor = const Color(0xffCBAD90),
    this.height = 70,
    this.width = 70,
    this.isBorderSelectVisible = false,
    this.titleAfterSelectTextStyle, this.serviceList,
  }) : super(key: key);

  @override
  State<BookServicesGridViewWidget> createState() => _BookServicesGridViewWidgetState();
}

class _BookServicesGridViewWidgetState extends State<BookServicesGridViewWidget> {
  List serviceList = [];
  List serviceList2 = [];

  @override
  void initState() {
    this.serviceList = widget.serviceList;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding:widget.padding,
      physics: ClampingScrollPhysics(),
      itemCount: serviceList.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:() {
                      Navigator.push(
                        context,
                        BottomUpTransition(
                            widget: FullPhotoView(profileImgUrl:serviceList[index].imageUrl,)),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.only(bottom: 12),
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)
                      ),
                      child: Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          height: widget.height,
                          width: widget.width,
                          decoration: BoxDecoration(
                            border:Border.all(width: 2,color:!isDarkMode? appColors.buttonColor2:widget.borderColor),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2,color: !isDarkMode? Colors.white:Color(0xff212327)),
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CachedNetworkImage(
                                  imageUrl: serviceList[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(serviceList[index].title,
                          style:  widget.isBorderSelectVisible ?
                          widget.titleAfterSelectTextStyle ??
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff828588))
                              :widget.titleTextStyle
                          ,maxLines: 1,),
                        SizedBox(height: widget.isSubtitleVisible ?4:0),
                        Visibility(
                          visible: widget.isSubtitleVisible,
                          child: Text("\$${serviceList[index].price}",
                            style:widget.subtitleTextStyle,
                            textAlign: TextAlign.center,maxLines: 1,),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            widget.onAddClickCallBack(serviceList[index].title,serviceList[index].price);
                            // List abc = ['abc','xyz'];
                            // this.widget.onAddClickCallBack.call(abc);
                          },
                          child: Text(
                              "Add"
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              primary: !isDarkMode ? Color(0xffFE9654):appColors.buttonColor,
                              onPrimary: !isDarkMode ?Colors.white :Colors.black,
                              minimumSize: Size(65, 30)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }, /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, //for most popular item list count : 2  & for BrandCardView count :4
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 130
    ),*/
    );

  }
}

