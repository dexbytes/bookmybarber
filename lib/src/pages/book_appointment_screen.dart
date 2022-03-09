import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/book_appointment_with_time.dart';
import 'package:base_flutter_app/src/widgets/book_appointment_row_view.dart';
import 'package:base_flutter_app/src/widgets/price_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class BookAppointmentScreen extends StatefulWidget {
  final double price;

  const BookAppointmentScreen({Key? key, this.price = 00.00}) : super(key: key);

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
                  colors: [Colors.black38.withOpacity(0.45),Colors.black87.withOpacity(0.1)],
                  begin:Alignment.topRight,
                  end: Alignment.bottomRight,
                ).createShader(bound),
                blendMode: BlendMode.darken,
                child:CachedNetworkImage(
                  // height: MediaQuery.of(context).size.height /2.65,
                  width: MediaQuery.of(context).size.width,
                  imageUrl:selectValue == 0 ?
                   "https://cdn6.dissolve.com/p/D2115_184_474/D2115_184_474_1200.jpg"
                  :"https://thumbs.dreamstime.com/b/professional-hairdresser-scissors-beautiful-female-customer-deciding-what-haircut-to-do-looking-phone-changing-140595940.jpg",
                  fit:BoxFit.cover,
                ),
              )
          ),
        ],
      );
    }

    _welcomeTextView() {
      return Container(
        margin: EdgeInsets.only(left: 8,right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text("Gender",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors().textHeadingColor1
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey.withOpacity(0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Radio<int>(
                        value: 0,
                        groupValue: selectValue,
                        activeColor: Color(0xffE4B343),
                        onChanged: (value) =>setState(()=>selectValue = value!),
                    ),
                  ),
                  Text("Male",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: selectValue == 0?Color(0xffE4B343):Colors.white),),
                  SizedBox(width: 70,),
                  Transform.scale(
                    scale: 1.3,
                    child: Radio<int>(
                        value: 1,
                        activeColor: Color(0xffE4B343),
                        focusColor: Colors.white,

                        groupValue: selectValue,
                        onChanged: (value) =>setState(()=>selectValue = value! )
                    ),
                  ),
                  Text("Female",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: selectValue == 1?Color(0xffE4B343):Colors.white),)
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget _services() {
      return Column(
        children: [
          PriceTextRow(
            rightTitle1: "\$${widget.price}",
            rightTitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF00B2AE)),
            leftTitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            leftTitle: "Choose your service",
          ),
          SizedBox(height: 15),
          selectValue == 0
              ? BookAppointmentRowViewWidget(
            isFemaleListVisible: false,
          )
              : BookAppointmentRowViewWidget(
            isFemaleListVisible: true,
          )
        ],
      );
    }

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,top: 10),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: "Book now",
          buttonColor: AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),
          backCallback:(){
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: BookAppointmentTimeScreen()),
            );
          },
          isBottomMarginRequired: false,
        ),
      );
    }




    Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/6.4,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeTextView(),
              SizedBox(height: 20),
              _services(),
              // bottomButton(),
            ],
          ),

          // ContainerMenuPage(
          //   contextCurrentView: context,
          //   scrollPadding: EdgeInsets.only(bottom: 0),
          //   /* statusBarColor: Colors.amber,
          // bottomBarSafeAreaColor: Colors.amber,*/
          //   isSingleChildScrollViewNeed: false,
          //   isFixedDeviceHeight: true,
          //   appBarHeight: -1,
          //   appBar: Container(),
          //   containChild: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       _welcomeTextView(),
          //       SizedBox(height: 20),
          //       services,
          //       // bottomButton(),
          //     ],
          //   ),
          // )
      ),
    );




    return Scaffold(
      backgroundColor: AppColors().appBgColor2,
      body: SafeArea(
        top: false,
        bottom: true,
        right: false,
        left: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child:_topView(),
            ),
            ContainerFirst(
              appBackgroundColor: Colors.transparent,
              contextCurrentView: context,
             // scrollPadding: EdgeInsets.only(bottom: 0),
              /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
              isSingleChildScrollViewNeed: true,
              isFixedDeviceHeight: true,
              appBarHeight: 60,
              appBar: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 12),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:iconApps.iconImage(imageUrl: iconApps.backArrow2,imageColor: Colors.white),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book Appointment",
                          style:TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors().textNormalColor6
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              containChild:Container(
                height: size.height/1.16 ,
                child: Stack(
                  children: [
                    bottomCardView,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:bottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

