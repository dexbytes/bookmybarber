import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/barber_profile_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_screen.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_time_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'Barber_listview_screen.dart';
import 'categories_screen.dart';

class SearchScreen extends StatefulWidget {
    const SearchScreen({Key? key,

  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

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


  // final AutoCompleteTextFieldController autoCompleteTextFieldController = AutoCompleteTextFieldController();

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    _searchField() {
      return Container(
        padding: EdgeInsets.only(
          left: 14,right: 14,top: 0,
        ),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['search'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['search']?.toString()??'',
          controllerT: controllers['search'],
          borderRadius: 15,
          inputHeight: 45,
          errorLeftRightMargin: 0,
          errorMsgHeight: 20,
          autoFocus: false,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          focusedBorderColor:!isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          backgroundColor: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.text,
          textInputAction: TextInputAction.done,
          inputFieldSuffixIcon: IconButton(
            splashRadius: 22,
            onPressed:(){},
            icon: iconApps.iconImage(
                imageUrl: iconApps.micIcon,
                imageColor: !isDarkMode?Colors.grey :Colors.white,
                iconSize: Size(20, 20)),
          ),
          inputFieldPrefixIcon: IconButton(
            splashRadius: 22,
            onPressed:(){},
            icon:Icon(CupertinoIcons.search,
              color: !isDarkMode?Colors.grey :Colors.white,
              size: 20,),
          ),
          hintText: "Search salon,spa and barber",
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
            // FocusScope.of(context).requestFocus(focusNodes['search']);
          },
        ),
      );
    }

    Widget recentHistory = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllTextRow(leftTitle: "Recent Search History",isRightTextVisible: false,),
        Container(
            margin: EdgeInsets.only(left: 15,right: 5,top: 5),
            child: BookAppointmentTimeList(
              selectedColor: !isDarkMode? appColors.greyUnselected:AppColors().appBgColor3,
              backgroundColor:!isDarkMode? appColors.greyUnselected:AppColors().appBgColor3,
              labelTextStyle: TextStyle(
                  color: !isDarkMode? Colors.white:Color(0xff828588),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              reportList: [
                "RedBox Barber",
                "Looks Unisex Salon",
                "Beauty Plus Spa ",
                "Beauty Connection Spa",
                "John Barrett Salon",
              ],
            tagClickCallBack: (item){
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.push(
                      context,
                      SlideRightRoute(
                          widget: SalonListViewAllScreen(title: "Recent History",)),
                    );
            },
            //   tagClickCallBack: (item){
            //   // autoCompleteTextFieldController.keyBoardHid!();
            //   Navigator.push(
            //     MainAppBloc.getDashboardContext,
            //     SlideRightRoute(
            //         widget: SearchDataScreen()),
            //   ).then((value){
            //     print("");
            //   });
            // },
            )),
      ],
    );

    Widget topBarber = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllTextRow(leftTitle:"Top Barbers",isRightTextVisible: false,),

        Container(
            margin: EdgeInsets.only(left: 15,right: 5,top: 5),
            child: BookAppointmentTimeList(
              selectedColor: !isDarkMode? appColors.greyUnselected:AppColors().appBgColor3,
              backgroundColor:!isDarkMode? appColors.greyUnselected:AppColors().appBgColor3,
              labelTextStyle: TextStyle(
                  color: !isDarkMode?Colors.white:Color(0xff828588),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              reportList: [
                "Mike West",
                "Thomas",
                "Kevin Doyle",
                "Victor Black",
                "Edward",
                "Helen White",
                "Ben Johnson",
                "Daniel William",
              ],
              tagClickCallBack: (item){
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.push(
                  context,
                  SlideRightRoute(
                      widget: BarbersListScreen(title: "Top Barbers",)),
                );
              },
            //   tagClickCallBack: (item){
            //   // autoCompleteTextFieldController.keyBoardHid!();
            //   Navigator.push(
            //     MainAppBloc.getDashboardContext,
            //     SlideRightRoute(
            //         widget: SearchDataScreen()),
            //   ).then((value){
            //     print("");
            //   });
            // },
            )),
      ],
    );

    Widget categories = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllTextRow(leftTitle:"Categories",isRightTextVisible: false,),
        Container(
            margin: EdgeInsets.only(left: 15,right: 5,top: 5),
            child: BookAppointmentTimeList(
              selectedColor: !isDarkMode? appColors.greyUnselected:AppColors().appBgColor3,
              backgroundColor:!isDarkMode? appColors.greyUnselected:AppColors().appBgColor3,
              labelTextStyle: TextStyle(
                  color: !isDarkMode?Colors.white:Color(0xff828588),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              reportList: [
                "Salon",
                "Haircut",
                "Styling",
                "Shampoo",
                "Shaving"
                "Hair Coloring",
                "Make Up",
                "Spa",
                "HairDryer",
              ],
              tagClickCallBack: (item){
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.push(
                  context,
                  SlideRightRoute(
                      widget: CategoriesViewAllScreen(title: "Categories",)),
                );
              },
            //   tagClickCallBack: (item){
            //   // autoCompleteTextFieldController.keyBoardHid!();
            //   Navigator.push(
            //     MainAppBloc.getDashboardContext,
            //     SlideRightRoute(
            //         widget: SearchDataScreen()),
            //   ).then((value){
            //     print("");
            //   });
            // },
            )),
      ],
    );


    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child:ContainerFirst(
        appBackgroundColor:!isDarkMode?Colors.white:AppColors().appBgColor2,
          contextCurrentView: context,
          statusBarColor: !isDarkMode?Colors.white:AppColors().appBgColor3,
          // scrollPadding: EdgeInsets.only(bottom: 35),
          // statusBarColor: Colors.amber,
          // bottomBarSafeAreaColor: Colors.amber,
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          appBarHeight: 68,
          appBar: Container(
            color:!isDarkMode?Colors.white:AppColors().appBgColor3,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: appBarWithBackArrow(
                  backgroundColor:!isDarkMode?Colors.white:AppColors().appBgColor3,
                  isTitleVisible: true,
                  textStyle: TextStyle(fontSize: 22,
                      color:!isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
                      fontWeight: FontWeight.w600),
                  isTrailingIconVisible: false,
                  leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
                  title: "Search",
                  leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0),
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
            ),
          ),
          containChild: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              _searchField(),

              // AutoCompleteTextField(isTextFieldEnabled: true,autoCompleteTextFieldController: autoCompleteTextFieldController,),
              SizedBox(height: 10,),
              recentHistory,
              SizedBox(height: 20,),
              topBarber ,
              SizedBox(height: 20,),
              categories
            ],
          ),
        ),

    );
  }
}
