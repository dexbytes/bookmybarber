import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/pages/map_intregation.dart';
import 'package:base_flutter_app/src/pages/salon_detail_review_screen.dart';
import 'package:base_flutter_app/src/widgets/Review_screen_view.dart';
import 'package:base_flutter_app/src/widgets/barber_profile_company_info_row.dart';
import 'package:base_flutter_app/src/widgets/detail_address_view.dart';
import 'package:base_flutter_app/src/widgets/detail_hour_text.dart';
import 'package:base_flutter_app/src/widgets/detail_photo_row_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:readmore/readmore.dart';

class SalonDetailAboutScreen extends StatefulWidget {
  final bool isBarberInfoShow;
  final onPhotoClickCallBack;
  final bool isDataScroll;

  final collapsedheight;

  const SalonDetailAboutScreen({Key? key, this.isBarberInfoShow = false, this.onPhotoClickCallBack, this.isDataScroll = true, this.collapsedheight,}) : super(key: key);
  @override
  _SalonDetailAboutScreenState createState() => _SalonDetailAboutScreenState();
}

class _SalonDetailAboutScreenState extends State<SalonDetailAboutScreen> {

  bool value = true;
  late ScrollController _scrollController;
  bool isScrollable = true;

  @override
  void didUpdateWidget(covariant SalonDetailAboutScreen oldWidget) {
    isScrollable = widget.isDataScroll;
    setState(() {});
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }


  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState

    _scrollController = ScrollController()
      ..addListener(
              (){
            print(_scrollController.position.pixels);


            setState(() {
              isScrollable =  _scrollController.position.pixels > 0;
            });
          }
      );
  }


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


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

    Widget review = Container(
      height: 180,
        padding: EdgeInsets.only(left: 10,),
        // height: MediaQuery.of(context).size.height +250,
        child: ReviewListView(
          // onTap: (){
          //   setState(() {
          //     isMore = !isMore;
          //   });
          // },
          // isLess: isMore,
        )


    );


    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),//widget.isDataScroll && isScrollable?ClampingScrollPhysics():NeverScrollableScrollPhysics(),
      children: [

        // SeeAllTextRow(
        //     margin: EdgeInsets.only(left: 20,bottom: 0,top: 25,right: 20),
        //     leftTitle: "Basic Info",
        //     leftTitleTextStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.textHeadingColor1),
        //     isRightTextVisible: false,
        // ),
        SizedBox(height:  widget.isDataScroll?widget.collapsedheight:0,),
      widget.isBarberInfoShow?
      BarberCompanyInfoRow(
        rightTitleTextStyle:  TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color:!isDarkMode? Colors.black:Colors.white),
        leftTitleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: !isDarkMode? Colors.black:Colors.white),)
     :Column(
        children: [
          SeeAllTextRow(
            margin: EdgeInsets.only(left: 20,top: 20,bottom: 10),
            leftTitle: "About",
            isRightTextVisible: false,
            leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:Colors.white) ,
          ),
          readMoreText,
        ],
      ),

      SeeAllTextRow(
        margin: EdgeInsets.only(left: 20,bottom: 10),
        leftTitle: "Opening Hour",
        isRightTextVisible: false,
        leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:Colors.white),
      ),
      openHours,
      address,

        Padding(
          padding: EdgeInsets.only(top: 20.0,left: 13,right: 13),
          child: Divider(height: 1,thickness: 0.3,color: Colors.grey,),
        ),

      SeeAllTextRow(
          margin: EdgeInsets.only(left: 20,bottom: 15,top: 25,right: 20),
          leftTitle: "Portfolio",
          leftTitleTextStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
          rightTextCallBack:() {
            this.widget.onPhotoClickCallBack.call();
          }
      ),
      image,
        SizedBox(height:  0,),
        Padding(
          padding: EdgeInsets.only(top: 20.0,left: 13,right: 13),
          child: Divider(height: 1,thickness: 0.3,color: Colors.grey,),
        ),
        SeeAllTextRow(
            margin: EdgeInsets.only(left: 20,bottom: 15,top: 25,right: 20),
            leftTitle: "Reviews",
            leftTitleTextStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color:!isDarkMode? Colors.black:appColors.white),
            rightTextCallBack:() {
              Navigator.push(
                context,
                SlideRightRoute(
                    widget: SalonDetailReviewScreen()),
              );
            }
        ),
        review,
    ],)
      //physics: NeverScrollableScrollPhysics(),
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
    ;
  }
}