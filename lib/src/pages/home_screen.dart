import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/barber_profile_screen.dart';
import 'package:base_flutter_app/src/pages/dummy.dart';
import 'package:base_flutter_app/src/pages/notification_screen.dart';
import 'package:base_flutter_app/src/pages/salon_detail_screen.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:base_flutter_app/src/pages/serach_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/custom_appbar.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_text_list_widget.dart';
import 'package:base_flutter_app/src/widgets/custom_curve_maker_widget.dart';
import 'package:base_flutter_app/src/widgets/flexible_spacebar_widget.dart';
import 'package:base_flutter_app/src/widgets/home_card_widget.dart';
import 'package:base_flutter_app/src/widgets/notification_bell.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    double toolBarHeight = 60;

    _searchField() {
      return Container(
        padding: EdgeInsets.only(
          left: 14,
          right: 14,
          top: 0,
        ),
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: CommonTextFieldWithError(
          focusNode: focusNodes['search'],
          isShowBottomErrorMsg: true,
          errorMessages: errorMessages['search']?.toString() ?? '',
          controllerT: controllers['search'],
          borderRadius: 15,
          inputHeight: 45,
          isTextFieldEnabled: false,
          errorLeftRightMargin: 0,
          errorMsgHeight: 20,
          autoFocus: false,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor: Color(0xff323446),
          focusedBorderColor: Color(0xff323446),
          backgroundColor: Color(0xff323446),
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.text,
          textInputAction: TextInputAction.done,
          inputFieldSuffixIcon: IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: iconApps.iconImage(
                imageUrl: iconApps.micIcon,
                imageColor: Colors.white,
                iconSize: Size(20, 20)),
          ),
          inputFieldPrefixIcon: IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.white,
              size: 20,
            ),
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
          onTapCallBack: (){
          Navigator.push(
          MainAppBloc.getDashboardContext,
            BottomUpTransition(
          widget: SearchScreen()),
          );
          }),

      );
    }

    Widget topImage = ShaderMask(
      shaderCallback: (bound) => LinearGradient(
        colors: [
          Colors.black38.withOpacity(0.35),
          Colors.black87.withOpacity(0.4)
        ],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ).createShader(bound),
      blendMode: BlendMode.dstOut,
      child: ClipPath(
          clipper: CustomAppBar(),
          child: CachedNetworkImage(
            imageUrl:
                "https://media.istockphoto.com/photos/portret-of-smiling-hairdresser-in-beauty-salon-beautiful-woman-in-picture-id1136599956?k=20&m=1136599956&s=612x612&w=0&h=04RSQtVf4KJxoQkwwItqh-q8jCODxQDbc6sYeqnq34U=",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
          )),
    );

    Widget categories =
        Container(height: 150, child: CategoriesCircularWidget());

    Widget barberSpecialist = Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        child: BarberSpecialistCircularWidget());

    Widget services = Container(
        height: 150,
        child: CategoriesCircularWidget(
          isListTwoVisible: true,
        ));

    Widget categoriesTextList = Container(
        margin: EdgeInsets.only(right: 0, left: 0),
        height: 30,
        child: CategoriesTextWidget());

    Widget homeCard = Container(
        margin: EdgeInsets.only(top: 15),
        height: 180,
        child: HomeCardWidget(
          onCardClickCallBack: (){
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.push(
              MainAppBloc.getDashboardContext,
              SlideRightRoute(widget: SalonDetailScreen()),
            );
          },
        ));

    Widget homeCard2 = Container(
        margin: EdgeInsets.only(top: 15),
        height: 180,
        child: HomeCardWidget(
          isBookRowVisible: true,
          isSecondDataVisible: true,
        ));

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
                child: appBarWithCurve()),
            containChild: Container(
              height: 1,
              child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    setState(() {
                      if (direction == ScrollDirection.reverse) {
                        _visible = false;
                      } else if (direction == ScrollDirection.forward) {
                        _visible = true;
                      }
                    });
                    return true;
                  },
                  child: CustomScrollView(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          elevation: 0,
                          titleSpacing: 0,
                          title: Container(
                            height: toolBarHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "Book My Barber",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    NotificationBal(
                                      onTap: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        Navigator.push(
                                          MainAppBloc.getDashboardContext,
                                          SlideRightRoute(
                                              widget: NotificationScreen()),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      splashRadius: 25,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      onPressed: () {
                                        Navigator.push(
                                          MainAppBloc.getDashboardContext,
                                          SlideRightRoute(widget: FilterScreen()),
                                        );
                                      },
                                      icon: iconApps.iconImage(
                                          imageUrl: iconApps.filterIcon,
                                          iconSize: Size(20, 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Color(0xff212327),
                          pinned: true,
                          floating: true,
                          expandedHeight:
                              MediaQuery.of(context).size.height / 3.4,
                          collapsedHeight: _visible?
                          toolBarHeight+60
                              :toolBarHeight+10,
                          flexibleSpace: FlexibleSpaceBarWidget(
                            expandedTitleScale: 1,
                            title: _visible?_searchField():Container(),
                            titlePadding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 0,
                            ),
                            background: Stack(
                              alignment: Alignment.center,
                              children: [
                                topImage,
                                Positioned(
                                  bottom:
                                      MediaQuery.of(context).size.height / 9,
                                  child: Text(
                                    "Find and book best services",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SeeAllTextRow(
                                      leftTitle: "Top categories",
                                    ),
                                    categories,
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SeeAllTextRow(
                                      leftTitle: "Best salon",
                                      rightTextCallBack: () {
                                        Navigator.push(
                                          MainAppBloc.getDashboardContext,
                                          SlideRightRoute(
                                              widget: SalonListViewAllScreen(
                                            title: "Best salon",
                                          )),
                                        );
                                      },
                                    ),
                                    homeCard,
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SeeAllTextRow(
                                      leftTitle: "Top services",
                                    ),
                                    services,
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SeeAllTextRow(
                                      leftTitle: "Popular salon nearby",
                                      rightTextCallBack: () {
                                        Navigator.push(
                                          MainAppBloc.getDashboardContext,
                                          SlideRightRoute(
                                              widget: SalonListViewAllScreen(
                                            title: "Popular salon nearby",
                                          )),
                                        );
                                      },
                                    ),
                                    homeCard,
                                    SizedBox(
                                      height: 30,
                                    ),
                                    categoriesTextList,
                                    // SeeAllTextRow(leftTitle: "Barber Specialist",),
                                    barberSpecialist,
                                    SeeAllTextRow(
                                      leftTitle: "Popular salon nearby",
                                    ),
                                    homeCard2,
                                  ],
                                ),
                              );
                            },
                            childCount: 1,
                          ),
                        ),
                      ])),
            )));
  }
}
