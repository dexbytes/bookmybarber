import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SalonDetailAboutScreen extends StatefulWidget {
  const SalonDetailAboutScreen({Key? key,}) : super(key: key);
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
       height: 110,
       child: Column(
         children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(bottom: 0.0),
                     child: Text("\•",style:TextStyle(fontSize: 25,color: Colors.green),),
                   ),
                   SizedBox(width: 5,),
                   Text("Monday - Friday",style: TextStyle(fontSize: 15,color: Colors.white70),),

                 ],
               ),
               SizedBox(width: 10,),
               Expanded(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Text("8:30AM - 9:30PM",style: TextStyle(fontSize: 15.5,color: Colors.white70),),
                   ],
                 ),
               )

             ],
           )
         ],
       ));



    return ContainerMenuPage(
      // bottomBarSafeAreaColor: Colors.transparent,
        contextCurrentView: context,
        // appBackgroundColor: Colors.white,
        // scrollPadding: EdgeInsets.only(bottom: 81),
        /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
        isSingleChildScrollViewNeed: false,
        isFixedDeviceHeight: true,
        appBarHeight: -1,
        appBar: Container(
          height: -1,
        ),
        containChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SeeAllTextRow(
              margin: EdgeInsets.only(left: 20,top: 25,bottom: 10),
              leftTitle: "About",
              isRightTextVisible: false,
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:Colors.white) ,
            ),
            readMoreText,
            SeeAllTextRow(
              margin: EdgeInsets.only(left: 20,bottom: 10),
              leftTitle: "Opening Hour",
              isRightTextVisible: false,
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:Colors.white),
            ),
            openHours
          ],
        )
    );
  }
}