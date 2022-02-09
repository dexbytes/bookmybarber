import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_text_field_with_error.dart';
import '../notification_bell.dart';

PreferredSizeWidget appBarWithCurve(
    {double height = kToolbarHeight,bool isDisplayActions = true,
      Function? onPress,List<Widget> action = const[],
      Color leadingIconColor = Colors.black54,
      Widget? trailingIcon,
      double appBarHeight = 300,
      String title = "Custom AppBar",
      String subtitle = "Concept",
      TextStyle titleTextStyle = const TextStyle(color: Colors.black54, fontSize: 25,fontWeight: FontWeight.w600),
      TextStyle subtitleTextStyle = const TextStyle(color: Colors.black54, fontSize: 15,fontWeight: FontWeight.w600),

    }) {

  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
    'user_name': new TextEditingController(),
    'email': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
    'user_name': new FocusNode(),
    'email': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
    'user_name': "",
    'email': "",
    'password': "",
  };



  _userNameField() {
    return Container(
      padding: EdgeInsets.only(
          left: 22,right: 22,top: 25
      ),
      child: CommonTextFieldWithError(
        focusNode: focusNodes['user_name'],
        isShowBottomErrorMsg: true,
        errorMessages: errorMessages['user_name']?.toString()??'',
        controllerT: controllers['user_name'],
        borderRadius: 15,
        inputHeight: 45,
        errorLeftRightMargin: 0,
        errorMsgHeight: 20,
        autoFocus: false,
        capitalization: CapitalizationText.sentences,
        cursorColor: Colors.grey,
        enabledBorderColor: Color(0xff323446),
        focusedBorderColor:Color(0xff323446),
        backgroundColor: Color(0xff323446),
        borderStyle: BorderStyle.none,
        inputKeyboardType: InputKeyboardTypeWithError.text,
        textInputAction: TextInputAction.next,
        inputFieldSuffixIcon: Padding(
          padding: EdgeInsets.only(right: 8.5),
          child: IconButton(
            onPressed:(){},
            icon: iconApps.iconImage(
                imageUrl: iconApps.micIcon,imageColor:Colors.white,
                iconSize: Size(20, 20)),
          ),
        ),
        inputFieldPrefixIcon: IconButton(
          onPressed:(){},
          icon:Icon(CupertinoIcons.search,color: Colors.white,size: 20,),
        ),
        hintText: "Search salon,spa and barber",
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Color(0xff828588),
        ),
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.only(left: 0),
        onTextChange: (value) {
          // _checkName(value, 'user_name', onchange: true);
        },
        onEndEditing: (value) {
          // _checkName(value, 'user_name');
          // FocusScope.of(context).requestFocus(focusNodes['email']);
        },
      ),
    );
  }


  return  PreferredSize(
      child: ClipPath(
        clipper: CustomAppBar(),
        child: Container(
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
              // NetworkImage("https://dm.henkel-dam.com/is/image/henkel/woman-getting-a-new-hairstyle-at-the-salon-wcms-us-v2"),

              AssetImage('assets/images/home_screen_image.png',),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start ,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: iconApps.iconImage(imageUrl: iconApps.lineIcon,iconSize: Size(26, 26)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Row(
                          children: [
                            NotificationBal(),
                            SizedBox(width: 14,),
                            iconApps.iconImage(imageUrl: iconApps.filterIcon,iconSize: Size(19, 19)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 72,),
              Text("Find and book best services",
                style:TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),
              ),
              _userNameField()
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight + appBarHeight));
}



class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, 260) ;


    path.quadraticBezierTo(size.width/5, size.height-1, size.width/2, size.height-2) ;

    path.quadraticBezierTo(3/4 * size.width, size.height, size.width, size.height - 25) ;


    path.lineTo(size.width, 0) ;


    return path ;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}