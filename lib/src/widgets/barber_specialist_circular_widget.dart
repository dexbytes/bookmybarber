import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarberSpecialistCircularWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isListTwoVisible;

  BarberSpecialistCircularWidget({Key? key,
    this.onClickCardCallBack,
    this.isListTwoVisible = false
  }) : super(key: key);



  List<CategoriesList> categories = [
    CategoriesList(
      title: 'Mike West',
      icon: 'assets/images/barber_image.png',
    ),
    CategoriesList(
      title: 'Thomas',
      icon: 'assets/images/barber_image_2.png',
    ),
    CategoriesList(
      title: 'Kevin Doyle',
      icon: 'assets/images/barber_image_3.png',
    ),
    CategoriesList(
      title: 'Victor Black',
      icon: 'assets/images/barber_image_4.png',
    ),
    CategoriesList(
      title: 'Edward',
      icon: 'assets/images/barber_image_5.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      physics: ClampingScrollPhysics(),
      itemCount:categories.length ,
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
                          height: 70,
                          width: 70,
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
                            child: Image(image: AssetImage(categories[index].icon,),
                            fit: BoxFit.cover,
                            ),
                          )
                          // Align(
                          //   alignment: Alignment.center,
                          //   child:iconApps.iconImage(
                          //       imageUrl: categories[index].icon,
                          //       imageColor: Colors.white,
                          //       iconSize: Size(38, 38)
                          //
                          //   ),
                          // )
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(categories[index].title,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:  Color(0xff828588)
                    )),
                  ],
                ),
                Positioned(
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
                  ):Container(),
                )
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 5,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 85
    ),
    );

  }
}

class CategoriesList {
  final String title;
  final String icon;

  CategoriesList( {
    required this.title,
    required this.icon,
  });
}


