import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/package_detail_sevices_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/package_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PackageOfferScreen extends StatefulWidget {
  @override
  _PackageOfferScreenState createState() => _PackageOfferScreenState();
}

class _PackageOfferScreenState extends State<PackageOfferScreen> {

  @override
  Widget build(BuildContext context) {

    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget package = Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      child: PackageCardWidget(
        titleTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
            color: !isDarkMode?  Colors.black :Colors.white,
            height: 0.5),
        onCardClickCallBack: (){
        Navigator.push(
          context,
          SlideRightRoute(
              widget: PackageDetailServicesScreen()),
        );
      },),
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
      appBar:  Container(
        // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: "Packages & Offers",
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
            package,
          ],
        ),
      ),
    );

  }
}

