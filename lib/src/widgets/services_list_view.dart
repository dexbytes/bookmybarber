import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServicesListView extends StatelessWidget {
  final onViewCardCallBack;
  final bool isListTwoVisible;

  ServicesListView({Key? key,
    this.onViewCardCallBack,
    this.isListTwoVisible = false
  }) : super(key: key);



  List<ServicesRawDataList> categories = [
    ServicesRawDataList(
      title: 'HairStyle',
      subtitle: '10 types',
      icon: 'assets/images/categories_style_icon.png',
      colors: Color(0xffFD6C57),
    ),
    ServicesRawDataList(
      title: 'Shaving',
      subtitle: '6 types',
      icon: 'assets/images/categories_ustra_icon.png',
      colors: Color(0xffE4B343),
    ),
    ServicesRawDataList(
      title: 'Hairdryer',
      subtitle: '4 types',
      icon: 'assets/images/dryer_icon.png',
      colors: Color(0xff615DD9),
    ),
    ServicesRawDataList(
      title: 'Haircut',
      subtitle: '8 types',
      icon: 'assets/images/comb_icon.png',
      colors: Color(0xff12B39A),
    ),
    ServicesRawDataList(
      title: 'Hair Coloring',
      subtitle: '4 types',
      icon: 'assets/images/dye_icon.png',
      colors: Color(0xff323446),
    ),
  ServicesRawDataList(
      title: 'Facial Makeup',
      subtitle: '12 types',
      icon: 'assets/images/make_icon.png',
      colors: Color(0xffFE457C),
    ),
    ServicesRawDataList(
      title: 'Eye Makeup',
      subtitle: '6 types',
      icon: 'assets/images/categories_eye_icon.png',
      colors: Color(0xff3885FF),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 20,top:10,right: 15),
      physics: NeverScrollableScrollPhysics(),
      itemCount:categories.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            // onTap: (){
            //   print("$index",);
            //   this.onClickCardCallBack?.call(0);
            // },
            child:Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.only(bottom: 15,right: 15),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)
                  ),
                  color: categories[index].colors,
                  child: Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.transparent,
                      ),
                      child:Align(
                        alignment: Alignment.center,
                        child:iconApps.iconImage(
                            imageUrl:categories[index].icon,
                            imageColor: Colors.white,
                            iconSize: Size(38, 38)
                        ),
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( categories[index].title,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white)),
                            InkWell(
                              onTap: (){
                                this.onViewCardCallBack?.call(0);
                              },
                              child: Text("View",
                                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFCCA76A)),),
                            )
                          ],
                        ),
                      SizedBox(height: 5,),
                      Text( categories[index].subtitle,
                     style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff828588))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}

class ServicesRawDataList {
  final String title;
  final String subtitle;
  final Color colors;
  final String icon;

  ServicesRawDataList( {
    required this.title,
    required this.colors,
    required this.icon,
    required this.subtitle,
  });
}
