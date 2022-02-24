import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/user_profile_raw_data_model.dart';
import 'package:base_flutter_app/src/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ProfileListRowWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isFemaleListVisible;

  ProfileListRowWidget({Key? key,
    this.onClickCardCallBack,
    this.isFemaleListVisible = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appBgColor2,
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 10,right: 10),
          physics: NeverScrollableScrollPhysics(),
          itemCount: userProfile.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(top: 12,bottom: 12),
              decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey,width:0.15,))
              ),
              child: Expanded(
                flex: 15,
                child: Row(
                  children: [
                    iconApps.iconImage(
                        imageUrl:userProfile[index].imageUrl,
                        iconSize: Size(30, 30)
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Html(data: userProfile[index].title,
                        style: {'html' : Style(
                            fontSize:FontSize.xLarge,
                            lineHeight: LineHeight(0.6),
                            color: Colors.white,
                            height: 20,
                            width: MediaQuery.of(context).size.width,
                            fontWeight: FontWeight.w400,
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(0),
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
        ),
      ),
    );
  }
}
