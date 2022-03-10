import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/model/barber_name_row_data_model.dart';
import 'package:base_flutter_app/src/pages/barber_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BarberSearchGridViewWidget extends StatefulWidget {
  final onClickCardCallBack;
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

  BarberSearchGridViewWidget({Key? key,
    this.onClickCardCallBack,
    this.isFeatureVisible = true,
    this.titleTextStyle =  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff828588)),
    this.subtitleTextStyle = const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400, color:  Color(0xffCBAD90)),
    this.isSubtitleVisible = false,
    this.padding = const EdgeInsets.only(left: 25),
    this.borderColor = const Color(0xffCBAD90),
    this.height = 75,
    this.width = 75,
    this.isBorderSelectVisible = false,
    this.titleAfterSelectTextStyle,
  }) : super(key: key);

  @override
  State<BarberSearchGridViewWidget> createState() => _BarberSearchGridViewWidgetState();
}

class _BarberSearchGridViewWidgetState extends State<BarberSearchGridViewWidget> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      padding:widget.padding,
      physics: ClampingScrollPhysics(),
      itemCount: searchBarber.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.widget.onClickCardCallBack?.call();
              Navigator.push(
                context,
                SlideRightRoute(
                    widget: BarberProfileScreen(
                      userName: searchBarber[index].title,
                      subtitle: searchBarber[index].subtitle,
                      profileImgUrl: searchBarber[index].imageUrl,

                    )),
              );
            },
            child:Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)
                      ),
                      child: Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          height: widget.height,
                          width: widget.width,
                          decoration: BoxDecoration(
                            border:Border.all(width: 2,color:widget.borderColor),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Color(0xff212327)),
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CachedNetworkImage(
                                  imageUrl: searchBarber[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 10),

                    Text( searchBarber[index].title,
                      style:  widget.isBorderSelectVisible ?
                      widget.titleAfterSelectTextStyle ??
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff828588))
                          :widget.titleTextStyle
                      ,maxLines: 1,),
                    // Html(data: barber[index].title,
                    //   style: {'html' : Style(
                    //     fontSize: FontSize.medium,
                    //     padding: EdgeInsets.all(0),
                    //     margin: EdgeInsets.all(0),
                    //     fontWeight: FontWeight.w500,
                    //     color:Color(0xff828588),
                    //     display: Display.INLINE,
                    //     height: 0.0,
                    //   )},
                    // ),
                    // Html(data: barber[index].subtitle,
                    //   style: {'html' : Style(
                    //        lineHeight: LineHeight.number(0.5),
                    //       fontSize: FontSize.medium,
                    //       padding: EdgeInsets.all(0),
                    //       margin: EdgeInsets.all(0),
                    //       fontWeight: FontWeight.w500,
                    //       color:Color(0xff828588),
                    //       display: Display.INLINE,
                    //     textAlign: TextAlign.start
                    //   )},
                    // ),
                    SizedBox(height: widget.isSubtitleVisible ?4:0),
                    Visibility(
                      visible: widget.isSubtitleVisible,
                      child: Text(searchBarber[index].subtitle,
                        style:widget.subtitleTextStyle,
                        textAlign: TextAlign.center,maxLines: 1,),),
                  ],
                ),
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //for most popular item list count : 2  & for BrandCardView count :4
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: widget.isSubtitleVisible ? 96 :110
    ),
    );

  }
}


