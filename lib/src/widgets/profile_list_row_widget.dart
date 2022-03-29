import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/user_profile_raw_data_model.dart';
import 'package:base_flutter_app/src/pages/booking_screen.dart';
import 'package:base_flutter_app/src/pages/change_password_screen.dart';
import 'package:base_flutter_app/src/pages/favorite_salon_list.dart';
import 'package:base_flutter_app/src/pages/invite_friend_screen.dart';
import 'package:base_flutter_app/src/pages/sign_in_barber_screen.dart';
import 'package:base_flutter_app/src/pages/user_package_offer_screen.dart';
import 'package:base_flutter_app/src/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';


class ProfileListRowWidget extends StatelessWidget {
  final onClickListCallBack;
  final bool isFemaleListVisible;

  ProfileListRowWidget({Key? key,
    this.onClickListCallBack,
    this.isFemaleListVisible = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
        physics: NeverScrollableScrollPhysics(),
        itemCount: userProfile.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              this.onClickListCallBack?.call(index);
              print(index);
              redirectTo(index,context);
            },
            child: Container(
              padding: EdgeInsets.only(top: 12,bottom: 12),
              decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey,width:0.15,))
              ),
              child: Row(
                children: [
                  iconApps.iconImage(
                      imageUrl:userProfile[index].imageUrl,
                      iconSize: Size(30, 30),
                      imageColor:!isDarkMode? appColors.textHeadingColor2:Color(0xffE4B343)
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Html(data: userProfile[index].title,
                      style: {'html' : Style.fromTextStyle(
                           TextStyle(
                             fontSize: 16.5,
                             color: !isDarkMode? appColors.black:Colors.white,
                             fontWeight: FontWeight.w500
                           )
                      )},
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey.shade600,),
                  // Text(userProfile[index].title,
                  //   style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w400,color: Colors.white),
                  // ),
                ],
              ),
            ),
          );
        },
      );

  }
  void redirectTo(index,context) {
    if(index == 0 ){
      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: BookingScreen(isShowBackArrow: true,)),
      );
    }else if(index == 1){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: PackageOfferScreen()),
      );
    }else if(index == 2){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: FavoriteSalonScreen()),
      );
    }else if(index == 4){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: ChangePasswordScreen()),
      );
    }else if(index == 5){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: InviteFriendScreen()),
      );
    }else if(index == 7){
      alertDialog(context);
    }
  }

  void alertDialog(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return Dialog(
            insetPadding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding:EdgeInsets.only(top: 25,bottom: 25,left: 5,right: 5),
              decoration: BoxDecoration(
                  color: !isDarkMode? AppColors().white: appColors.appBgColor2,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Are you sure to logout?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: !isDarkMode? AppColors().textHeadingColor2:AppColors().textHeadingColor1
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                            "No",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:!isDarkMode? AppColors().buttonColor2: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            primary: !isDarkMode? Colors.white:appColors.appBgColor2,
                            side: BorderSide(width: 1.5,color: !isDarkMode? AppColors().buttonColor2:Color(0xffCCA76A),),
                            minimumSize: Size(70, 40)),
                      ),
                      SizedBox(width: 30,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            MainAppBloc.getDashboardContext,
                            BottomUpTransition(
                                widget: SignInScreen()),
                          );
                        },
                        child: Text(
                            "Yes",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            primary: !isDarkMode? AppColors().buttonColor2:Color(0xffCCA76A),
                            minimumSize: Size(70, 40)),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );

        });

  }
}
