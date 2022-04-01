import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/book_appointment_model.dart';
import 'package:base_flutter_app/src/pages/book_appointment_with_time.dart';
import 'package:base_flutter_app/src/widgets/price_text_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'book_services_with_circular_image.dart';


class BookAppointmentScreen extends StatefulWidget {
  final double price;
  final bool isBottomButtonText;

  const BookAppointmentScreen({Key? key, this.price = 00.00, this.isBottomButtonText = true}) : super(key: key);

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int selectValue = 0;
  List<SelectedServiceData> selectedServices = [];



  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

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
                      activeColor:!isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                      onChanged: (value) =>setState(()=>selectValue = value!),
                    ),
                  ),
                  Text("Male",style: !isDarkMode ?
                  TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
                      color: selectValue == 0?appColors.buttonColor2:Colors.black.withOpacity(0.5))
                      :TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
                      color: selectValue == 0?Color(0xffE4B343):Colors.white)

                  ),
                  SizedBox(width: 70,),
                  Transform.scale(
                    scale: 1.3,
                    child: Radio<int>(
                        value: 1,
                        activeColor:!isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
                        focusColor: Colors.white,

                        groupValue: selectValue,
                        onChanged: (value) =>setState(()=>selectValue = value! )
                    ),
                  ),
                  Text("Female",style:!isDarkMode ?
                  TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
                      color: selectValue == 1?appColors.buttonColor2:Colors.black.withOpacity(0.5))
                      :TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
                      color: selectValue == 1?Color(0xffE4B343):Colors.white)

                  )
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
          SizedBox(height: 12,),
          selectValue == 0
              ? ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 20,right: 16,top: 0,bottom: 0),
              physics: ClampingScrollPhysics(),
              itemCount: serviceList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                String selectedService = "ADD";
                selectedServices.forEach((element) {
                  if(  element.title == serviceList[index].name){
                    selectedService = element.serviceData.toString();
                    selectedService = selectedService +' (\$' +element.price!.ceil().toString() + ")";
                  }
                });
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(serviceList[index].name, style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: !isDarkMode ? Colors.black:AppColors().grey)
                      ,
                    ),
                    InkWell(
                        onTap: (){
                          // showSlidingBottomSheet(
                          //     context,
                          //     builder: (context) {
                          //       return SlidingSheetDialog(
                          //         duration: Duration(milliseconds: 400),
                          //         elevation: 8,
                          //         color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                          //         cornerRadius: 16,
                          //         snapSpec: SnapSpec(
                          //           snap: true,
                          //           snappings: [0.5, 0.8],
                          //           positioning: SnapPositioning.relativeToAvailableSpace,
                          //         ),
                          //         builder: (context, state) {
                          //           return Material(
                          //             color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                          //             child: Column(
                          //               children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     Navigator.pop(context);
                          //                   },
                          //                   child: Container(
                          //                     color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                          //                     margin: const EdgeInsets.only(
                          //                         top: 12, bottom: 10),
                          //                     width: 50,
                          //                     child: Divider(
                          //                       color: Colors.grey,
                          //                       thickness: 4,
                          //                       indent: 1,
                          //                       endIndent: 1,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                          //                   child: Text(serviceList[index].name, style: TextStyle(
                          //                       fontSize: 22,
                          //                       fontWeight: FontWeight.w600,
                          //                       color: !isDarkMode ? Colors.black:AppColors().textHeadingColor1)
                          //                     ,
                          //                   ),
                          //                 ),
                          //                 BookAppointmentBottomSheetScreen(itemCount:serviceList[index].subtitle.length,)
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     }
                          // );
                          Navigator.push(
                            context,
                            BottomUpTransition(
                                widget:BookServicesWithImage(
                                  title: serviceList[index].name,
                                  serviceList:serviceList[index].subtitle,
                                  onAddClickCallBack:(service,price){
                                    setState((){

                                      if (selectedService != "ADD") {
                                        selectedServices.removeWhere((product) => product.title == serviceList[index].name);
                                      }

                                      selectedServices.add(SelectedServiceData(title: serviceList[index].name,
                                          serviceData: service,price: price));

                                    });
                                  },

                                )),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8,top: 8),
                          decoration: BoxDecoration(
                            color: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 17,right: 15,bottom:8,top: 8),
                          // height: 40,
                          child:
                          Text(
                              selectedService,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,
                              )
                          ),
                        )
                    ),

                  ],
                );
              }
          )
              : ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 20,right: 16,top: 0,bottom: 0),
              physics: ClampingScrollPhysics(),
              itemCount: serviceListFemale.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                String selectedService = "ADD";
                selectedServices.forEach((element) {
                  if(  element.title == serviceListFemale[index].name){
                    selectedService = element.serviceData.toString();
                    selectedService = selectedService +' (\$' +element.price!.ceil().toString() + ")";
                  }
                });
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(serviceListFemale[index].name, style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: !isDarkMode ? Colors.black:AppColors().grey)
                      ,
                    ),
                    InkWell(
                        onTap: (){
                          // showSlidingBottomSheet(
                          //     context,
                          //     builder: (context) {
                          //       return SlidingSheetDialog(
                          //         duration: Duration(milliseconds: 400),
                          //         elevation: 8,
                          //         color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                          //         cornerRadius: 16,
                          //         snapSpec: SnapSpec(
                          //           snap: true,
                          //           snappings: [0.5, 0.8],
                          //           positioning: SnapPositioning.relativeToAvailableSpace,
                          //         ),
                          //         builder: (context, state) {
                          //           return Material(
                          //             color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                          //             child: Column(
                          //               children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     Navigator.pop(context);
                          //                   },
                          //                   child: Container(
                          //                     color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
                          //                     margin: const EdgeInsets.only(
                          //                         top: 12, bottom: 10),
                          //                     width: 50,
                          //                     child: Divider(
                          //                       color: Colors.grey,
                          //                       thickness: 4,
                          //                       indent: 1,
                          //                       endIndent: 1,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                          //                   child: Text(serviceList[index].name, style: TextStyle(
                          //                       fontSize: 22,
                          //                       fontWeight: FontWeight.w600,
                          //                       color: !isDarkMode ? Colors.black:AppColors().textHeadingColor1)
                          //                     ,
                          //                   ),
                          //                 ),
                          //                 BookAppointmentBottomSheetScreen(itemCount:serviceList[index].subtitle.length,)
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     }
                          // );
                          Navigator.push(
                            context,
                            BottomUpTransition(
                                widget:BookServicesWithImage(
                                  title: serviceListFemale[index].name,
                                  serviceList:serviceListFemale[index].subtitle,
                                  onAddClickCallBack:(service,price){
                                    setState((){

                                      if (selectedService != "ADD") {
                                        selectedServices.removeWhere((product) => product.title == serviceListFemale[index].name);
                                      }

                                      selectedServices.add(SelectedServiceData(title: serviceListFemale[index].name,
                                          serviceData: service,price: price));

                                    });
                                  },

                                )),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8,top: 8),
                          decoration: BoxDecoration(
                            color: !isDarkMode? AppColors().textFiledColor.withOpacity(0.15): AppColors().textFiledColor2,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 17,right: 15,bottom:8,top: 8),
                          // height: 40,
                          child:
                          Text(
                              selectedService,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,
                              )
                          ),
                        )
                    ),

                  ],
                );
              }
          ),
          // SizedBox(height: 15),
          // selectValue == 0
          //     ? BookAppointmentRowViewWidget(
          //     selectedServiceListCallback:(selectedServices){
          //       this.selectedServices.addAll(selectedServices);
          //     }
          // )
          //     : BookAppointmentRowViewWidget(
          //   isFemaleListVisible: true,
          //     selectedServiceListCallback:(selectedServices){
          //       this.selectedServices.addAll(selectedServices);
          //     }
          // )

        ],
      );
    }

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,top: 10),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: widget.isBottomButtonText ?appString.trans(context, appString.bookNow):appString.trans(context, appString.done),
          buttonColor:!isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: !isDarkMode?Colors.white:Color(0xff212327),),
          backCallback:(){
            widget.isBottomButtonText ? Navigator.push(
              context,
              SlideRightRoute(
                  widget: BookAppointmentTimeScreen()),
            ):
            Navigator.pop(context,selectedServices);
          },
          isBottomMarginRequired: false,
        ),
      );
    }





    Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/8.4,
      child: Container(
        padding: EdgeInsets.only(top: 25),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color:!isDarkMode? Colors.white: AppColors().appBgColor2,
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
      backgroundColor:!isDarkMode? Colors.white: AppColors().appBgColor2,
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
                        Text(appString.trans(context, appString.bookAppointment),
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
                height: size.height/0.9,
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

class SelectedServiceData{
  String? title;
  String? serviceData;
  double? price;

  SelectedServiceData({title,serviceData,price}){
    this.title = title;
    this.serviceData = serviceData;
    this.price = price;
  }
}