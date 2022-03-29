import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';

class TitleWithBackArrow extends StatefulWidget {
  final title, showBackArrow, backArrowCallback, appBarColor;
  final TextStyle? titleStyle;

  const TitleWithBackArrow(
      {Key? key,
      this.title,
      this.showBackArrow = false,
      this.backArrowCallback,
      this.titleStyle,
      this.appBarColor})
      : super(key: key);
  @override
  _TitleWithBackArrowState createState() => _TitleWithBackArrowState();
}

class _TitleWithBackArrowState extends State<TitleWithBackArrow> {
  @override
  Widget build(BuildContext context) {
//
//
    appDimens.appDimensFind(context: context);

    return Container(
      height: kToolbarHeight,
      color: widget.appBarColor ?? appColors.appTransColor,
      child: Stack(
        children: [
          widget.showBackArrow
              ? Positioned(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          widget.backArrowCallback?.call();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: kToolbarHeight,
                          padding: EdgeInsets.only(left: 20.0, right: 5),
                          child:
                              iconApps.iconImage(imageUrl: iconApps.backArrow),
                        ),
                      )))
              : Container(),
          Positioned(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 55),
            child: Container(
              // color: Colors.green,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title ?? '',
                    style: widget.titleStyle != null
                        ? widget.titleStyle
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: appFonts.defaultFont,
                            fontWeight: appFonts.semiBold600,
                          ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
