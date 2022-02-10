import 'package:base_flutter_app/src/model/barber_name_row_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class BarberSpecialistCircularWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isFeatureVisible;
  final bool isSubtitleVisible;
  final bool isSecondDataVisible;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final EdgeInsetsGeometry padding;

  BarberSpecialistCircularWidget({Key? key,
    this.onClickCardCallBack,
    this.isFeatureVisible = true,
    this.titleTextStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  Color(0xff828588)),
    this.subtitleTextStyle = const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400, color: Color(0xffCBAD90)),
    this.isSubtitleVisible = false,
    this.isSecondDataVisible = false,
    this.padding = const EdgeInsets.only(left: 10),
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding:padding,
      physics: ClampingScrollPhysics(),
      itemCount: isSecondDataVisible ?barber2.length :barber.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.onClickCardCallBack?.call(0);

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
                          height: 68,
                          width: 68,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2,color:  Color(0xffCCA76A)),
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
                                imageUrl: isSecondDataVisible ? barber2[index].imageUrl: barber[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            )
                          )
                      ),
                    ),
                    SizedBox(height: 10),

                    Text( isSecondDataVisible ? barber2[index].title: barber[index].title,
                        style: titleTextStyle,maxLines: 1,),
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
                    SizedBox(height: isSubtitleVisible ?4:0),
                    Visibility(
                        visible: isSubtitleVisible,
                        child: Text(isSecondDataVisible ? barber2[index].subtitle: barber[index].subtitle,
                          style:subtitleTextStyle,
                          textAlign: TextAlign.center,maxLines: 1,),),
                  ],
                ),
                Visibility(
                  visible: isFeatureVisible,
                  child: Positioned(
                    top: 58,
                    left: 7,
                    child: index == 1 ?Container(
                      alignment: Alignment.center,
                      height: 18,
                      width: 62,
                      decoration: BoxDecoration(
                          color: Color(0xffE4B343),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text("FEATURED",
                        style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
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
        mainAxisExtent: isSubtitleVisible ? 96 :85
    ),
    );

  }
}



