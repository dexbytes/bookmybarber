import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/user_profile_raw_data_model.dart';
import 'package:base_flutter_app/src/pages/sign_in_barber_screen.dart';
import 'package:base_flutter_app/src/pages/user_package_offer_screen.dart';
import 'package:base_flutter_app/src/values/app_color.dart';
import 'package:base_flutter_app/src/widgets/package_card_widget.dart';
import 'package:flutter/material.dart';
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
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 10,right: 10,),
        physics: NeverScrollableScrollPhysics(),
        itemCount: userProfile.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              this.onClickListCallBack?.call(index);
              print(index);
              redirectTo(index);
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
                      iconSize: Size(30, 30)
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Html(data: userProfile[index].title,
                      style: {'html' : Style.fromTextStyle(
                           TextStyle(
                             fontSize: 16.5,
                             color: Colors.white,
                             fontWeight: FontWeight.w500
                           )

                          // fontSize:FontSize.large,
                          // lineHeight: LineHeight(0.6),
                          // color: Colors.white,
                          // height: 20,
                          // width: MediaQuery.of(context).size.width,
                          // fontWeight: FontWeight.w500,
                          // padding: EdgeInsets.all(0),
                          // margin: EdgeInsets.all(0),
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
  void redirectTo(index) {
    if(index == 1 ){
      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: PackageOfferScreen()),
      );
    }else if(index == 8){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: SignInScreen()),
      );
    }
  }
}
