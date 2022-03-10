import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';

class InviteFriendScreen extends StatefulWidget {
  final String title;
  const InviteFriendScreen({Key? key, this.title = "Salon"}) : super(key: key);
  @override
  _InviteFriendScreenState createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> {


  List<ShareList> categories = [
    ShareList(
      title: 'Friends',
      icon: 'assets/images/facebook_icon2.png',
      colors: Color(0xff14D9D4),
    ),
    ShareList(
      title: 'Message',
      icon: 'assets/images/google_plus_icon.png',
      colors: Color(0xff00FA9A),
    ),
    ShareList(
      title: 'Facebook',
      icon: 'assets/images/instagram_icon.png',
      colors: Color(0xff4267B2),
    ),

    ShareList(
      title: 'Email',
      icon: 'assets/images/messenger_icon2.png',
      colors: Color(0xffCD5C5C),
    ),
    ShareList(
      title: 'Messenger',
      icon: 'assets/images/whatsapp_icon.png',
      colors: Color(0xff006AFF),
    ),
    ShareList(
      title: 'Pinterest',
      icon: 'assets/images/paypal_icon.svg',
      colors: Color(0xffB22222),
    ),

  ];



  @override
  Widget build(BuildContext context) {

    _welcomeTextView() {
      return Container(
          margin: EdgeInsets.only(left: 25,right: 25,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Invite yours friends and\n get buzz points",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: appColors.textHeadingColor1,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Text("Give friends 5 points, once they tried\nBookMyBarber you'll also get point",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  height: 1.4
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )


      );
    }

    _dataView() {
      return Container(
          margin: EdgeInsets.only(top: 15,),
          height: 240,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20,right: 15,top: 20),
            physics: NeverScrollableScrollPhysics(),
            itemCount: categories.length ,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    print("$index",);
                    // this.onClickCardCallBack?.call(0);

                  },
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        color: appColors.appBgColor3,     //categories[index].colors,
                        child: Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:Colors.transparent,
                            ),
                            child:Align(
                              alignment: Alignment.center,
                              child:iconApps.iconImage(
                                  imageUrl:categories[index].icon,
                                  // imageColor: categories[index].colors,
                                  iconSize: Size(40, 40)
                              ),
                            )
                        ),
                      ),
                      // SizedBox(height: 10,),
                      // Text(categories[index].title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white)),
                    ],
                  ),
                ),
              );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,         //for most popular item list count : 2  & for BrandCardView count :4
              mainAxisSpacing: 30,
              crossAxisSpacing: 5,//for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
              mainAxisExtent: 80
          ),
          )
      );
    }



    return ContainerFirst(
      appBackgroundColor:  Color(0xff212327),
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: Color(0xff212327),
      statusBarColor: appColors.appBgColor2,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        color: appColors.appBgColor2,
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: appBarWithBackArrow(
              isTitleVisible: true,
              textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
              isTrailingIconVisible: false,
              leadingIconColor:Color(0xFFCCA76A),
              title: "Invite Friends",
              leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 10),
              onPress: (){
                Navigator.pop(context);
              }
          ),
        ),
      ),
      containChild: Container(
        color:  Color(0xff212327),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _welcomeTextView(),
            _dataView()
          ],
        ),
      ),
    );

  }
}

class ShareList {
  final String title;
  final Color colors;
  final String icon;

  ShareList( {
    required this.title,
    required this.colors,
    required this.icon,
  });
}
