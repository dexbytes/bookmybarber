import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriesCircularWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isListTwoVisible;

  int maxItemToShow = 5;

  CategoriesCircularWidget({Key? key,
    this.onClickCardCallBack,
    this.isListTwoVisible = false
  }) : super(key: key);



  List<CategoriesList> categories = [
    CategoriesList(
      title: 'Salon',
      subtitle: '85 Places',
      icon: 'assets/images/categories_shop_icon.png',
      colors: Color(0xffFD6C57),
    ),
    CategoriesList(
      title: 'Haircut',
      subtitle: '126 Places',
      icon: 'assets/images/categories_haircut_icon.png',
      colors: Color(0xff12B39A),
    ),
    CategoriesList(
      title: 'Styling',
      subtitle: '18 Places',
      icon: 'assets/images/categories_style_icon.png',
      colors: Color(0xffFE457C),
    ),
    CategoriesList(
      title: 'Shampoo',
      subtitle: '20 Places',
      icon: 'assets/images/categories_shampoo_icon.png',
      colors: Color(0xff615DD9),
    ),
    CategoriesList(
      title: 'Saving',
      subtitle: '48 Places',
      icon: 'assets/images/categories_ustra_icon.png',
      colors: Color(0xffFE9654),
    ),
  ];

  List<CategoriesList> categories2 = [
    CategoriesList(
      title: 'Haircut',
      subtitle: '126 Places',
      icon: 'assets/images/comb_icon.png',
      colors: Color(0xffFD6C57),
    ),
    CategoriesList(
      title: 'Coloring',
      subtitle: '50 Places',
      icon: 'assets/images/dye_icon.png',
      colors: Color(0xff3885FF),
    ),
    CategoriesList(
      title: 'Makeup',
      subtitle: '60 Places',
      icon: 'assets/images/make_icon.png',
      colors: Color(0xffFE457C),
    ),
    CategoriesList(
      title: 'Hairdryer',
      subtitle: '85 Places',
      icon: 'assets/images/dryer_icon.png',
      colors: Color(0xff615DD9),
    ),
    CategoriesList(
      title: 'Spa',
      subtitle: '24 Places',
      icon: 'assets/images/beard-icon.png',
      colors: Color(0xffFE9654),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 13,right: 15,),
      physics: ClampingScrollPhysics(),
     itemCount: isListTwoVisible ? categories2.length : categories.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.onClickCardCallBack?.call();
              Navigator.push(
                MainAppBloc.getDashboardContext,
                SlideRightRoute(
                    widget: SalonListViewAllScreen(title: isListTwoVisible ? categories2[index].title : categories[index].title ,)),
              );

            },
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.only(left: 6,right: 12),
                  elevation: 1.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)
                  ),
                  color: isListTwoVisible ? categories2[index].colors :categories[index].colors,
                  child: Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.transparent,
                      ),
                      child:Align(
                        alignment: Alignment.center,
                        child:iconApps.iconImage(
                            imageUrl: isListTwoVisible ? categories2[index].icon : categories[index].icon,
                            imageColor: Colors.white,
                            iconSize: Size(38, 38)

                        ),
                      )
                  ),
                ),
                SizedBox(height: 10),
                Text( isListTwoVisible ? categories2[index].title : categories[index].title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                SizedBox(height: 2),
                Text(isListTwoVisible ? categories2[index].subtitle : categories[index].subtitle,style: TextStyle(fontSize: 11.5,fontWeight: FontWeight.w400,color: Color(0xff828588))),
              ],
            ),
          ),
        );
      },
    );

    // ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   padding: EdgeInsets.only(left: 20,right: 15,),
    //   physics: ClampingScrollPhysics(),
    // //  itemCount: isListTwoVisible ? categories2.length : categories.length ,
    //   itemCount:   isListTwoVisible ? categories2.length : categories.length >
    //       maxItemToShow?maxItemToShow+1
    //       : isListTwoVisible ? categories2.length : categories.length,
    //   shrinkWrap: true,
    //   itemBuilder: (BuildContext context, int index) {
    //     if(index < maxItemToShow){
    //       return Material(
    //         color: Colors.transparent,
    //         child: InkWell(
    //           onTap: (){
    //             print("$index",);
    //             this.onClickCardCallBack?.call();
    //             Navigator.push(
    //               MainAppBloc.getDashboardContext,
    //               SlideRightRoute(
    //                   widget: SalonListViewAllScreen(title: isListTwoVisible ? categories2[index].title : categories[index].title ,)),
    //             );
    //
    //           },
    //           child:Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Card(
    //                 margin: EdgeInsets.only(left: 6,right: 12),
    //                 elevation: 1.5,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(80)
    //                 ),
    //                 color: isListTwoVisible ? categories2[index].colors :categories[index].colors,
    //                 child: Container(
    //                     padding: EdgeInsets.zero,
    //                     margin: EdgeInsets.zero,
    //                     height: 64,
    //                     width: 64,
    //                     decoration: BoxDecoration(
    //                       shape: BoxShape.circle,
    //                       color:Colors.transparent,
    //                     ),
    //                     child:Align(
    //                       alignment: Alignment.center,
    //                       child:iconApps.iconImage(
    //                           imageUrl: isListTwoVisible ? categories2[index].icon : categories[index].icon,
    //                           imageColor: Colors.white,
    //                           iconSize: Size(38, 38)
    //
    //                       ),
    //                     )
    //                 ),
    //               ),
    //               SizedBox(height: 10),
    //               Text( isListTwoVisible ? categories2[index].title : categories[index].title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
    //               SizedBox(height: 2),
    //               Text(isListTwoVisible ? categories2[index].subtitle : categories[index].subtitle,style: TextStyle(fontSize: 11.5,fontWeight: FontWeight.w400,color: Color(0xff828588))),
    //             ],
    //           ),
    //         ),
    //       );
    //     }else{
    //       return  GestureDetector(
    //         onTap: (){
    //           Navigator.push(
    //             MainAppBloc.getDashboardContext,
    //             SlideRightRoute(
    //                 widget: SalonListViewAllScreen(title: isListTwoVisible ? categories2[index].title : categories[index].title ,)),
    //           );
    //         },
    //         child: Container(
    //           height: 64,width: 64,
    //             padding: EdgeInsets.zero,
    //             margin: EdgeInsets.only(bottom: 65,top: 25),
    //             decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //               color:Colors.grey.withOpacity(0.2),
    //             ),
    //             child:Align(
    //               alignment: Alignment.center,
    //               child:Text('View all', style: TextStyle(color: Colors.white,fontSize: 12.5,fontWeight: FontWeight.w600),)
    //             )
    //         ),
    //       );
    //         // Text('View all', style: TextStyle(color: Colors.white),);
    //     }
    //   },
    // );

  }
}

class CategoriesList {
  final String title;
  final String subtitle;
  final Color colors;
  final String icon;

  CategoriesList( {
    required this.title,
    required this.colors,
    required this.icon,
    required this.subtitle,
  });
}


