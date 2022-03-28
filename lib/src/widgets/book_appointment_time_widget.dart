import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class BookAppointmentTimeList extends StatefulWidget {
  final List<String> reportList;
  final Color? backgroundColor;
  final Color? selectedColor;
  final bool isSecondColorShow;
  final EdgeInsetsGeometry? padding;
  final Function(dynamic)? tagClickCallBack;
  final TextStyle? labelTextStyle;


  const BookAppointmentTimeList({Key? key,
    this.reportList = const["l","m","n"],
    this.tagClickCallBack,
    this.backgroundColor,
    this.selectedColor,
    this.isSecondColorShow = true,
    this.padding,
    this.labelTextStyle,

  }) : super(key: key);

  @override
  State<BookAppointmentTimeList> createState() => _BookAppointmentTimeListState();
}

class _BookAppointmentTimeListState extends State<BookAppointmentTimeList> {
  String selectedChoice = "";
  double elevation = 0;
  double pressElevation = 0;


  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        // padding: const EdgeInsets.only(left: 3,right: 2),
        child: ChoiceChip(
          labelPadding: widget.padding ,
          padding: widget.padding,
          elevation: 0,
          pressElevation: 0,
          label: Text(item),
          labelStyle: widget.labelTextStyle ?? (widget.isSecondColorShow ? TextStyle(
              color: selectedChoice == item ?
              Colors.white:Color(0xff828588),
              fontSize: 13.5,
              fontWeight: FontWeight.w500):TextStyle(
              color: selectedChoice == item ?
              Colors.black:Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400)),
          shape:StadiumBorder(side: BorderSide(width: 0.1,color:AppColors().appBgColor2)),

          // RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(25.0),
          // ),
          backgroundColor: widget.backgroundColor ??AppColors().appBgColor3,// Color(0xffB8BCBF).withOpacity(0.4),
          selectedColor: widget.selectedColor ?? Color(0xff00B2AE),
          disabledColor: Colors.orangeAccent,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              print("$item");
              selectedChoice = item;
              this.widget.tagClickCallBack?.call(item);
              // Navigator.push(
              //   MainAppBloc.getDashboardContext,
              //   SlideRightRoute(
              //       widget: SearchDataScreen()),
              // );
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 0,
      children: _buildChoiceList(),
    );
  }
}



