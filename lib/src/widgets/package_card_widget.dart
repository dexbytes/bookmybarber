import 'package:base_flutter_app/src/model/home_card_model.dart';
import 'package:base_flutter_app/src/model/pakage_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class PackageCardWidget extends StatelessWidget {
  final Color color;
  final onCardClickCallBack;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final bool isSecondDataVisible;
  final bool isBookRowVisible;

  PackageCardWidget({
    this.color = Colors.deepOrangeAccent,
    this.onCardClickCallBack,
    this.titleTextStyle = const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,height: 0.5),
    this.subtitleTextStyle = const TextStyle(fontSize: 13.5,fontWeight: FontWeight.w400,color: Colors.grey,height: 0.2),
    this.isSecondDataVisible = false,
    this.isBookRowVisible = false,
  });



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(right: 10,left: 10,),
      physics: ClampingScrollPhysics(),
      itemCount:package.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.zero,
          // height: 180,
          // width: 320,
          child: Material(
            color: Colors.transparent,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  this.onCardClickCallBack?.call();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: package[index].imageUrl,
                            fit: BoxFit.cover,
                            height:MediaQuery.of(context).size.height/4.5,
                            width:MediaQuery.of(context).size.height,
                          )
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data:package[index].title,
                                  style: {'html' : Style.fromTextStyle(
                                      titleTextStyle
                                  )},

                                ),
                              ),
                              Text("Book Now",
                                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFCCA76A)),)
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Html(data:package[index].subtitle,
                                  style: {'html' : Style.fromTextStyle(
                                      subtitleTextStyle
                                  )},

                                ),
                              ),
                              Text("\$${package[index].price}",
                                style:TextStyle(fontSize: 12.5,fontWeight: FontWeight.w600,color: Colors.white),)
                            ],
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
      },
    );
  }
}
