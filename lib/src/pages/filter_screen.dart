import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_time_widget.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';


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
  String selectedChoice = "";

  @override
  Widget build(BuildContext context) {


    Widget appbarView = Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      color: AppColors().appBgColor3,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){},
                child: Text('Cancel',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffE4B343)),)),
            Text('Filters',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
            InkWell(
                onTap: (){},
                child: Text('Reset',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:  Color(0xffE4B343)),)),
          ],
        ),
      )
    );

    tag(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.0,left: 12,top: 20),
            child: Text("Services",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors().textHeadingColor1)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:12,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                selectedColor: Color(0xffCCA76A),
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
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors().textHeadingColor1)),
            SizedBox(height: 8,),
            Row(
              children: [
                StarRatingBar(
                  unratedColor: Colors.grey,
                  iconCount: 5,
                  iconSize: 28,
                  removeViewCount: true,
                  itemRatingTextStyle: TextStyle(color: Colors.white,fontSize: 13.5,fontWeight: FontWeight.w500,),
                  spaceWithStar: 20,
                ),
                Text("Star",
                    style: TextStyle(color: Colors.white,fontSize: 13.5,fontWeight: FontWeight.w500,),),
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
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors().textHeadingColor1)),
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
                          activeColor: Color(0xffE4B343),
                          onChanged: (value) =>setState(()=>selectValue = value!),
                        ),
                      ),
                      Text("Man",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                    ],
                  ),
                  // Text("Man",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio<int>(
                            value: 1,
                            activeColor: Color(0xffE4B343),
                            focusColor: Colors.white,

                            groupValue: selectValue,
                            onChanged: (value) =>setState(()=>selectValue = value! )
                        ),
                      ),
                      Text("Woman",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: selectValue == 1?Color(0xffE4B343):Colors.white),),
                    ],
                  ),
               Row(
                 children: [
                   Transform.scale(
                        scale: 1.1,
                        child: Radio<int>(
                            value: 2,
                            activeColor: Color(0xffE4B343),
                            focusColor: Colors.white,

                            groupValue: selectValue,
                            onChanged: (value) =>setState(()=>selectValue = value! )
                        ),
                      ),
                   Text("Other",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: selectValue == 2?Color(0xffE4B343):Colors.white),)
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
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors().textHeadingColor1)),
            ),
            SizedBox(height: 18,),
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
                  activeTickMarkColor:AppColors().textHeadingColor1,
                  activeTrackColor: AppColors().textHeadingColor1,
                  inactiveTickMarkColor: Colors.transparent,
                  thumbColor:AppColors().textHeadingColor1,
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
            padding: EdgeInsets.only(bottom: 5.0,top: 20),
            child: Text("Services",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors().textHeadingColor1)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:10,),
              padding: EdgeInsets.zero,
              child: BookAppointmentTimeList(
                selectedColor: Color(0xffCCA76A),
                padding: EdgeInsets.only(left: 20,right: 20),
                isSecondColorShow: false,
                reportList: [
                  "\$", "\$\$", "\$\$\$",
                ],)),
        ],
      );
    }

    subtitleText(String e) {
      return Container(
        child: Text("$e",
          style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),
        ),
      );
    }

    Widget sort = Container(
      height: 150,
        padding: EdgeInsets.only(right: 50,top: 15,left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Sort by",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors().textHeadingColor1)),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title:Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.subtitle.map((e) => subtitleText(e)).toList(),
                ),
              )
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
          buttonColor: AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),
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
        child: ContainerFirst(
          appBackgroundColor: AppColors().appBgColor2,
          statusBarColor: AppColors().appBgColor3,
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
                children: [
                  tag(),
                  starRating,
                  gender,
                  slider,
                  priceTag(),
                ],
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child:  bottomButton(),
            )
            ],
          ),
        )
    );
  }
}

