import 'package:base_flutter_app/src/widgets/scroll_behavior.dart';
import 'package:flutter/material.dart';

class BottomSheetOnlyCardView extends StatelessWidget {
  final String sheetTitle;
  final TextStyle sheetTitleStyle;
  final Color topLineColor;
  final double topLineThickness;
  final double topLineWidth;
  final topLineClickCallBack;
  final Color cardBackgroundColor;
  final double cardShape;
  final double bottomSheetHeight;
  final Widget child;
  final bool topLineShow;
  final EdgeInsetsGeometry topLineMargin;

  BottomSheetOnlyCardView(
      {Key? key,
        this.sheetTitle = "",
        this.sheetTitleStyle = const TextStyle(),
        this.bottomSheetHeight = 500,
        this.topLineColor = Colors.grey,
        this.topLineThickness = 4,
        this.topLineWidth = 50,
        this.cardBackgroundColor = Colors.red,
        this.cardShape = 30,
        this.topLineClickCallBack,
        required this.child,
        this.topLineShow =false,
        this.topLineMargin = const EdgeInsets.only(top: 12, bottom: 10),
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: topLineShow,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    // if (topLineClickCallBack != null) {
                    //   topLineClickCallBack(context);
                    // }
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: topLineMargin,
                    width: topLineWidth,
                    child: Divider(
                      color: topLineColor,
                      //height: 10,
                      thickness: topLineThickness,
                      indent: 1,
                      endIndent: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$sheetTitle",
                        style: sheetTitleStyle),
                    Container(
                        height: bottomSheetHeight,
                        child: child
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
