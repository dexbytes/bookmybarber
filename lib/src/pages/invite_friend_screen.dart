import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
      icon: 'assets/images/message_icon_green.png',
    ),
    ShareList(
      title: 'Message',
      icon: 'assets/images/gmail.png',
    ),
    ShareList(
      title: 'Facebook',
      icon: 'assets/images/instagram_icon.png',
    ),

    ShareList(
      title: 'Email',
      icon: 'assets/images/facebook_icon2.png',
    ),
    ShareList(
      title: 'Messenger',
      icon: 'assets/images/messenger_icon2.png',
    ),
    ShareList(
      title: 'Pinterest',
      icon: 'assets/images/whatsapp_icon.png',
    ),

  ];



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

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
                  color: !isDarkMode? Colors.black:appColors.textHeadingColor1,
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
                        color: !isDarkMode? Colors.white: appColors.appBgColor3,     //categories[index].colors,
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
                                  // imageColor:Color(0xff25D366),
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
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      reverse: false,
      contextCurrentView: context,
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
            title: "Invite Friend",
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
  final String icon;

  ShareList( {
    required this.title,
    required this.icon,
  });
}
