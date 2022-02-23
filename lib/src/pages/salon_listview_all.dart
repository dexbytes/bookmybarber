import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/Salon_list_view.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';

class SalonListViewAllScreen extends StatefulWidget {
  @override
  _SalonListViewAllScreenState createState() => _SalonListViewAllScreenState();
}

class _SalonListViewAllScreenState extends State<SalonListViewAllScreen> {

  @override
  Widget build(BuildContext context) {

    // _welcomeTextView() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: 5,
    //         left: 25,
    //         right: 25,
    //         bottom: MediaQuery.of(context).size.height/ 10
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text("Forgot Password",
    //           style: TextStyle(
    //               fontSize: 30,
    //               fontWeight: FontWeight.w700,
    //               color: AppColors().textHeadingColor1
    //           ),
    //           textAlign: TextAlign.start,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Text("Please enter your email address. You will receive a code to create a new password\nvia email.",
    //           style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.w500,
    //               color: AppColors().textNormalColor6.withOpacity(0.8)
    //           ),
    //           textAlign: TextAlign.center,
    //         )
    //       ],
    //     ),
    //   );
    // }




    // bottomButton(){
    //   return Container(
    //     margin: EdgeInsets.only(left: 28,right: 28,top: 30),
    //     child:CommonButton(
    //       buttonHeight: 50,
    //       buttonName: "Reset password",
    //       buttonColor:Color(0xFFCCA76A),
    //       textStyle: TextStyle(fontSize: 18,
    //         fontWeight: FontWeight.w600,
    //         color: Color(0xff212327),),
    //       backCallback:(){},
    //       isBottomMarginRequired: false,
    //     ),
    //   );
    // }

    Widget salonList =Container(
        height: MediaQuery.of(context).size.height,
        child: SalonDataListView()
    );


    return ContainerFirst(
      appBackgroundColor:  Color(0xff212327),
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: Color(0xff212327),
      statusBarColor: Color(0xff212327),
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 62,
      appBar: Container(
        color: Color(0xff212327),
        child: appBarWithBackArrow(
            isTitleVisible: true,
            textStyle: TextStyle(fontSize: 22,color: AppColors().textHeadingColor1,fontWeight: FontWeight.w600),
            isTrailingIconVisible: false,
            leadingIconColor:Color(0xFFCCA76A),
            title: "Salons ",
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      containChild: Container(
        color:  Color(0xff212327),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            salonList
          ],
        ),
      ),
    );

  }
}

