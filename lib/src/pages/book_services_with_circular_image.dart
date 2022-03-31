import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/book_services_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BookServicesWithImage extends StatefulWidget {
  final String title;
  final serviceList;
  final  onAddClickCallBack;
  const BookServicesWithImage({Key? key, this.title = "Salon", this.serviceList, this.onAddClickCallBack}) : super(key: key);
  @override
  _BookServicesWithImageState createState() => _BookServicesWithImageState();
}

class _BookServicesWithImageState extends State<BookServicesWithImage> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Widget salonList = Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      child:BookServicesGridViewWidget(
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: !isDarkMode? Colors.black:Colors.white),

        onAddClickCallBack: (selectedService,price){
          widget.onAddClickCallBack.call(selectedService,price);
          Navigator.pop(context);
        },
        serviceList: widget.serviceList,
        isSubtitleVisible: true,),
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