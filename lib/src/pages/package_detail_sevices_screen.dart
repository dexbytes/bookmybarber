import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/package_detail_services_list.dart';
import 'package:base_flutter_app/src/widgets/price_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PackageDetailServicesScreen extends StatefulWidget {
  final double price;

  const PackageDetailServicesScreen({Key? key, this.price = 280.30}) : super(key: key);

  @override
  _PackageDetailServicesScreenState createState() => _PackageDetailServicesScreenState();
}

class _PackageDetailServicesScreenState extends State<PackageDetailServicesScreen> {

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Size size = MediaQuery.of(context).size;

    _topView() {
      return Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: ShaderMask(
              shaderCallback: (bound) =>LinearGradient(
                colors: [Colors.black38.withOpacity(0.2),Colors.black87.withOpacity(0.1)],
                begin:Alignment.topRight,
                end: Alignment.bottomRight,
              ).createShader(bound),
              blendMode: BlendMode.darken,
              child:CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /2.9,
                imageUrl: "https://cdn0.weddingwire.com/vendor/383440/3_2/960/jpg/img-0166_51_1044383.jpeg",
                fit:BoxFit.cover,
              ),
            )
          ),
         /* Padding(
            padding: EdgeInsets.only(top: 25,left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child:Material(
                color: Colors.transparent,
                child: IconButton(
                 onPressed: (){
                   Navigator.pop(context);
                 },
                 icon:   iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
                 ),
              )),
          ),*/
        ],
      );
    }

    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(left: 20,right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bridal Beauty Makeup",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: !isDarkMode?  Colors.black :AppColors().textHeadingColor1
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 6,
            ),
            Text("Completed Package offer till Sep 18, 2022",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors().textNormalColor8
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Women want to fell attractive. We offer timeless"
                " beauty package to accentuate their natural beauty"
                " so they can feel beautiful in every day.",
              style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color:!isDarkMode?  Colors.black :AppColors().textNormalColor6,
              ),
              textAlign: TextAlign.start,
            )
          ],
        ),
      );
    }

    Widget services = Container(
      //height: 255,
      child:Column(
        children: [
          PriceTextRow(
            rightTitle1: "\$${widget.price}",
          ),
          SizedBox(height: 15),
          PackageServicesList(),
        ],
      )
    );


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,top: 30),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Book now",
          buttonColor:  !isDarkMode? AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode?Colors.white :Color(0xff212327),),
          backCallback:(){
            // Navigator.push(
            //   context,
            //   SlideRightRoute(
            //       widget: HomeScreen()),
            // );
          },
          isBottomMarginRequired: false,
        ),
      );
    }




    Widget bottomCardView1 =  Positioned(
      top: MediaQuery.of(context).size.height/4,
      child: Container(
          padding: EdgeInsets.only(top: 0),
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color:!isDarkMode?  Colors.white :AppColors().appBgColor2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ContainerMenuPage(
            contextCurrentView: context,
            //scrollPadding: EdgeInsets.only(bottom: 60),
            /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: -1,
            appBar: Container(),
            containChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _welcomeTextView(),
                SizedBox(height: 30),
                services,
                SizedBox(height: 60),
               // bottomButton(),
              ],
            ),
          )
      ),
    );

    Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/7.9,
      child: Container(
        padding: EdgeInsets.only(top: 5),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color:!isDarkMode?  Colors.white :AppColors().appBgColor2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            _welcomeTextView(),
            SizedBox(height: 30),
            services,
            SizedBox(height: 200),

          ],
        ),
      ),
    );


    return Scaffold(
      backgroundColor: !isDarkMode?  Colors.white :AppColors().appBgColor2,
      body: SafeArea(
        top: false,
        bottom: true,
        right: false,
        left: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child:_topView(),
            ),
            ContainerFirst(
              appBackgroundColor: Colors.transparent,
              contextCurrentView: context,
              isSingleChildScrollViewNeed: true,
              isFixedDeviceHeight: true,
              appBarHeight: 60,
              appBar: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 12),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
                  ),
                ],
              ),
              containChild:Container(
               // height: size.height,
                child: Stack(
                  children: [
                    bottomCardView,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:bottomButton(),
            ),
          ],
        ),
      ),
    );

  }
}

