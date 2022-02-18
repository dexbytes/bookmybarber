import 'package:flutter/material.dart';



//for TextField
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



// For Female
class DropDownDataPicker2 extends StatefulWidget {
  final List<DropdownMenuItem<String>>? itemList;
  final String? hint;

  const DropDownDataPicker2({Key? key,
    this.itemList,
    this.hint
  }) : super(key: key);

  @override
  _DropDownDataPicker2State createState() => _DropDownDataPicker2State();
}

class _DropDownDataPicker2State extends State<DropDownDataPicker2> {

  String? valueChoose2;

  final items2 = ["Cool Messy(\$15)", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          height: 20,
          width: 150,
          padding: EdgeInsets.only(right:0,left: 0,bottom: 0),
          margin: EdgeInsets.only(right:10,left: 10,bottom: 0),
          decoration: BoxDecoration(
            color: Color(0xff323446),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5,right: 5),
            child: Center(
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
                  borderRadius: BorderRadius.circular(5),
                  hint: Padding(
                    padding: EdgeInsets.only(left:10.0),
                    child: Text( widget.hint ??"Select type",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff828588),
                    ),),
                  ),
                  isDense: false,
                  value: valueChoose2,
                  items: widget.itemList,
                  onChanged: (value) => setState(() {
                    this.valueChoose2 = value;
                  })
              ),
            ),
          ),
        ),
      );

  }
}



// For Male
class DropDownDataPicker3 extends StatefulWidget {
  final List<DropdownMenuItem<String>>? itemList;
  final String? hint;

  const DropDownDataPicker3({Key? key,
    this.itemList,
    this.hint
  }) : super(key: key);

  @override
  _DropDownDataPicker3State createState() => _DropDownDataPicker3State();
}

class _DropDownDataPicker3State extends State<DropDownDataPicker3> {

  String? valueChoose2;

  final items2 = ["Cool Messy(\$15)", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 20,
        width: 150,
        padding: EdgeInsets.only(right:0,left: 0,bottom: 0),
        margin: EdgeInsets.only(right:10,left: 10,bottom: 0),
        decoration: BoxDecoration(
          color: Color(0xff323446),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 5,right: 5),
          child: Center(
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
                borderRadius: BorderRadius.circular(5),
                hint: Padding(
                  padding: EdgeInsets.only(left:10.0),
                  child: Text( widget.hint ??"Select type",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff828588),
                  ),),
                ),
                isDense: false,
                value: valueChoose2,
                items: widget.itemList,
                onChanged: (value) => setState(() {
                  this.valueChoose2 = value;
                })
            ),
          ),
        ),
      ),
    );

  }
}

