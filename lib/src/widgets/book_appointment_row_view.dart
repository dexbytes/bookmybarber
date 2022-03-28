import 'package:base_flutter_app/src/model/book_appointment_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class BookAppointmentRowViewWidget extends StatefulWidget {
  final onClickCardCallBack;
  final bool isFemaleListVisible;
  final  selectedServiceListCallback;



  BookAppointmentRowViewWidget({Key? key,
    this.onClickCardCallBack,
    this.isFemaleListVisible = false, this.selectedServiceListCallback,
  }) : super(key: key);

  @override
  State<BookAppointmentRowViewWidget> createState() => _BookAppointmentRowViewWidgetState();
}

class _BookAppointmentRowViewWidgetState extends State<BookAppointmentRowViewWidget> {
  List selectedServiceList = [];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 18,right: 15),
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.isFemaleListVisible ? female.length :male.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                flex: 6,
                  child: Text( widget.isFemaleListVisible ? female[index].title : male[index].title,
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: !isDarkMode? Colors.black.withOpacity(0.6):Colors.grey,
                    ),

                  )),
              Expanded(
                flex: 9,
                  child:Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      child: widget.isFemaleListVisible ?
                      DropDownDataPicker2(itemList:female[index].subtitle.map(buildMenuItem2).toList(),
                      selectedValue:(String selectedValue){
                        if (!selectedServiceList.contains(female[index])) {
                         selectedServiceList.add(female[index]);
                        }
                        widget.selectedServiceListCallback(selectedServiceList);
                      }
                      )
                     :DropDownDataPicker3(itemList:male[index].subtitle.map(buildMenuItem).toList(),
                          selectedValue:(String selectedValue){
                            if (!selectedServiceList.contains(male[index])) {
                              selectedServiceList.add(male[index]);
                            }
                            widget.selectedServiceListCallback(selectedServiceList);
                          }

                      )
                  )
              )
            ],
          );
        },
      );


  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return DropdownMenuItem(
      value:item,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          item,
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: !isDarkMode?  Colors.black:Colors.white,
          ),
          maxLines: 1,
        ),
      )
  );}

  DropdownMenuItem<String> buildMenuItem2(String item) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return DropdownMenuItem(
      value:item,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          item,maxLines: 1,
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: !isDarkMode?  Colors.black:Colors.white,
          ),
        ),
      )
  );}
}

