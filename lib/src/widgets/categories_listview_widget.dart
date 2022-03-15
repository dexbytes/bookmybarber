import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class CategoriesListView extends StatefulWidget {
  final onCardCallBack;
  bool isViewVisible;
  final bool isDataScroll;

  final collapsedheight;

  CategoriesListView({Key? key,
    this.onCardCallBack,
    this.isViewVisible = false, this.isDataScroll = true, this.collapsedheight
  }) : super(key: key);

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {


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
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 20,top:0,right: 15,bottom: 0),
      physics: widget.isDataScroll?ClampingScrollPhysics():NeverScrollableScrollPhysics(),
      itemCount:categories.length ,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.widget.onCardCallBack?.call();
            },
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
                    padding: EdgeInsets.only(top: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( categories[index].title,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:!isDarkMode ?Colors.black:Colors.white,)),
                            InkWell(
                              onTap: (){
                                this.widget.onCardCallBack?.call();
                              },
                              child:
                              // Expanded(child: DropDownDataPicker2())
                              Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,)

                              // Padding(
                              //   padding:  EdgeInsets.all(5.0),
                              //   child: Text("View",
                              //     style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFCCA76A)),),
                              // ) ,
                            )
                          ],
                        ),
                        SizedBox(height: 1,),
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

