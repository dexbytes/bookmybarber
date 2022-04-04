import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/book_appointment_model.dart';
import 'package:base_flutter_app/src/pages/book_appointment_with_time.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/price_text_row.dart';
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

class _BookAppointmentScreenState extends State<BookAppointmentScreen>with TickerProviderStateMixin {
  int selectValue = 0;
  List<SelectedServiceData> selectedServices = [];
  List<SelectedServiceData> selectedServices2 = [];
  TabController? tabController;
  int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController =
    new TabController(initialIndex: selectedTab, length: 2, vsync: this);
    super.initState();
    tabController =
    new TabController(initialIndex: selectedTab, length: 2, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    Widget _maleServices() {
      return Column(
        children: [
          PriceTextRow(
            rightTitle1: "\$${widget.price}",
            rightTitleTextStyle1:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: !isDarkMode?appColors.textHeadingColor2 :Color(0xFF00B2AE)),
            rightTitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: !isDarkMode?appColors.textHeadingColor2 :Color(0xFF00B2AE)),
            leftTitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: !isDarkMode? Colors.black:Colors.white
            ),
            leftTitle: "Choose your service",
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 10,right: 12,top: 0,bottom: 0),
                physics: ClampingScrollPhysics(),
                itemCount: serviceList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  String selectedService = "";
                  Icon selectedServiceIcon = Icon(Icons.arrow_forward_ios);
                  selectedServices.forEach((element) {
                    if(  element.title == serviceList[index].name){
                      selectedService = element.serviceData.toString();
                      selectedService = selectedService +' (\$' +element.price!.ceil().toString() + ")";
                    }
                  });
                  return InkWell(
                    onTap: (){
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
                     decoration: BoxDecoration(
                       color: Colors.grey.withOpacity(0.15),
                       borderRadius: BorderRadius.circular(8)
                     ),
                      margin: EdgeInsets.all(5),
                      padding:  EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10,top: 10),
                            child: Text(serviceList[index].name, style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: !isDarkMode ? Colors.black:AppColors().grey)
                              ,
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){
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
                                child: selectedServices.isEmpty ?
                                Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(Icons.arrow_forward_ios_sharp,
                                    color: !isDarkMode?appColors.buttonColor2:appColors.buttonColor,
                                    size: 22
                                  ),
                                ):
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 17,right: 15,bottom:8,top: 8),
                                  // height: 40,
                                  child: Text(
                                      selectedService,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,
                                      )
                                  ),
                                )
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      );
    }

    Widget _femaleServices() {
      return Column(
        children: [
          PriceTextRow(
            rightTitle1: "\$${widget.price}",
            rightTitleTextStyle1:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: !isDarkMode?appColors.textHeadingColor2 :Color(0xFF00B2AE)),
            rightTitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: !isDarkMode?appColors.textHeadingColor2 :Color(0xFF00B2AE)),
            leftTitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: !isDarkMode? Colors.black:Colors.white
            ),
            leftTitle: "Choose your service",
          ),
          SizedBox(height: 15,),
               Expanded(
                 child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 20,right: 16,top: 0,bottom: 0),
              physics: ClampingScrollPhysics(),
              itemCount: serviceListFemale.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                  String selectedService = "ADD";
                  selectedServices2.forEach((element) {
                    if(  element.title == serviceListFemale[index].name){
                      selectedService = element.serviceData.toString();
                      selectedService = selectedService +' (\$' +element.price!.ceil().toString() + ")";
                    }
                  });
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(serviceListFemale[index].name, style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: !isDarkMode ? Colors.black:AppColors().grey)
                          ,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  BottomUpTransition(
                                      widget:BookServicesWithImage(
                                        title: serviceListFemale[index].name,
                                        serviceList:serviceListFemale[index].subtitle,
                                        onAddClickCallBack:(service,price){
                                          setState((){

                                            if (selectedService != "ADD") {
                                              selectedServices2.removeWhere((product) => product.title == serviceListFemale[index].name);
                                            }

                                            selectedServices2.add(SelectedServiceData(title: serviceListFemale[index].name,
                                                serviceData: service,price: price));

                                          });
                                        },

                                      )),
                                );
                              },
                              child: selectedServices2.isEmpty ?
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.arrow_forward_ios_sharp,
                                    color: !isDarkMode?appColors.buttonColor2:appColors.buttonColor,
                                    size: 22
                                ),
                              ): Container(
                                margin: EdgeInsets.only(bottom: 5,top: 5),
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
                        ),

                      ],
                    ),
                  );
              }
          ),
               ),
        ],
      );
    }


    Widget tabBar = Column(
      /* shrinkWrap: true,
        physics: widget.isDataScroll?AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),
     */   children: [
      Container(
        margin: EdgeInsets.only(top: 20,bottom: 25,left: 15,right: 15),
        height: 40,
        decoration: BoxDecoration(
            color:Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 1,color: !isDarkMode?AppColors().buttonColor2:AppColors().buttonColor,)
        ),
        child: TabBar(
          onTap: (index){
            setState(() {
              selectedTab = index;
            });
          },
          controller: tabController,
          tabs: [
            Tab(text: "Male",),
            Tab(text: "Female",),
          ],
          labelColor:!isDarkMode? AppColors().white:Color(0xff323446),
          isScrollable: false,
          unselectedLabelColor:!isDarkMode? AppColors().textHeadingColor2 :AppColors().textHeadingColor1,
          labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:Colors.black),
          labelPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          unselectedLabelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),
          indicator:BoxDecoration(
            color:!isDarkMode? AppColors().textHeadingColor2 :AppColors().textHeadingColor1,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      Expanded(
        child: DefaultTabController(
          length: 2,
          initialIndex: selectedTab,
          child: Container(
            // height: 1050,
            child: TabBarView(
              controller: tabController,
              children: [
                _maleServices(),
                _femaleServices()
              ],
            ),
          ),
        ),
      ),
    ]);


    // _welcomeTextView() {
    //   return Container(
    //     margin: EdgeInsets.only(left: 8,right: 14),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(left: 14),
    //           child: Text("Gender",
    //             style: TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w700,
    //                 color: AppColors().textHeadingColor1
    //             ),
    //             textAlign: TextAlign.start,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 6,
    //         ),
    //         Theme(
    //           data: Theme.of(context).copyWith(
    //             unselectedWidgetColor: Colors.grey.withOpacity(0.6),
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Transform.scale(
    //                 scale: 1.3,
    //                 child: Radio<int>(
    //                     value: 0,
    //                     groupValue: selectValue,
    //                     activeColor:!isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
    //                     onChanged: (value) =>setState(()=>selectValue = value!),
    //                 ),
    //               ),
    //               Text("Male",style: !isDarkMode ?
    //               TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
    //                   color: selectValue == 0?appColors.buttonColor2:Colors.black.withOpacity(0.5))
    //                   :TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
    //                   color: selectValue == 0?Color(0xffE4B343):Colors.white)
    //
    //               ),
    //               SizedBox(width: 70,),
    //               Transform.scale(
    //                 scale: 1.3,
    //                 child: Radio<int>(
    //                     value: 1,
    //                     activeColor:!isDarkMode ?appColors.buttonColor2:Color(0xffE4B343),
    //                     focusColor: Colors.white,
    //
    //                     groupValue: selectValue,
    //                     onChanged: (value) =>setState(()=>selectValue = value! )
    //                 ),
    //               ),
    //               Text("Female",style:!isDarkMode ?
    //               TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
    //                   color: selectValue == 1?appColors.buttonColor2:Colors.black.withOpacity(0.5))
    //                   :TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,
    //                   color: selectValue == 1?Color(0xffE4B343):Colors.white)
    //
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 28,right: 28,),
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


    return ContainerFirst(
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      statusBarColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        child: appBarWithBackArrow(
            // backgroundColor: !isDarkMode ?Colors.white:AppColors().appBgColor3,
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: "Book Appointment",
            textStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
            ),
            leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
            leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 25),
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      containChild:Container(
        height: 1,
        child:Stack(
          children: [
            tabBar,
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomButton(),
            )
          ],
        )
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