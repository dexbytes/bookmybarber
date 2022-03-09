import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/barber_profile_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_time_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          enabledBorderColor: Color(0xff323446),
          focusedBorderColor:Color(0xff323446),
          backgroundColor: Color(0xff323446),
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.text,
          textInputAction: TextInputAction.done,
          inputFieldSuffixIcon: IconButton(
            splashRadius: 22,
            onPressed:(){},
            icon: iconApps.iconImage(
                imageUrl: iconApps.micIcon,imageColor:Colors.white,
                iconSize: Size(20, 20)),
          ),
          inputFieldPrefixIcon: IconButton(
            splashRadius: 22,
            onPressed:(){},
            icon:Icon(CupertinoIcons.search,color: Colors.white,size: 20,),
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
              selectedColor: AppColors().appBgColor3,
              labelTextStyle: TextStyle(
                  color: Color(0xff828588),
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
                          widget: SalonDetailScreen()),
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
              selectedColor: AppColors().appBgColor3,
              labelTextStyle: TextStyle(
                  color: Color(0xff828588),
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
                      widget: BarberProfileScreen()),
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
              selectedColor: AppColors().appBgColor3,
              labelTextStyle: TextStyle(
                  color: Color(0xff828588),
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
                      widget: SalonDetailScreen()),
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
          appBackgroundColor: AppColors().appBgColor2,
          contextCurrentView: context,
          statusBarColor: AppColors().appBgColor3,
          // scrollPadding: EdgeInsets.only(bottom: 35),
          // statusBarColor: Colors.amber,
          // bottomBarSafeAreaColor: Colors.amber,
          isSingleChildScrollViewNeed: true,
          isFixedDeviceHeight: true,
          appBarHeight: 68,
          appBar: Container(
            color:AppColors().appBgColor3,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: appBarWithBackArrow(
                  isTitleVisible: true,
                  textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
                  isTrailingIconVisible: false,
                  leadingIconColor:Color(0xFFCCA76A),
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
