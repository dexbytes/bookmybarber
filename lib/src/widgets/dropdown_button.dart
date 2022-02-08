import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownDataPicker extends StatefulWidget {
  final List<DropdownMenuItem<String>>? itemList;
  final String? hint;

  const DropDownDataPicker({Key? key,
    this.itemList,
    this.hint
  }) : super(key: key);

  @override
  _DropDownDataPickerState createState() => _DropDownDataPickerState();
}

class _DropDownDataPickerState extends State<DropDownDataPicker> {
  DateTime date = DateTime.now();

  Map<String, TextEditingController> controllers = {

    'gender_select': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {

    'gender_select': new FocusNode(),
  };

  Map<String, String> errorMessages = {

    'gender_select': "",
  };

   String? valueChoose;

  final items = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 46,
        margin: EdgeInsets.only(right:20,left: 20,bottom: 20),
        decoration: BoxDecoration(
          color: Color(0xff323446),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 22,right: 18),
          child: DropdownButton<String> (
              iconEnabledColor:Colors.grey ,
              iconSize: 28,
              elevation: 0,
              isExpanded: true,
              underline:Container(
                height: 0.0,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFBDBDBD),
                      width: 0.01,
                    ),
                  ),
                ),
              ),
              dropdownColor:Color(0xff212327),
              alignment: Alignment.bottomCenter,
              borderRadius: BorderRadius.circular(8),
              hint: Text( widget.hint ??"Select gender",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff828588),
              ),),
              isDense: false,
              value: valueChoose,
              items: widget.itemList?? items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() {
                this.valueChoose = value;
              })
          ),
        ),
      );


}
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
       value:item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      )
  );

}

