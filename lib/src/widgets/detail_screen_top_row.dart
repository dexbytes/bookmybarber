import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreenTopRowWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isListTwoVisible;

  DetailScreenTopRowWidget({Key? key,
    this.onClickCardCallBack,
    this.isListTwoVisible = false
  }) : super(key: key);



  List<DetailScreenTopRowData> rowData = [
    DetailScreenTopRowData(
      title: 'Website',
      icon: 'assets/images/detail_website_icon.png',
    ),
    DetailScreenTopRowData(
      title: 'Call',
      icon: 'assets/images/detail_call_icon.png',
    ),
    DetailScreenTopRowData(
      title: 'Direction',
      icon: 'assets/images/detail_map_icon.png',
    ),
    DetailScreenTopRowData(
      title: 'Share',
      icon: 'assets/images/detail_share_icon.png',
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20,right: 15),
      physics: NeverScrollableScrollPhysics(),
      itemCount:rowData.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.onClickCardCallBack?.call(0);

            },
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child:Align(
                      child:iconApps.iconImage(
                          imageUrl: rowData[index].icon,
                          imageColor: Color(0xffE4B343),
                          iconSize: Size(40, 40)

                      ),
                    )
                ),
                SizedBox(height: 1,),
                Text( rowData[index].title,
                    style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w500,
                        color: Color(0xffCBAD90))),
                // SizedBox(height: 2),
                // Text(rowData[index].subtitle,style: TextStyle(fontSize: 11.5,fontWeight: FontWeight.w400,color: Color(0xff828588))),
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 28,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 70
    ),
    );

  }
}

class DetailScreenTopRowData {
  final String title;
  final String icon;

  DetailScreenTopRowData( {
    required this.title,
    required this.icon,
  });
}


