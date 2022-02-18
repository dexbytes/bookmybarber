import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class BookAppointmentTimeList extends StatefulWidget {
  final List<String> reportList;
  final Function(dynamic)? tagClickCallBack;


  const BookAppointmentTimeList({Key? key,
    this.reportList = const["l","m","n"],
    this.tagClickCallBack,
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
          elevation: elevation,
          pressElevation: 0,
          label: Text(item),
          labelStyle: TextStyle(
              color: selectedChoice == item ?
              Colors.white:Color(0xff828588),
              fontSize: 13.5,
              fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor:AppColors().appBgColor3,// Color(0xffB8BCBF).withOpacity(0.4),
          selectedColor: Color(0xff00B2AE),
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



