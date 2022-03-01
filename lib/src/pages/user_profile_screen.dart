import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/user_profile_edit_screen.dart';
import 'package:base_flutter_app/src/widgets/image_shapes_widget.dart';
import 'package:base_flutter_app/src/widgets/like_follow_row_widget.dart';
import 'package:base_flutter_app/src/widgets/notification_bell.dart';
import 'package:base_flutter_app/src/widgets/profile_list_row_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class UserProfileScreen extends StatefulWidget {
  final String userName;
  final String email;
  final String image;

  const UserProfileScreen({Key? key,
    this.userName ="Dino Waelchi",
    this.email ="Dino_waelchi@gmail.com",
    this.image ="https://pyxis.nymag.com/v1/imgs/51d/e5c/bb6f6065a9676bda462b93f24fd790368e-17-gal-gadot.rsquare.w700.jpg",
  })
      : super(key: key);
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}


class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    Widget profileImage = Container(
      margin: EdgeInsets.only(left: 10),
      height: 140,width: 140,
      child: FlutterClipPolygon(
        sides: 6,
        borderRadius: 18.0, // Defaults to 0.0 degrees
        rotate: 90.0,
        // Defaults to 0.0 degrees
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffE4B343),
              border: Border.all(width: 2)
          ),
          child: FlutterClipPolygon(
            sides: 6,
            borderRadius: 18.0, // Defaults to 0.0 degrees
            rotate: 90.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff384054),
                  border: Border.all(width: 4)
              ),
              child: FlutterClipPolygon(
                borderRadius: 18.0,
                rotate: 90.0,
                sides: 6,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Widget profileList = Container(
        margin: EdgeInsets.only(
            right: 0, left: 0),
        height: MediaQuery.of(context).size.height /1.5,
        child: ProfileListRowWidget()
    );

    Widget topSection =  Container(
      padding: EdgeInsets.only(top: 35),
      color: AppColors().appBgColor3,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NotificationBal(onTap: (){},rightIconSize: 30,),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: 25,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  onPressed: (){print("hh");},
                  icon:iconApps.iconImage(imageUrl: iconApps.settingIcon,iconSize: Size(30, 30)),
                ),
              ) ,
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileImage,
              Padding(
                padding: EdgeInsets.only(top: 15.0,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.userName,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                    Text(widget.email,style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                    SizedBox(height: 18,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          MainAppBloc.getDashboardContext,
                          SlideRightRoute(
                              widget: UserProfileEditScreen()),
                        );
                      },
                      child: Text(
                          "Edit profile"
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          primary: Color(0xff00B2AE),
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                          minimumSize: Size(130, 40)),
                    ),

                  ],
                ),
              )
            ],
          ),
          LikeFollowRowWidget(
            leftTitle: "Following",
            leftValue: 128,
            centerTitle: "Follower",
            centerValue: 640,
            rightTitle: "Likes",
            rightValue: 240,
          )
        ],
      ),
    );







    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerMenuPage(
            contextCurrentView: context,
            scrollPadding: EdgeInsets.only(bottom: 110),
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: 280,
            appBar: topSection,
            containChild:Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    profileList
                  ],
                ),
              ],
            ),
        )
    );
  }
}

