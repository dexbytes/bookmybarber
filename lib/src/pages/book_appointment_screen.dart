import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/price_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class BookAppointmentScreen extends StatefulWidget {
  final double price;

  const BookAppointmentScreen({Key? key, this.price = 280.30}) : super(key: key);

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int selectValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _topView() {
      return Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              child: ShaderMask(
                shaderCallback: (bound) =>LinearGradient(
                  colors: [Colors.black38.withOpacity(0.2),Colors.black87.withOpacity(0.1)],
                  begin:Alignment.topRight,
                  end: Alignment.bottomRight,
                ).createShader(bound),
                blendMode: BlendMode.darken,
                child:CachedNetworkImage(
                  height: MediaQuery.of(context).size.height /2.9,
                  imageUrl: "https://cdn6.dissolve.com/p/D2115_184_474/D2115_184_474_1200.jpg",
                  fit:BoxFit.cover,
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 45,left: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child:Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
                  ),
                )),
          ),
        ],
      );
    }

    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(left: 20,right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gender",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors().textHeadingColor1
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Radio<int>(
                    value: 0,
                    groupValue: selectValue,
                    activeColor: Color(0xffE4B343),
                    onChanged: (value) =>setState(()=>selectValue = value! )
                ),
                Text("Male",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                SizedBox(width: 20,),
                Radio<int>(
                    value: 1,
                    activeColor: Color(0xffE4B343),
                    focusColor: Colors.white,
                    groupValue: selectValue,
                    onChanged: (value) =>setState(()=>selectValue = value! )
                ),
                Text("Female",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: selectValue == 1?Color(0xffE4B343):Colors.white),)
              ],
            )
          ],
        ),
      );
    }

    Widget services = Container(
        height: 255,
        child:Column(
          children: [
            PriceTextRow(
              rightTitle1: "\$${widget.price}",
            ),
            SizedBox(height: 15),
          ],
        )
    );


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,top: 30),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Book now",
          buttonColor: AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),
          backCallback:(){
            // Navigator.push(
            //   context,
            //   SlideRightRoute(
            //       widget: HomeScreen()),
            // );
          },
          isBottomMarginRequired: false,
        ),
      );
    }




    Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/3.4,
      child: Container(
          padding: EdgeInsets.only(top: 25),
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: AppColors().appBgColor2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ContainerMenuPage(
            contextCurrentView: context,
            scrollPadding: EdgeInsets.only(bottom: 60),
            /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: -1,
            appBar: Container(),
            containChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _welcomeTextView(),
                SizedBox(height: 30),
                services,
                SizedBox(height: 20),
                bottomButton(),
              ],
            ),
          )
      ),
    );




    return ContainerMenuPage(
      contextCurrentView: context,
      // scrollPadding: EdgeInsets.only(bottom: 81),
      /* statusBarColor: Colors.amber,
        bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: false,
      isFixedDeviceHeight: true,
      appBarHeight: -1,
      appBar: Container(),
      containChild:Container(
        height: size.height,
        width: size.height,
        child: Stack(
          children: [
            _topView(),
            bottomCardView
          ],
        ),
      ),

    );
  }
}

