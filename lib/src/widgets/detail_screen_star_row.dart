import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';

class DetailScreenStarRow extends StatelessWidget {
  final Function(dynamic)? onButtonClickCallBack;
  final TextStyle buttonTextStyle;
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonBorderWidth;
  final double buttonBorderRadius;
  final Color buttonColor;


  DetailScreenStarRow({
    this.onButtonClickCallBack,
    this.buttonText = "OPEN",
    this.buttonTextStyle = const TextStyle(color:  Color(0xff00B2AE),fontSize: 12.5,fontWeight: FontWeight.w600),
    this.buttonHeight  = 20,
    this.buttonWidth = 50,
    this.buttonBorderWidth = 1,
    this.buttonColor = const Color(0xff00B2AE),
    this.buttonBorderRadius = 4,

  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        StarRatingBar(
          iconCount: 5,
          iconSize: 20,
          removeItemRating: true,
          crossAxisAlignment: CrossAxisAlignment.end,
          itemReviewCount: 125,
          initialRating: 3,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              this.onButtonClickCallBack?.call(0);
            },
            child: Container(
              alignment: Alignment.center,
              height: buttonHeight,
              width: buttonWidth,
              decoration: BoxDecoration(
                border: Border.all(width: buttonBorderWidth,color:buttonColor),
                borderRadius: BorderRadius.circular(buttonBorderRadius)
              ),
              child: Text(buttonText,
                style: buttonTextStyle),
            ),
          ),
        )

      ],
    );
  }
}