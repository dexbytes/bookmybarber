import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/categories_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CategoriesViewAllScreen extends StatefulWidget {
  final String title;
  const CategoriesViewAllScreen({Key? key, this.title = "Salon"}) : super(key: key);
  @override
  _CategoriesViewAllScreenState createState() => _CategoriesViewAllScreenState();
}

class _CategoriesViewAllScreenState extends State<CategoriesViewAllScreen> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget salonList = Container(
      margin: EdgeInsets.only(top: 16),
        height: MediaQuery.of(context).size.height,
        child:CategoriesListView(
          onCardCallBack: (){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: SalonListViewAllScreen(
                    title: "Top services",
                  )),
            );
          },
        ),
    );


    return ContainerFirst(
      reverse: false,
      contextCurrentView: context,
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: widget.title,
            textStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
            ),
            leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
            leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 15),
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      // Container(
      //   color: appColors.appBgColor2,
      //   child: Padding(
      //     padding: EdgeInsets.only(bottom: 5.0),
      //     child: appBarWithBackArrow(
      //         isTitleVisible: true,
      //         textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
      //         isTrailingIconVisible: false,
      //         leadingIconColor:Color(0xFFCCA76A),
      //         title: widget.title,
      //         leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 10),
      //         onPress: (){
      //           Navigator.pop(context);
      //         }
      //     ),
      //   ),
      // ),
      containChild: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            salonList
          ],
        ),
      ),
    );

  }
}
