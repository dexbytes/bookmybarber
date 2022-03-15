import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/model/barber_name_row_data_model.dart';
import 'package:base_flutter_app/src/pages/barber_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BarberSpecialistCircularWidget extends StatefulWidget {
  final onClickCardCallBack;
  final bool isFeatureVisible;
  final bool isSubtitleVisible;
  final bool isSecondDataVisible;
  final bool isBorderSelectVisible;
  final TextStyle titleTextStyle;
  final TextStyle? titleAfterSelectTextStyle;
  final TextStyle subtitleTextStyle;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final double height;
  final double width;

  BarberSpecialistCircularWidget({Key? key,
    this.onClickCardCallBack,
    this.isFeatureVisible = true,
    this.titleTextStyle =  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff828588)),
    this.subtitleTextStyle = const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400, color:  Color(0xffCBAD90)),
    this.isSubtitleVisible = false,
    this.isSecondDataVisible = false,
    this.padding = const EdgeInsets.only(left: 10),
    this.borderColor = const Color(0xffCBAD90),
    this.height = 68,
    this.width = 68,
    this.isBorderSelectVisible = false,
    this.titleAfterSelectTextStyle,
  }) : super(key: key);

  @override
  State<BarberSpecialistCircularWidget> createState() => _BarberSpecialistCircularWidgetState();
}

class _BarberSpecialistCircularWidgetState extends State<BarberSpecialistCircularWidget> {
  int selectImage = 0;

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding:widget.padding,
      physics: ClampingScrollPhysics(),
      itemCount: widget.isSecondDataVisible ?barber2.length :barber.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.widget.onClickCardCallBack?.call();
              setState(() {
                selectImage = index;
              });
              widget.isBorderSelectVisible ? Container():Navigator.push(
                MainAppBloc.getDashboardContext,
                SlideRightRoute(widget: BarberProfileScreen(
                  userName: widget.isSecondDataVisible ? barber2[index].title: barber[index].title,
                  subtitle: widget.isSecondDataVisible ? barber2[index].subtitle: barber[index].subtitle,
                  profileImgUrl: widget.isSecondDataVisible ? barber2[index].imageUrl: barber[index].imageUrl,

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
                            border: widget.isBorderSelectVisible
                                ? !isDarkMode?
                                 Border.all(width: 2,color: selectImage == index ? appColors.buttonColor2:widget.borderColor )
                                :Border.all(width: 2,color: selectImage == index ? Color(0xff00B2AE):widget.borderColor )
                                : Border.all(width: 2,color: !isDarkMode? appColors.buttonColor2:widget.borderColor),
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
                                  imageUrl: widget.isSecondDataVisible ? barber2[index].imageUrl: barber[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 10),

                    Text( widget.isSecondDataVisible ? barber2[index].title: barber[index].title,
                      style:  widget.isBorderSelectVisible ?
                      widget.titleAfterSelectTextStyle ??
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500,
                              color:  !isDarkMode?
                              selectImage == index ? appColors.buttonColor2: Color(0xff828588)
                             :selectImage == index ? Color(0xff00B2AE) : Color(0xff828588))
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
                      child: Text(widget.isSecondDataVisible ? barber2[index].subtitle: barber[index].subtitle,
                        style:widget.subtitleTextStyle,
                        textAlign: TextAlign.center,maxLines: 1,),),
                  ],
                ),
                Visibility(
                  visible: widget.isFeatureVisible,
                  child: Positioned(
                    top: 58,
                    left: 7,
                    child: index == 1 ?Container(
                      alignment: Alignment.center,
                      height: 18,
                      width: 62,
                      decoration: BoxDecoration(
                          color: !isDarkMode? appColors.buttonColor2:Color(0xffE4B343),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text("FEATURED",
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                    ):Container(height: 0,width: 0,),
                  ),
                )
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 5,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: widget.isSubtitleVisible ? 96 :90
    ),
    );

  }
}







