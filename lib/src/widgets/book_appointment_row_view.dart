import 'package:base_flutter_app/src/model/book_appointment_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookAppointmentRowViewWidget extends StatelessWidget {
  final onClickCardCallBack;
  final bool isFemaleListVisible;

  BookAppointmentRowViewWidget({Key? key,
    this.onClickCardCallBack,
    this.isFemaleListVisible = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 18,right: 15),
        physics: NeverScrollableScrollPhysics(),
        itemCount: isFemaleListVisible ? female.length :male.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                flex: 6,
                  child: Text( isFemaleListVisible ? female[index].title : male[index].title,
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),

                  )),
              Expanded(
                flex: 9,
                  child:Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      child: isFemaleListVisible ?
                      DropDownDataPicker2(itemList:female[index].subtitle.map(buildMenuItem2).toList(),)
                     :DropDownDataPicker3(itemList:male[index].subtitle.map(buildMenuItem).toList(),)
                  )
              )
            ],
          );
        },
      );


  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value:item,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          item,
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      )
  );

  DropdownMenuItem<String> buildMenuItem2(String item) => DropdownMenuItem(
      value:item,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          item,maxLines: 1,
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      )
  );
}

