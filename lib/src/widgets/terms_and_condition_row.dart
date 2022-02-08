import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  double? size;
  double? iconSize;
  Function onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;

  CustomCheckBox({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange(isChecked);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
              margin: EdgeInsets.only(top: 2),
              height: widget.size ?? 28,
              width: widget.size ?? 28,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isChecked
                      ? widget.backgroundColor ?? Colors.blue
                      : Colors.transparent,
                  border: Border.all(color: widget.borderColor ?? Colors.black)),
              child: isChecked
                  ? Icon(
                widget.icon ?? Icons.check,
                color: widget.iconColor ?? Colors.white,
                size: widget.iconSize ?? 20,
              )
                  : null),
          SizedBox(width: 10,),
          RichText(text: TextSpan(
              text:"By continuing Sign up you agree to the following\nour ",
              style: TextStyle(fontSize: 13.5,fontWeight: FontWeight.w500,color:Color(0xff828588)),
              children: [
                TextSpan(
                  text: "Terms ",
                  style:TextStyle(fontSize: 13.5,fontWeight: FontWeight.w500,color:Color(0xFFCCA76A)),
                ),
                TextSpan(
                  text: "& ",
                  style:TextStyle(fontSize: 13.5,fontWeight: FontWeight.w500,color:Color(0xff828588)),
                ),
                TextSpan(
                  text: "Conditions.",
                  style:TextStyle(fontSize: 13.5,fontWeight: FontWeight.w500,color:Color(0xFFCCA76A)),
                ),
              ]
          ))
        ],
      ),
    );
  }
}