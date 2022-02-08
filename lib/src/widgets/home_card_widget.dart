import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final Color color;
  final Function(dynamic)? onCardClickCallBack;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;

  HomeCardWidget({
    this.color = Colors.deepOrangeAccent,
    this.onCardClickCallBack,
    this.titleTextStyle = const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),
    this.subtitleTextStyle = const TextStyle(fontSize: 13.5,fontWeight: FontWeight.w400,color: Colors.grey),
  });

  List<HomeCardList> home = [
    HomeCardList(
      title: "RedBox Barber",
      subtitle: "288 McClure Court, Arkansas",
      icon: "assets/images/card_image.png",
    ),
    HomeCardList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      icon: "assets/images/card_image_2.png",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 15,),
        physics: ClampingScrollPhysics(),
        itemCount: home.length ,
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
                  onTap: (){},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(image:AssetImage(home[index].icon),
                          fit: BoxFit.cover,
                          height:MediaQuery.of(context).size.height/7,
                          width:MediaQuery.of(context).size.height /2,
                        ),
                        /* Ink.image(image:AssetImage("assets/images/card_image.png",),
                    fit: BoxFit.cover,
                    height:MediaQuery.of(context).size.height/6,
                    width:MediaQuery.of(context).size.height /3,
                    ),*/
                      ),

                      SizedBox(height: 10,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(home[index].title,
                                style: titleTextStyle,
                                ),
                                StarRatingBar(
                                  removeViewCount: true,
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(home[index].subtitle,
                              style: subtitleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
          mainAxisSpacing: 12,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
          mainAxisExtent: MediaQuery.of(context).size.height/3.2
      ),
      );
  }
}

class HomeCardList {
  final String title;
  final String subtitle;
  final String icon;

  HomeCardList( {
    required this.title,
    required this.icon,
    required this.subtitle,
  });
}

