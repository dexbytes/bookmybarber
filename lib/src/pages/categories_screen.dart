import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/salon_listview_all.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/categories_listview_widget.dart';
import 'package:flutter/material.dart';

class CategoriesViewAllScreen extends StatefulWidget {
  final String title;
  const CategoriesViewAllScreen({Key? key, this.title = "Salon"}) : super(key: key);
  @override
  _CategoriesViewAllScreenState createState() => _CategoriesViewAllScreenState();
}

class _CategoriesViewAllScreenState extends State<CategoriesViewAllScreen> {

  @override
  Widget build(BuildContext context) {
    Widget salonList = Container(
      margin: EdgeInsets.only(top: 20),
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
      appBackgroundColor:  Color(0xff212327),
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: Color(0xff212327),
      statusBarColor: appColors.appBgColor2,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        color: appColors.appBgColor2,
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: appBarWithBackArrow(
              isTitleVisible: true,
              textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
              isTrailingIconVisible: false,
              leadingIconColor:Color(0xFFCCA76A),
              title: widget.title,
              leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 10),
              onPress: (){
                Navigator.pop(context);
              }
          ),
        ),
      ),
      containChild: Container(
        color:  Color(0xff212327),
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
