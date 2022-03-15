import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class PackageServicesList extends StatelessWidget {

  PackageServicesList({Key? key,}) : super(key: key);

  List<PackageServicesRawData> services = [
    PackageServicesRawData(
        title: 'HairStyling',
    ),
    PackageServicesRawData(
        title: 'Hair color',
    ),
    PackageServicesRawData(
        title: 'Corner Lashes',
    ),
    PackageServicesRawData(
        title: 'Nail',
    ),
    PackageServicesRawData(
        title: 'Make up',
    ),
    PackageServicesRawData(
        title: 'Retouch',
    ),
    PackageServicesRawData(
        title: 'Body Glowing',
    ),
    PackageServicesRawData(
        title: 'Facial',
    ),
    PackageServicesRawData(
        title: 'Eyebrow',
    ),
    PackageServicesRawData(
        title: 'Spa',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            physics: NeverScrollableScrollPhysics(),
            itemCount: services.length ,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  // print("$index",);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 25,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      iconApps.iconImage(imageUrl: iconApps.rightIcon,imageColor:Color(0xffCCA76A),iconSize: Size(13, 13)),
                      SizedBox(width: 10,),
                      Text(services[index].title,
                      style: TextStyle(fontSize: 16,color: !isDarkMode?  Colors.black: Colors.white,fontWeight: FontWeight.w600,),
                      )
                    ],
                  )
                ),
              );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,         //for most popular item list count : 2  & for BrandCardView count :4
              mainAxisSpacing: 2,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
              crossAxisSpacing: 5,
              mainAxisExtent: 40
          ),
          ),
        ),
      ],
    );
  }
}


class PackageServicesRawData {
  final String title;

  PackageServicesRawData( {
    required this.title,
  });
}


