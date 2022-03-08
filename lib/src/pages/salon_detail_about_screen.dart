import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/map_intregation.dart';
import 'package:base_flutter_app/src/widgets/barber_profile_company_info_row.dart';
import 'package:base_flutter_app/src/widgets/detail_address_view.dart';
import 'package:base_flutter_app/src/widgets/detail_hour_text.dart';
import 'package:base_flutter_app/src/widgets/detail_photo_row_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SalonDetailAboutScreen extends StatefulWidget {
  final bool isBarberInfoShow;
  final bool isDataScroll;
  final onPhotoClickCallBack;

  const SalonDetailAboutScreen({Key? key, this.isBarberInfoShow = false, this.onPhotoClickCallBack, this.isDataScroll = true,}) : super(key: key);
  @override
  _SalonDetailAboutScreenState createState() => _SalonDetailAboutScreenState();
}

class _SalonDetailAboutScreenState extends State<SalonDetailAboutScreen> {

  bool value = true;

  @override
  Widget build(BuildContext context) {


    Widget readMoreText = Container(
      padding: EdgeInsets.only(left: 20,right: 15),
       height: 110,
       child: ReadMoreText(
       'RedBox Barber salon is one of the most powerful brands in the hair & beauty care sector in Northern India,'
       ' that has given hairstyling a new horizon. Our barbers are professionally trained, one of them holds international certifications',
       // 'international certifications. They’re always updated with the latest trend in men’s grooming by'
       // ' participating in professional training and workshops conducted by International barbers ',
      style:TextStyle(fontSize: 15,
        fontWeight: FontWeight.w500,
        color:Color(0xff828588),
        wordSpacing: 1

      ),
      trimLines: 4,
      colorClickableText:  Color(0xffCCA76A),
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText:  'Less',

    ));

    Widget openHours = Container(
      padding: EdgeInsets.only(left: 20,right: 15),
       height: 70,
       child:Column(
         children: [
           DetailHourView(),
           DetailHourView(
             days: "Saturday - Sunday",
             time: "9:00 AM - 1:00PM",
             padding:EdgeInsets.only(right: 20),

           ),

         ],
       )
    );



    Widget address = Container(
      margin: EdgeInsets.only(left: 10,right: 15),
       height: 100,
       child: DetailAddressView(
         onMapCallBack: (){
           Navigator.push(
             context,
             SlideRightRoute(
                 widget: MapIntregationScreen()),
           );
         },
       ));


    Widget image = Container(
      margin: EdgeInsets.only(left: 14),
       height: 80,
       child: DetailPhotoView());




    return ContainerMenuPage(
      // bottomBarSafeAreaColor: Colors.transparent,
        contextCurrentView: context,
        // appBackgroundColor: Colors.white,
        scrollPadding: EdgeInsets.only(bottom: 80),
        /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
        isSingleChildScrollViewNeed: widget.isDataScroll,
        isFixedDeviceHeight: false,
        appBarHeight: -1,
        appBar: Container(
          height: -1,
        ),
        containChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            widget.isBarberInfoShow? BarberCompanyInfoRow():Column(
              children: [
                SeeAllTextRow(
                  margin: EdgeInsets.only(left: 20,top: 25,bottom: 10),
                  leftTitle: "About",
                  isRightTextVisible: false,
                  leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:Colors.white) ,
                ),
                readMoreText,
              ],
            ),

             SeeAllTextRow(
              margin: EdgeInsets.only(left: 20,bottom: 10),
              leftTitle: "Opening Hour",
              isRightTextVisible: false,
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:Colors.white),
            ),
            openHours,
            address,

            SeeAllTextRow(
              margin: EdgeInsets.only(left: 20,bottom: 10,top: 25,right: 20),
              leftTitle: "Photos",
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:Colors.white),
              rightTextCallBack:() {
                this.widget.onPhotoClickCallBack.call();
              }
            ),
            image,
            SizedBox(height: 0,)
          ],
        )
    );
  }
}