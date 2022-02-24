import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/package_detail_sevices_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/package_card_widget.dart';
import 'package:flutter/material.dart';

class PackageOfferScreen extends StatefulWidget {
  @override
  _PackageOfferScreenState createState() => _PackageOfferScreenState();
}

class _PackageOfferScreenState extends State<PackageOfferScreen> {

  @override
  Widget build(BuildContext context) {

    Widget package = Container(
      height: MediaQuery.of(context).size.height,
      child: PackageCardWidget(
        onCardClickCallBack: (){
        Navigator.push(
          context,
          SlideRightRoute(
              widget: PackageDetailServicesScreen()),
        );
      },),
    );


    return ContainerFirst(
      appBackgroundColor:  Color(0xff212327),
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: Color(0xff212327),
      statusBarColor: Color(0xff212327),
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 65,
      appBar: Container(
        color: Color(0xff212327),
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            leadingIconColor:Color(0xFFCCA76A),
            title: "Package & Offers",
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors().textHeadingColor1
            ),
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

