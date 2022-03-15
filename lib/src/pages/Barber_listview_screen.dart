import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/barbers_search_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BarbersListScreen extends StatefulWidget {
  final String title;
  const BarbersListScreen({Key? key, this.title = "Salon"}) : super(key: key);
  @override
  _BarbersListScreenState createState() => _BarbersListScreenState();
}

class _BarbersListScreenState extends State<BarbersListScreen> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget salonList = Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      child:BarberSearchGridViewWidget(),
    );


    return ContainerFirst(
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
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
