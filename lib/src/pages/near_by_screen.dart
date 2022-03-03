import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/map_intregation.dart';
import 'package:base_flutter_app/src/pages/salon_detail_screen.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/home_card_widget.dart';
import 'package:base_flutter_app/src/widgets/notification_bell.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:base_flutter_app/src/widgets/slider_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'barber_profile_screen.dart';

class NearByScreen extends StatefulWidget {


  const NearByScreen({Key? key,})
      : super(key: key);
  @override
  _NearByScreenState createState() => _NearByScreenState();
}


class _NearByScreenState extends State<NearByScreen>
    with TickerProviderStateMixin {
  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'search': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'search': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'search': "",
  };


  @override
  Widget build(BuildContext context) {

    _searchField() {
      return Container(
        padding: EdgeInsets.only(
            left: 14,right: 14,top: 0,bottom: 15
        ),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['search'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['search']?.toString()??'',
          controllerT: controllers['search'],
          borderRadius: 12,
          inputHeight: 40,
          errorLeftRightMargin: 0,
          errorMsgHeight: 0,
          autoFocus: false,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor:AppColors().appBgColor2,
          focusedBorderColor:AppColors().appBgColor2,
          backgroundColor: AppColors().appBgColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.text,
          textInputAction: TextInputAction.next,
          inputFieldPrefixIcon: IconButton(
            splashRadius: 22,
            onPressed:(){},
            icon:Icon(CupertinoIcons.search,color: Colors.grey,size: 18,),
          ),
          hintText: "Search for salon, services..",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff828588),
          ),
          textStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.only(left: 0),
          onTextChange: (value) {
            // _checkName(value, 'user_name', onchange: true);
          },
          onEndEditing: (value) {
            // _checkName(value, 'user_name');
            FocusScope.of(context).requestFocus(focusNodes['search']);
          },
        ),
      );
    }


    // Widget mapView = Container(
    //     height: 1,
    //     child: MainMapView()
    //
    // );

    Widget appbar = Container(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, John Doe",style: TextStyle(fontSize: 20,
                    color:AppColors().textHeadingColor1,fontWeight: FontWeight.w700),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom:3.0),
                      child: NotificationBal(
                        alignment: Alignment.bottomCenter,onTap: (){},),
                    ),
                    IconButton(
                      splashRadius: 25,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      onPressed: (){},
                      icon:iconApps.iconImage(imageUrl: iconApps.filterIcon,iconSize: Size(20, 20)),
                    ) ,
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text("Your location",style: TextStyle(fontSize: 11.5,color: Colors.grey),),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.white,size: 18,),
                          SizedBox(width: 8,),
                          Text("San Francisco City",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),),
                        ],)
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.location_fill,color: Color(0xff00B2AE),size: 15,),
                        SizedBox(width: 4,),
                        Text("CHANGE",style:TextStyle(fontSize: 11.5,color: Color(0xff00B2AE),fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget barberSpecialist = Container(
        margin: EdgeInsets.only(top: 20),
        height: 115,
        child: BarberSpecialistCircularWidget(
          onClickCardCallBack:(){
            Navigator.push(
              MainAppBloc.getDashboardContext,
              SlideRightRoute(
                  widget: BarberProfileScreen()),
            );
          } ,)
    );

    Widget homeCard = Container(
        margin: EdgeInsets.only(top: 15 ),
        height: 180,
        child: HomeCardWidget(
          onCardClickCallBack: (){
            Navigator.push(
              MainAppBloc.getDashboardContext,
              SlideRightRoute(
                  widget: SalonDetailScreen()),
            );
          },
        )

    );

    Widget categories = Container(
        height: 150,
        child: CategoriesCircularWidget()
    );

    Widget sliderView = SliderScreen(
      urlImages: [
        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/beauty-salon-discount-landscape-flyer-template-cfd6a99eae88da5a137d959f6ee54cda_screen.jpg?ts=1561725545",
        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/hair-salon-cutting-and-coloring-sale-landscape-flyer-template-d20b166a5ed6dbaaa2326e820182e722_screen.jpg?ts=1561725533"
      ],
      initialPage: 0,
      isDotVisible: true,
      activeDotColor: Color(0xffE4B343),
      dotHeight: 8,
      dotWidth: 8,
      imageHeight: 150,
    );




    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: Scaffold(
          backgroundColor: AppColors().appBgColor2,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height /10),
            child: FloatingActionButton(
                backgroundColor: Color(0xffEE457C),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 5),
                  child:iconApps.iconImage(imageUrl: iconApps.mapIcon,iconSize: Size(30, 30)),
                ),
              onPressed: (){
                Navigator.push(
                  context,
                  SlideRightRoute(
                      widget: MapIntregationScreen()),
                );
              },
            ),
          ),
          body: ContainerMenuPage(
              contextCurrentView: context,
              // scrollPadding: EdgeInsets.only(bottom: 110),
              isSingleChildScrollViewNeed: true,
              isFixedDeviceHeight: true,
              appBarHeight: 210,
              appBar: Container(
                color: Color(0xff323446),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    appbar,
                    SizedBox(height: 10,),
                    _searchField()
                  ],
                ),
              ),
              containChild: Container(
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 12,),
                    SeeAllTextRow(leftTitle: "Barber Specialists",),
                    barberSpecialist,
                    SeeAllTextRow(leftTitle: "Popular salon nearby",
                      rightTextCallBack: (){
                        Navigator.push(
                          MainAppBloc.getDashboardContext,
                          SlideRightRoute(
                              widget: SalonListViewAllScreen(title: "Popular salon nearby",)),
                        );},
                    ),
                    homeCard,
                    SizedBox(height: 15,),
                    SeeAllTextRow(leftTitle: "Top categories",),
                    categories,
                    SeeAllTextRow(leftTitle: "Special package & offers",),
                    SizedBox(height: 15,),
                    sliderView,
                    SizedBox(height: 80,),
                  ],
                ),
              )
          ),
        )
    );
  }
}

