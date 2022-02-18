import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/book_appointment_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarberProfileTopRowWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isListTwoVisible;

  BarberProfileTopRowWidget({Key? key,
    this.onClickCardCallBack,
    this.isListTwoVisible = false
  }) : super(key: key);



  List<CategoriesList> categories = [
    CategoriesList(
      title: 'Chat',
      icon: 'assets/images/message_icon.png',
      colors: Color(0xff3885FF),
    ),
    CategoriesList(
      title: 'Call',
      icon: 'assets/images/phone_icon.png',
      colors: Color(0xffE4B343),
    ),
    CategoriesList(
      title: 'Video',
      icon: 'assets/images/video_icon.png',
      colors: Color(0xffFE457C),
    ),
    CategoriesList(
      title: 'Book',
      icon: 'assets/images/calendar_icon.png',
      colors: Color(0xff00B2AE),
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 30,right: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount:categories.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.onClickCardCallBack?.call();
             index == 3 ?Navigator.push(
                context,
                SlideRightRoute(
                    widget: BookAppointmentScreen()),
              ):Container();
            },
            child:Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)
                  ),
                  color:categories[index].colors,
                  child: Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.transparent,
                      ),
                      child:Align(
                        alignment: Alignment.center,
                        child:iconApps.iconImage(
                            imageUrl:categories[index].icon,
                            imageColor: Colors.white,
                            iconSize: Size(28, 28)
                        ),
                      )
                  ),
                ),
                SizedBox(height: 8),
                Text(categories[index].title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.grey)),
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 25,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 65
    ),
    );

  }
}

class CategoriesList {
  final String title;
  final Color colors;
  final String icon;

  CategoriesList( {
    required this.title,
    required this.colors,
    required this.icon,
  });
}

