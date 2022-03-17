import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_time_widget.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class FilterScreen extends StatefulWidget {
  final String userName;
  final String email;
  final String image;
  final List<String> subtitle;

  const FilterScreen({Key? key,
    this.userName ="Dino Waelchi",
    this.email ="Dino_waelchi@gmail.com",
    this.image ="https://pyxis.nymag.com/v1/imgs/51d/e5c/bb6f6065a9676bda462b93f24fd790368e-17-gal-gadot.rsquare.w700.jpg",
    this.subtitle = const ["Most popular", "Cost Low to High", "Cost High to Low"],
  })
      : super(key: key);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}


class _FilterScreenState extends State<FilterScreen>
    with TickerProviderStateMixin {
  RangeValues values = RangeValues(0, 10);
  RangeLabels labels = RangeLabels("0", "10");

   int selectValue = 0;
  int selectedChoice = 0;


  List<SortList> sort = [
   SortList(title:"Most popular",),
   SortList(title: "Cost Low to High",),
   SortList(title:  "Cost High to Low"),

  ];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;



    Widget appbarView = Container(

      padding: EdgeInsets.only(left: 15,right: 15),
      color:!isDarkMode ?Colors.white:AppColors().appBgColor3,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: !isDarkMode ?Colors.black:Color(0xffE4B343)),)),
            Text('Filters',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: !isDarkMode ?Colors.black:Colors.white),),
            InkWell(
                onTap: (){},
                child: Text('Reset',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:!isDarkMode ?Colors.black:Color(0xffE4B343)),)),
          ],
        ),
      )
    );

    serviceTag(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.0,left: 12,top: 20),
            child: Text("Services",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: !isDarkMode ?Colors.black:AppColors().textHeadingColor1)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:12,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                labelTextStyle: TextStyle(
                    color: !isDarkMode? Colors.black:Color(0xff828588),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                selectedColor: !isDarkMode ?appColors.buttonColor2:Color(0xffCCA76A),
                backgroundColor: !isDarkMode? appColors.grey.withOpacity(0.15):appColors.appBgColor3,
                isSecondColorShow: false,
                reportList: [
                 "Hairstyle", "Makeup", "Hair Coloring", "Spa", "Facial Makeup", "Trim & saving"

                ],)),
        ],
      );
    }

    Widget starRating = Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rating",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: !isDarkMode ?Colors.black:AppColors().textHeadingColor1)),
            SizedBox(height: 8,),
            Row(
              children: [
                StarRatingBar(
                  unratedColor: Colors.grey,
                  iconCount: 5,
                  iconSize: 30,
                  color:  !isDarkMode ?appColors.buttonColor2:appColors.buttonColor,
                  removeViewCount: true,
                  itemRatingTextStyle: TextStyle(color:  !isDarkMode ?Colors.black:Colors.white,fontSize: 14,fontWeight: FontWeight.w500,),
                  spaceWithStar: 20,
                ),
                Text("Star",
                    style: TextStyle(color: !isDarkMode ?Colors.black:Colors.white,fontSize: 14,fontWeight: FontWeight.w500,),),
              ],
            ),
          ],
        )
    );


    Widget gender = Container(
        padding: EdgeInsets.only(right: 50,top: 25,left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text("Gender",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,
                      color: !isDarkMode ?Colors.black:AppColors().textHeadingColor1)),
            ),
            SizedBox(height: 2,),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey.withOpacity(0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio<int>(
                          value: 0,
                          groupValue: selectValue,
                          activeColor:  !isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                          onChanged: (value) =>setState(()=>selectValue = value!),
                        ),
                      ),
                      Text("Man",style:!isDarkMode?
                      TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: selectValue == 0?appColors.buttonColor2:Colors.black)
                      :TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                    ],
                  ),
                  // Text("Man",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio<int>(
                            value: 1,
                            activeColor:  !isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                            focusColor: Colors.white,

                            groupValue: selectValue,
                            onChanged: (value) =>setState(()=>selectValue = value! )
                        ),
                      ),
                      Text("Woman",style: !isDarkMode?
                      TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: selectValue == 1?appColors.buttonColor2:Colors.black)
                          : TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: selectValue == 1?Color(0xffE4B343):Colors.white),),
                    ],
                  ),
               Row(
                 children: [
                   Transform.scale(
                        scale: 1.1,
                        child: Radio<int>(
                            value: 2,
                            activeColor:  !isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                            focusColor: Colors.white,

                            groupValue: selectValue,
                            onChanged: (value) =>setState(()=>selectValue = value! )
                        ),
                      ),
                   Text("Other",style:!isDarkMode?
                   TextStyle(fontSize: 16,
                       fontWeight: FontWeight.w500,
                       color: selectValue == 2?appColors.buttonColor2:Colors.black)
                  : TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: selectValue == 2?Color(0xffE4B343):Colors.white),)
                 ],
               ),
                ],
              ),
            ),
          ],
        )
    );


    Widget slider = Container(
        padding: EdgeInsets.only(right: 10,top: 20,left: 10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.0),
              child: Text("Distance",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:!isDarkMode?Colors.black:AppColors().textHeadingColor1)),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Text("${values.end} \k\m",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey),),
                ),
              ],
            ),
            SizedBox(height: 4,),
            Container(
              margin: EdgeInsets.symmetric(horizontal:16),
              child: SliderTheme(
                data: SliderThemeData(
                  activeTickMarkColor:!isDarkMode?appColors.buttonColor2:AppColors().textHeadingColor1,
                  activeTrackColor: !isDarkMode?appColors.buttonColor2:AppColors().textHeadingColor1,
                  inactiveTickMarkColor: Colors.transparent,
                  thumbColor:!isDarkMode?appColors.buttonColor2:AppColors().textHeadingColor1,
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 2,
                  rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 10),
                ),
                child: RangeSlider(
                  onChanged: (value){
                    setState(() {
                      values = value;
                      labels =  RangeLabels(values.start.toString(),values.end.toString());
                    });
                  },
                  values: values,
                  min: 0,
                  max: 10,
                  // labels:labels,
                  divisions: 20,

                ),
              ),
            ),
          ],
        ),
    );

    priceTag(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 16),
            child: Text("Price",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:!isDarkMode?Colors.black:AppColors().textHeadingColor1)),
          ),
          Container(
              margin: EdgeInsets.only(left:30,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                labelTextStyle: TextStyle(
                    color: !isDarkMode? Colors.black:Color(0xff828588),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                selectedColor: !isDarkMode ?appColors.buttonColor2:Color(0xffCCA76A),
                backgroundColor: !isDarkMode? appColors.grey.withOpacity(0.15):appColors.appBgColor3,
                padding: EdgeInsets.only(left: 20,right: 20),
                isSecondColorShow: false,
                reportList: [
                  "\$", "\$\$", "\$\$\$",
                ],)),
        ],
      );
    }

    Widget sorting = Container(
      height: 215,
        padding: EdgeInsets.only(right: 20,top: 25,left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Container(
                margin: EdgeInsets.zero,
                child: Text("Sort by",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:!isDarkMode ?Colors.black:AppColors().textHeadingColor1)),
              ),
            ),
            ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            itemCount: sort.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Material(
                color: Colors.transparent,
                child: ListTile(
                    selected: selectedChoice == index,
                    onTap: (){
                      setState(() {
                        selectedChoice = index;
                      });
                    },
                    contentPadding: EdgeInsets.only(left: 15,bottom: 0,top: 0),
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sort[index].title,
                        style:TextStyle(fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: !isDarkMode ?
                            selectedChoice == index? appColors.buttonColor2:Colors.black
                           :selectedChoice == index? AppColors().textHeadingColor1:Colors.white


                        ) ,),

                        Container(
                          child: selectedChoice == index
                          ? iconApps.iconImage(imageUrl: iconApps.rightIcon,
                              imageColor:!isDarkMode ? appColors.buttonColor2:AppColors().textHeadingColor1,iconSize: Size(12, 12))
                          : Container(),
                        )
                      ],
                    ),
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
              );
            }
            ),
          ],
        )
    );

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Apply Filter",
          buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode? Colors.white:Color(0xff212327)),
          backCallback:(){
            // Navigator.push(
            //   context,
            //   SlideRightRoute(
            //       widget: HomeScreen()),
            // );
          },
          isBottomMarginRequired: false,
        ),
      );
    }



    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: Scaffold(
          backgroundColor: AppColors().appBgColor2,
          body: SafeArea(
            top: false,
            bottom: true,
            child: Stack(
              children: [
                ContainerFirst(
                  appBackgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
                  statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
                  contextCurrentView: context,
                  isSingleChildScrollViewNeed: true,
                  isFixedDeviceHeight: true,
                  appBarHeight: 60,
                  appBar: appbarView,
                  containChild:Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          serviceTag(),
                          starRating,
                          gender,
                          slider,
                          sorting,
                          priceTag(),
                          SizedBox(height: 80,)
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  bottomButton(),
                )
              ],
            ),
          ),
        )
    );
  }
}

class SortList {
  final String title;

  SortList( {
    required this.title,
  });
}

