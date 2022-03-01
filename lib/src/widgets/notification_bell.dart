import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';

class NotificationBal extends StatelessWidget {
  final String? iconData;
  final VoidCallback? onTap;
  final int notificationCount;
  final double? rightIconSize;
  final double? rightIconBoxSize;
  final double? countTextSize;
  final Color? boxShapeCircleColor;
  final Color? iconDataColor;
  final AlignmentGeometry  alignment;
  const NotificationBal(
      {Key? key,
        this.onTap,
        this.iconData,
        this.rightIconSize,
        this.rightIconBoxSize,
        this.iconDataColor,
        this.notificationCount = 0,
        this.countTextSize,
        this.boxShapeCircleColor, this.alignment =  Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? rightIconSizeTemp = rightIconBoxSize != null
        ? rightIconBoxSize
        : rightIconSize != null
        ? rightIconSize
        : 18.0;

    Widget menuIcon = iconData != null
        ? (iconData!.contains(".svg")
        ? SvgPicture.asset(iconData!,
        width: rightIconSize != null
            ? rightIconSize
            : appDimens.iconSquareCustom(value: 18),
        height: rightIconSize != null
            ? rightIconSize
            : appDimens.iconSquareCustom(value: 18),
        color: iconDataColor,
        fit: BoxFit.scaleDown)
        : Image(
      image: AssetImage(iconData!),
      width: rightIconSize != null
          ? rightIconSize
          : appDimens.iconSquareCustom(value: 18),
      height: rightIconSize != null
          ? rightIconSize
          : appDimens.iconSquareCustom(value: 18),
      color: iconDataColor,
    ))
        : Container(
      child: iconApps.iconImage(imageUrl: iconApps.bellIcon2,iconSize: Size(26, 26)),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            width: rightIconSizeTemp,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Stack(
              alignment: alignment,
              children: [
                Container(
                  child: menuIcon,
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[menuIcon],
                // ),
                notificationCount > 0
                    ? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 0),
                    child: Container(
                      //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: boxShapeCircleColor != null
                              ? boxShapeCircleColor
                              : /*Colors.red*/ appColors.iconColor),
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                                '${notificationCount <= 99 ? notificationCount : "99+"}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: countTextSize != null
                                        ? countTextSize
                                        : 12,
                                    color: Colors
                                        .white /*,backgroundColor: Colors.red*/
                                )),
                          )),
                    ),
                  ),
                )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
