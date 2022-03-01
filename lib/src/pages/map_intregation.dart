import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/notification_bell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_custom/google_map_custom.dart';

class MapIntregationScreen extends StatefulWidget {


  const MapIntregationScreen({Key? key,})
      : super(key: key);
  @override
  _MapIntregationScreenState createState() => _MapIntregationScreenState();
}


class _MapIntregationScreenState extends State<MapIntregationScreen>
    with TickerProviderStateMixin {
  TextEditingController inputController = new TextEditingController();

  Map<String, TextEditingController> controllers = {
    'search': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'search': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'search': "",
  };


  @override
  Widget build(BuildContext context) {

    _searchField() {
      return Container(
        padding: EdgeInsets.only(
          left: 14,right: 14,top: 0,bottom: 18
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CommonTextFieldWithError(
                focusNode: focusNodes['search'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['search']?.toString()??'',
                controllerT: controllers['search'],
                borderRadius: 12,
                inputHeight: 40,
                errorLeftRightMargin: 0,
                errorMsgHeight: 0,
                autoFocus: false,
                capitalization: CapitalizationText.sentences,
                cursorColor: Colors.grey,
                enabledBorderColor:AppColors().appBgColor2,
                focusedBorderColor:AppColors().appBgColor2,
                backgroundColor: AppColors().appBgColor2,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.text,
                textInputAction: TextInputAction.next,
                inputFieldPrefixIcon: IconButton(
                  splashRadius: 22,
                  onPressed:(){},
                  icon:Icon(CupertinoIcons.search,color: Colors.grey,size: 18,),
                ),
                hintText: "Search salon's & spa",
                hintStyle: TextStyle(
                  fontSize: 16,
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
                  FocusScope.of(context).requestFocus(focusNodes['search']);
                },
              ),
            ),
            SizedBox(width: 12,),
            Text("Cancel",
            style: TextStyle(fontSize: 16,color: Color(0xffE4B343),fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
    }


    Widget mapView = Container(
        height: 1,
        child: MainMapView()

    );

    Widget appbar = Container(
      padding: EdgeInsets.only(left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text("Your location",style: TextStyle(fontSize: 13,color: Colors.grey),),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                    Icon(Icons.location_on,color: Colors.white,size: 20,),
                      SizedBox(width: 8,),
                    Text("San Francisco City",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600),),
                      SizedBox(width: 8,),
                    Icon(CupertinoIcons.location_fill,color:  Color(0xffCCA76A),size: 18,)
                  ],)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom:3.0),
                  child: NotificationBal(
                    alignment: Alignment.bottomCenter,onTap: (){},rightIconSize: 25,),
                ),
                IconButton(
                  splashRadius: 25,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  onPressed: (){},
                  icon:iconApps.iconImage(imageUrl: iconApps.filterIcon,iconSize: Size(25, 25)),
                ) ,
              ],
            ),
          ],
        ),
    );



    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerMenuPage(
            contextCurrentView: context,
            // scrollPadding: EdgeInsets.only(bottom: 110),
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: 170,
            appBar: Container(
              color: Color(0xff323446),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  appbar,
                 SizedBox(height: 10,),
                 _searchField()
                ],
              ),
            ),
            containChild: Container(
              color: Colors.white,
              child: mapView,
            )
        )
    );
  }
}

