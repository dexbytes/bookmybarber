import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/appbar/custom_appbar.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_text_list_widget.dart';
import 'package:base_flutter_app/src/widgets/home_card_widget.dart';
import 'package:base_flutter_app/src/widgets/notification_bell.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
    'user_name': new TextEditingController(),
    'email': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
    'user_name': new FocusNode(),
    'email': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
    'user_name': "",
    'email': "",
    'password': "",
  };


  @override
  Widget build(BuildContext context) {

    _userNameField() {
      return Container(
        padding: EdgeInsets.only(
            left: 14,right: 14,top: 0,
        ),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['user_name'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['user_name']?.toString()??'',
          controllerT: controllers['user_name'],
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
          textInputAction: TextInputAction.next,
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
            FocusScope.of(context).requestFocus(focusNodes['user_name']);
          },
        ),
      );
    }

    Widget categories = Container(
        height: 150,
        child: CategoriesCircularWidget()
    );

    Widget barberSpecialist = Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        child: BarberSpecialistCircularWidget()
    );

    Widget services = Container(

        height: 150,
        child: CategoriesCircularWidget(
          isListTwoVisible: true,
        )
    );

    Widget categoriesTextList = Container(
        margin: EdgeInsets.only(
            right: 0, left: 0),
        height: 30,
        child: CategoriesTextWidget()
    );

    Widget homeCard = Container(
        margin: EdgeInsets.only(top: 15 ),
        height: 185,
        child: HomeCardWidget()

    );
    Widget homeCard2 = Container(
        margin: EdgeInsets.only(top: 15 ),
        height: 185,
        child: HomeCardWidget(
          isBookRowVisible: true,
          isSecondDataVisible: true,)

    );



    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerMenuPage(
            contextCurrentView: context,
            // scrollPadding: EdgeInsets.only(bottom: 110),
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: -1,
            appBar: Container(
                color: Color(0xff212327),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 3,
                child:appBarWithCurve()
            ),
            containChild: Container(
              height: 1,
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                leading: IconButton(
                  onPressed: (){},
                  icon:iconApps.iconImage(imageUrl: iconApps.lineIcon,iconSize: Size(26, 26)),
                ) ,
                titleSpacing: 0,
                title:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       NotificationBal(onTap: (){},),
                        IconButton(
                          splashRadius: 25,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          onPressed: (){},
                          icon:iconApps.iconImage(imageUrl: iconApps.filterIcon,iconSize: Size(20, 20)),
                        ) ,
                      ],
                   ),
                backgroundColor: Color(0xff212327),
                pinned: true,
                floating: false,
                expandedHeight: MediaQuery.of(context).size.height /3.4,
                collapsedHeight: MediaQuery.of(context).size.height/7,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  title: _userNameField(),
                  titlePadding: EdgeInsets.only(left: 16,right: 16,bottom: 8,),
                  background:Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Container(
                        child: ClipPath(
                          clipper: CustomAppBar(),
                          child: Container(
                            child: Image( image:AssetImage('assets/images/home_screen_image.png',),
                              fit: BoxFit.cover,)
                            ),
                        ),
                      ),
                      Positioned(
                        bottom:MediaQuery.of(context).size.height /9,
                        child: Text("Find and book best services",
                          style:TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),

                  // child: Image( image:AssetImage('assets/images/home_screen_image.png',),fit: BoxFit.cover,)),
                ),
              ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                        margin: EdgeInsets.only(bottom: 90),
                        color: Color(0xff212327),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            SeeAllTextRow(leftTitle: "Top categories",),
                            categories,
                            SizedBox(height: 15,),
                            SeeAllTextRow(leftTitle: "Best salon",),
                            homeCard,
                            SizedBox(height: 30,),
                            SeeAllTextRow(leftTitle: "Top services",),
                            services,
                            SizedBox(height: 15,),
                            SeeAllTextRow(leftTitle: "Popular salon nearby",),
                            homeCard,
                            SizedBox(height: 30,),
                            categoriesTextList,
                            // SeeAllTextRow(leftTitle: "Barber Specialist",),
                            barberSpecialist,
                            SeeAllTextRow(leftTitle: "Popular salon nearby",),
                            homeCard2,
                          ],
                        ),
                      );
                },
                childCount: 1,
              ),
          ),

              // Container(
              //   margin: EdgeInsets.only(top: 0),
              //   color: Color(0xff212327),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       SizedBox(height: 30,),
              //       SeeAllTextRow(leftTitle: "Top categories",),
              //       categories,
              //       SizedBox(height: 15,),
              //       SeeAllTextRow(leftTitle: "Best salon",),
              //       homeCard,
              //       SizedBox(height: 30,),
              //       SeeAllTextRow(leftTitle: "Top services",),
              //       services,
              //       SizedBox(height: 15,),
              //       SeeAllTextRow(leftTitle: "Popular salon nearby",),
              //       homeCard,
              //       SizedBox(height: 30,),
              //       SeeAllTextRow(leftTitle: "Barber Specialist",),
              //       barberSpecialist,
              //       SizedBox(height: 10,),
              //       SeeAllTextRow(leftTitle: "Popular salon nearby",),
              //       homeCard2,
              //     ],
              //   ),
              // )
        ]
        ),
            )
        )
    );
  }
}

