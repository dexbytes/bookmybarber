import 'dart:math';

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
            leftTitle: appString.trans(context, appString.chooseService),
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
                  serviceList[index].isMultipleValueSelect ?
                  selectedServices.forEach((element) {
                    if(  element.title == serviceList[index].name){
                      element.selectServicesList!.forEach((data) {
                        selectedService = selectedService + data + ", ";
                      });
                    }
                  }):
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
                              serviceList: serviceList[index].subtitle,
                              isMultipleValueSelect: serviceList[index].isMultipleValueSelect,
                              onAddClickCallBack: serviceList[index].isMultipleValueSelect ?
                                  (selectedStyles){
                                setState((){
                                  selectedServices.add(SelectedServiceData(title: serviceList[index].name,
                                      selectServicesList: selectedStyles));
                                });
                              }
                              :(service,price){
                                setState((){
                                  if (selectedService != "ADD") {
                                    selectedServices.removeWhere((product) => product.title == serviceList[index].name);
                                  }
                                  selectedServices.add(SelectedServiceData(title: serviceList[index].name,
                                    serviceData: service,price: price,));

                                });
                              },

                              /*   onAddClickCallBack:(service,price){
                                setState((){

                                  if (selectedService != "ADD") {
                                    selectedServices.removeWhere((product) => product.title == serviceList[index].name);
                                  }

                                  selectedServices.add(SelectedServiceData(title: serviceList[index].name,
                                      serviceData: service,price: price,));

                                });
                              },*/

                            )),
                      );
                    },
                    child: Container(
                     decoration: BoxDecoration(
                       color: Colors.grey.withOpacity(0.11),
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
                                  // Navigator.push(
                                  //   context,
                                  //   BottomUpTransition(
                                  //       widget:BookServicesWithImage(
                                  //         isMultipleValueSelect: false,//serviceList[index] == 3 ? true:false,
                                  //         title: serviceList[index].name,
                                  //         serviceList:serviceList[index].subtitle,
                                  //         onAddClickCallBack:(service,price,selectServicesList){
                                  //           setState((){
                                  //
                                  //             if (selectedService != "ADD") {
                                  //               selectedServices.removeWhere((product) => product.title == serviceList[index].name);
                                  //             }
                                  //
                                  //             selectedServices.add(SelectedServiceData(title: serviceList[index].name,
                                  //                 serviceData: service,price: price,selectServicesList:selectServicesList));
                                  //
                                  //           });
                                  //         },
                                  //
                                  //       )),
                                  // );
                                },
                                child:  selectedService.isEmpty ?
                                Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(Icons.arrow_forward_ios_sharp,
                                    color: !isDarkMode?appColors.buttonColor2:appColors.buttonColor,
                                    size: 22
                                  ),
                                ):
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(bottom:8,top: 8,right: 1),
                                      // height: 40,
                                      child: Text(
                                          selectedService,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,
                                          )
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        // service.removeAt(index);
                                        setState(() {
                                          selectedServices.removeAt(index);
                                        });

                                      },
                                      child: Icon(Icons.cancel_outlined,
                                          color: !isDarkMode?appColors.buttonColor2:appColors.buttonColor,
                                          size: 22
                                      ),
                                    ),
                                  ],
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
              padding: EdgeInsets.only(left: 10,right: 12,top: 0,bottom: 0),
              physics: ClampingScrollPhysics(),
              itemCount: serviceListFemale.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                String selectedFemaleService = "";
                serviceListFemale[index].isMultipleValueSelect ?
                selectedServices.forEach((element) {
                  if(  element.title == serviceListFemale[index].name){
                    element.selectServicesList!.forEach((data) {
                      selectedFemaleService = selectedFemaleService + data + ", ";
                    });
                  }
                }):
                selectedServices.forEach((element) {
                  if(  element.title == serviceListFemale[index].name){
                    selectedFemaleService = element.serviceData.toString();
                    selectedFemaleService = selectedFemaleService +' (\$' +element.price!.ceil().toString() + ")";
                  }
                });
                return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        BottomUpTransition(
                            widget:BookServicesWithImage(
                              isMultipleValueSelect: serviceListFemale[index].isMultipleValueSelect,
                              title: serviceListFemale[index].name,
                              serviceList:serviceListFemale[index].subtitle,
                              onAddClickCallBack: serviceListFemale[index].isMultipleValueSelect ?
                                (selectedStyles){
                                setState((){
                                  selectedServices.add(SelectedServiceData(title: serviceListFemale[index].name,
                                      selectServicesList: selectedStyles));
                                });
                              }
                              :(service,price){
                                setState((){
                                  if (selectedFemaleService != "ADD") {
                                    selectedServices.removeWhere((product) => product.title == serviceListFemale[index].name);
                                  }
                                  selectedServices.add(SelectedServiceData(title: serviceListFemale[index].name,
                                    serviceData: service,price: price,));

                                });
                              },



                              // (service,price){
                              //   setState((){
                              //     if (selectedService != "ADD") {
                              //       selectedServices2.removeWhere((product) => product.title == serviceListFemale[index].name);
                              //     }
                              //
                              //     selectedServices2.add(SelectedServiceData(title: serviceListFemale[index].name,
                              //         serviceData: service,price: price));
                              //
                              //   });
                              // },

                            )),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.11),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      margin: EdgeInsets.all(5),
                      padding:  EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10,top: 10),
                            child: Text(serviceListFemale[index].name, style: TextStyle(
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
                                  // Navigator.push(
                                  //   context,
                                  //   BottomUpTransition(
                                  //       widget:BookServicesWithImage(
                                  //         isMultipleValueSelect: true,
                                  //         title: serviceListFemale[index].name,
                                  //         serviceList:serviceListFemale[index].subtitle,
                                  //         onAddClickCallBack:(service,price){
                                  //           setState((){
                                  //
                                  //             if (selectedService != "ADD") {
                                  //               selectedServices2.removeWhere((product) => product.title == serviceListFemale[index].name);
                                  //             }
                                  //
                                  //             selectedServices2.add(SelectedServiceData(title: serviceListFemale[index].name,
                                  //                 serviceData: service,price: price));
                                  //
                                  //           });
                                  //         },
                                  //
                                  //       )),
                                  // );
                                },
                                child: selectedFemaleService.isEmpty ?
                                Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(Icons.arrow_forward_ios_sharp,
                                      color: !isDarkMode?appColors.buttonColor2:appColors.buttonColor,
                                      size: 22
                                  ),
                                ): Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom:8,top: 8),
                                  child:
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(bottom:8,top: 8,right: 1),
                                        // height: 40,
                                        child: Text(
                                            selectedFemaleService,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: !isDarkMode? Colors.black.withOpacity(0.8):Colors.white,
                                            )
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){},
                                        child: Icon(Icons.cancel_outlined,
                                            color: !isDarkMode?appColors.buttonColor2:appColors.buttonColor,
                                            size: 22
                                        ),
                                      ),
                                    ],
                                  )
                                )
                            ),
                          ),

                        ],
                      ),
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
            Tab(text: appString.trans(context, appString.male)),
            Tab(text: appString.trans(context, appString.female)),
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
            title:appString.trans(context, appString.bookAppointment),
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
  List? selectServicesList;

  SelectedServiceData({title,serviceData,price,selectServicesList}){
    this.title = title;
    this.serviceData = serviceData;
    this.price = price;
    this.selectServicesList = selectServicesList;
  }
}

/*class SelectedServiceData{
  String? title;
  String? serviceData;
  double? price;
  List? selectServicesList;

  SelectedServiceData({title,serviceData,price,selectServicesList}){
    this.title = title;
    this.serviceData = serviceData;
    this.price = price;
    this.selectServicesList = selectServicesList;
  }
}*/