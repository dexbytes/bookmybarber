import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/Salon_list_view.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';

class SalonListViewAllScreen extends StatefulWidget {
  final String title;
  const SalonListViewAllScreen({Key? key, this.title = "Salon"}) : super(key: key);
  @override
  _SalonListViewAllScreenState createState() => _SalonListViewAllScreenState();
}

class _SalonListViewAllScreenState extends State<SalonListViewAllScreen> {

  @override
  Widget build(BuildContext context) {
    Widget salonList =Container(
        height: MediaQuery.of(context).size.height,
        child: SalonDataListView()
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
            textStyle: TextStyle(fontSize: 20,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
            isTrailingIconVisible: false,
            leadingIconColor:Color(0xFFCCA76A),
            title: widget.title,
            onPress: (){
              Navigator.pop(context);
            }
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

