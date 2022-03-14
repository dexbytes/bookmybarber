import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/sign_in_barber_screen.dart';
import 'package:base_flutter_app/src/widgets/already_have_account_row.dart';
import 'package:base_flutter_app/src/widgets/connet_to_social_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    Widget googleCard = ConnectCard(
      color: Color(0xffFB6C56),);



    Widget facebookCard = ConnectCard(
      sizeBoxWidth: 19,
      color: Color(0xff3885FF),
      imageIcon: iconApps.iconImage(imageUrl: iconApps.facebookIcon,imageColor: Colors.white,iconSize: Size(25, 25)),
      text: "FaceBook",

    );
    Widget topIcon = Container(
      height: 75,
      width: 75,
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/signup_signin_image.png'),
          fit: BoxFit.cover
        )
      ),
    );

    Widget titleText = Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      height: 80,
      child: Text("Book an Appointment for Salon, Spa & Barber.",
      style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),
      ),
    );

    Widget background =  ShaderMask(
      shaderCallback: (bound) =>LinearGradient(
        colors: [Colors.black38.withOpacity(0.2),Colors.black87],
        begin:Alignment.center,
        end: Alignment.bottomCenter,
      ).createShader(bound),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/736x/11/64/58/116458ad3a32cb261cd88428a17058f6.jpg'),
                fit: BoxFit.cover,
            )
        ),

      ),
    );



    return ContainerFirst(
      bottomBarSafeAreaColor: appColors.appBgColor2,
      contextCurrentView: context,
      isOverLayStatusBar: true,
      // appBackgroundColor: Colors.white,
      // scrollPadding: EdgeInsets.only(bottom: 81),
      /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: false,
      isFixedDeviceHeight: true,
      appBarHeight: -1,
      appBar: Container(
        height: -1,
      ),
      containChild: Stack(
        children: [
          background,
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topIcon,
                    SizedBox(height: 20,),
                    titleText,
                    SizedBox(height: 20,),
                    googleCard,
                    SizedBox(height: 25,),
                    facebookCard,
                    SizedBox(height: 30,),
                    AlreadyHaveAccountRow(
                      signInCallBack: (){
                        Navigator.push(
                          context,
                          SlideRightRoute(
                              widget: SignInScreen()),
                        );
                      },
                    )

                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}