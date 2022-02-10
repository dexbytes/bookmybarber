import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatingBar extends StatelessWidget {
  final int iconCount;
  final double minRating;
  final double initialRating;
  final double iconSize;
  final Color color;
  final Function(dynamic)? onStarClickCallBack;
  final int itemViewCount;
  final TextStyle itemRatingTextStyle;
  final TextStyle itemViewCountTextStyle;
  final bool removeItemRating;
  final bool removeViewCount;
  final bool updateOnDrag;
  final bool ignoreGestures;

  StarRatingBar({
    this.iconCount = 1,
    this.minRating = 1,
    this.initialRating = 4,
    this.iconSize = 17,
    this.color = const Color(0xffE4B343),
    this.onStarClickCallBack,
    this.itemViewCount = 0,
    this.itemRatingTextStyle = const TextStyle(color: Colors.grey,fontSize: 13.5,fontWeight: FontWeight.w500,),
    this.itemViewCountTextStyle = const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,),
    this.removeItemRating = false,
    this.removeViewCount = false,
    this.updateOnDrag = false,
    this.ignoreGestures = true,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          glow: false,
          unratedColor: Colors.white,
          initialRating: initialRating,
          minRating: minRating,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: iconCount,
          ignoreGestures: ignoreGestures,
          updateOnDrag: updateOnDrag,
          itemSize: iconSize,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color:color,
          ),
          onRatingUpdate: (rating) {
            this.onStarClickCallBack?.call(0);
            print(rating);
          },
        ),
        SizedBox(width: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            removeItemRating ?Container():
            Text("$initialRating",style: itemRatingTextStyle,),
            SizedBox(width: 3),
            removeViewCount ?Container():
            Text("($itemViewCount Reviews)",style: itemViewCountTextStyle,),
          ],
        ),


      ],
    );
  }
}

