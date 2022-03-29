import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/notification_bell.dart';
import 'package:base_flutter_app/src/widgets/salon_bottomsheet_map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_map_custom/google_map_custom.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'filter_screen.dart';
import 'notification_screen.dart';

class MapIntregationScreen extends StatefulWidget {


  const MapIntregationScreen({Key? key,})
      : super(key: key);
  @override
  _MapIntregationScreenState createState() => _MapIntregationScreenState();
}


class _MapIntregationScreenState extends State<MapIntregationScreen>
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
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    _searchField() {
      return Container(
        padding: EdgeInsets.only(
          left: 14,right: 14,top: 0,bottom: 18
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
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
                enabledBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor3,
                focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor3,
                backgroundColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor3,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.text,
                textInputAction: TextInputAction.next,
                inputFieldPrefixIcon: IconButton(
                  splashRadius: 22,
                  onPressed:(){},
                  icon:Icon(CupertinoIcons.search,color: Colors.grey,size: 18,),
                ),
                hintText: "Search salon's & spa",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
            ),
            SizedBox(width: 12,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text("Cancel",
              style: TextStyle(fontSize: 16,color: Color(0xffE4B343),fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      );
    }


    Widget mapView = Container(
        height: 1,
        child: MainMapView(
          isKeyBoardOpen: MediaQuery.of(context).viewInsets.bottom != 0,
        floatingButtonClickCallBack:() {
          showSlidingBottomSheet(
              MainAppBloc.getDashboardContext,
              builder: (context) {
                return SlidingSheetDialog(
                  elevation: 8,
                  color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                  cornerRadius: 16,
                  snapSpec: const SnapSpec(
                    snap: true,
                    snappings: [0.4, 0.8],
                    positioning: SnapPositioning.relativeToAvailableSpace,
                  ),
                  builder: (context, state) {
                    return Material(
                      color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                      child: Column(
                        children: [
                          GestureDetector(
                            //highlightColor: Colors.transparent,
                            onTap: () {
                              // if (topLineClickCallBack != null) {
                              //   topLineClickCallBack(context);
                              // }
                              Navigator.pop(context);
                            },
                            child: Container(
                              color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 10),
                              width: 50,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 4,
                                indent: 1,
                                endIndent: 1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("Salons Nearby", style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: !isDarkMode ? Colors.black:AppColors().textHeadingColor1)
                              ,
                            ),
                          ),
                          SalonListBottomSheetScreen(),
                        ],
                      ),
                    );
                  },
                );
              }
          );
        }
        )


    );

    Widget appbar = Container(
      padding: EdgeInsets.only(left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                    child: Text("Your location",style: TextStyle(fontSize: 13,color: Colors.grey),),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                    Icon(Icons.location_on,
                      color: !isDarkMode? AppColors().black: Colors.blueAccent,
                      size: 20,),
                      SizedBox(width: 8,),
                    Text("San Francisco City",style: TextStyle(fontSize: 15,
                        color:!isDarkMode? AppColors().black: AppColors().white,
                        fontWeight: FontWeight.w600),),
                      SizedBox(width: 8,),
                    Icon(CupertinoIcons.location_fill,color:  Color(0xffCCA76A),size: 18,)
                  ],)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom:3.0),
                  child: NotificationBal(
                    iconDataColor: !isDarkMode? AppColors().black: AppColors().white,
                    alignment: Alignment.bottomCenter,
                    onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(
                        MainAppBloc.getDashboardContext,
                        SlideRightRoute(
                            widget: NotificationScreen()),
                      );
                    },),
                ),
                IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  onPressed: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                      MainAppBloc.getDashboardContext,
                      SlideRightRoute(
                          widget: FilterScreen()),
                    );
                  },
                  icon:iconApps.iconImage(imageUrl: iconApps.filterIcon,
                      imageColor: !isDarkMode? AppColors().black: AppColors().white,
                      iconSize: Size(20, 20)),
                ) ,
              ],
            ),
          ],
        ),
    );



    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerMenuPage(
            contextCurrentView: context,
            // scrollPadding: EdgeInsets.only(bottom: 110),
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: 170,
            appBar: Container(
              color: !isDarkMode? Colors.white :Color(0xff323446),
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
              color: Colors.white,
              child: mapView,
            )
        )
    );
  }
}

