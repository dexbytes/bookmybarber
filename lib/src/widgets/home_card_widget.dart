import 'package:base_flutter_app/src/model/home_card_model.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class HomeCardWidget extends StatelessWidget {
  final Color color;
  final onCardClickCallBack;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final bool isSecondDataVisible;
  final bool isBookRowVisible;

  HomeCardWidget({
    this.color = Colors.deepOrangeAccent,
    this.onCardClickCallBack,
    this.titleTextStyle = const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black,height: 0.5),
    this.subtitleTextStyle = const TextStyle(fontSize: 13.5,fontWeight: FontWeight.w400,color: Colors.grey,height: 0.3),
    this.isSecondDataVisible = false,
    this.isBookRowVisible = false,
  });



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 15,left: 20),
        physics: ClampingScrollPhysics(),
        itemCount: isSecondDataVisible ? home2.length :home.length ,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            // height: 180,
            // width: 320,
            child: Material(
              color: Colors.transparent,
              child: Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: InkWell(
                  onTap: (){
                    this.onCardClickCallBack?.call();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: isSecondDataVisible ? home2[index].imageUrl :home[index].imageUrl,
                          fit: BoxFit.cover,
                            height: isBookRowVisible ? MediaQuery.of(context).size.height/8 :MediaQuery.of(context).size.height/7,
                            width:MediaQuery.of(context).size.height /2,
                        )

                        // Image(image:AssetImage(home[index].imageUrl),
                        //   fit: BoxFit.cover,
                        //   height:MediaQuery.of(context).size.height/7,
                        //   width:MediaQuery.of(context).size.height /2,
                        // ),
                        /* Ink.image(image:AssetImage("assets/images/card_image.png",),
                    fit: BoxFit.cover,
                    height:MediaQuery.of(context).size.height/6,
                    width:MediaQuery.of(context).size.height /3,
                    ),*/
                      ),

                      SizedBox(height: 10,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Html(data: isSecondDataVisible ?home2[index].title :home[index].title,
                                    style: {'html' : Style.fromTextStyle(
                                      titleTextStyle
                                    )},

                                  ),
                                ),
                                StarRatingBar(
                                  removeViewCount: true,
                                )
                              ],
                            ),
                            Html(data:isSecondDataVisible ?home2[index].subtitle :home[index].subtitle,
                              style: {'html' : Style.fromTextStyle(
                               subtitleTextStyle
                              )},

                            ),
                          ],
                        ),
                      ),
                      isBookRowVisible ?
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(10))
                            ),
                            child: Text("Book",
                              style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,color: Colors.black),),
                            height: 30,
                            width: 70,
                          )
                        ],),
                      ):Container()
                    ],
                  ),
                ),
              ),
            ),
          );
        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
          mainAxisSpacing: 12,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
          mainAxisExtent: MediaQuery.of(context).size.height/2.8
      ),
      );
  }
}

