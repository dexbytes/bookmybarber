import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final double errorHeight;
  final bool isShowMonthName;

  const DatePickerWidget({Key? key, this.isShowMonthName = false, this.errorHeight = 20}) : super(key: key);
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date = DateTime.now();

  String getText() {
    // ignore: unnecessary_null_comparison
    if (date == null) {
      return 'Select Date';
    } else {
      return widget.isShowMonthName
    ? DateFormat('dd MMMM, yyyy').format(date)
    : DateFormat('dd/MM/yyyy').format(date);


      // return DateFormat('dd/MMM/yyyy').format(date);
      // return '${date.day}/${date.month}/${date.year}';
    }
  }

  Map<String, TextEditingController> controllers = {

    'dateOfBirth': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {

    'dateOfBirth': new FocusNode(),
  };

  Map<String, String> errorMessages = {

    'dateOfBirth': "",
  };


  void pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      fieldLabelText: "DOB",
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 20),
      confirmText: "Ok",


    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: ()
      {

        pickDate(context);
        controllers['dateOfBirth']?.text = getText().toString();

      },
      child: Container(
      padding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 0
      ),
      width: MediaQuery.of(context).size.width,
      child: CommonTextFieldWithError(
      focusNode: focusNodes['dateOfBirth'],
      isShowBottomErrorMsg: true,
      errorMessages: errorMessages['dateOfBirth']?.toString()??'',
      controllerT: controllers['dateOfBirth'],
      borderRadius: 50,
      inputHeight: 45,
      autoFocus: true,
      errorMsgHeight: widget.errorHeight,
      errorLeftRightMargin: 0,
      isTextFieldEnabled: false,
      capitalization: CapitalizationText.sentences,
      enabledBorderColor: Color(0xff323446),
      focusedBorderColor: Color(0xff323446),
      cursorColor: Colors.grey,
      borderStyle: BorderStyle.none,
      backgroundColor: Color(0xff323446),
      inputKeyboardType: InputKeyboardTypeWithError.text,
      textInputAction: TextInputAction.next,
      hintText: "Date of Birth",
      hintStyle:TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff828588),
      ),
      textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      ),
      contentPadding: EdgeInsets.only(left: 25),
      inputFieldSuffixIcon: Padding(
      padding: EdgeInsets.only(right: 10),
      child: IconButton(
      icon: Icon(CupertinoIcons.calendar_today),
      color: Color(0xff828588),
      onPressed: (){},
      ),
      ),
      onTextChange: (value) {
      // _checkName(value, 'address', onchange: true);
      },
      onEndEditing: (value) {
      // _checkName(value, 'dateOfBirth');
      FocusScope.of(context).requestFocus(focusNodes['dateOfBirth']);
      },
      ),
      ),
      );
  }

}