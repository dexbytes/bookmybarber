import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/api_calling/api_constant.dart';

class CircularImage extends StatefulWidget {
  final double height;
  final double width;
  final String? image;
  final String? name;
  final Color? bgColor;
  final bool isClickToFullView;
  final imageClickCallBack;
  CircularImage(
      {Key? key,
      this.height = 40,
      this.width = 40,
      this.image,
      this.name,
      this.isClickToFullView = true,
      this.imageClickCallBack,
      this.bgColor})
      : super(key: key);

  @override
  _CircularImageState createState() => _CircularImageState();
}

class _CircularImageState extends State<CircularImage> {
  List<String> inputValueList = [];
  String inputValue = "";
  TextEditingController controller = new TextEditingController();

  void initState() {
    return super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    circularImageOrNameViewLocal(
        {String? name, double height = 50, double width = 50}) {
      var firstAndLastLetter = projectUtil.getFirstLetterFromName(name!);

      return firstAndLastLetter != null
          ? Center(
              child: new Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.bgColor != null
                        ? widget.bgColor
                        : appColors.buttonBgColor),
                height: height,
                width: width,
                child: Center(
                  child: Text(
                      //count == 1 ? '1' : "+$count",
                      firstAndLastLetter != null ? firstAndLastLetter : "",
                      style: TextStyle(
                          fontFamily: appFonts.defaultFont,
                          fontSize: appDimens.fontSize(value: 14),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.0,
                          color: appColors.white)),
                ),
              ),
            )
          : Container();
    }

    circularImageOrNameView(
        double height, double width, String image, String name) {
      try {
        projectUtil.printP("$image");
        name = projectUtil.getDecodedValue(name);
      } catch (e) {
        print(e);
      }
      if (image.trim() != "") {
        return Center(
            child: new Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: appColors.iconColor),
                height: height,
                width: width,
                child: Stack(
                  children: <Widget>[
                    (image.trim().length > 0)
                        ? ((image.contains('http') || image.contains('https'))
                            ? Align(
                                child: (image.contains(
                                        '.gif') /*|| image.contains('assets-yammer')*/)
                                    ? circularImageOrNameViewLocal(
                                        name: name,
                                        height: height,
                                        width: width)
                                    : CachedNetworkImage(
                                        height: height,
                                        width: width,
                                        imageUrl: image,
                                        imageBuilder: (context,
                                                imageProvider) =>
                                            InkWell(
                                              onTap: () {
                                                if (widget.isClickToFullView &&
                                                    image.trim().length > 0) {
                                                  showPhoto(image);
                                                } else if (widget
                                                        .imageClickCallBack !=
                                                    null) {
                                                  widget.imageClickCallBack();
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.transparent,
                                                  //borderRadius: BorderRadius.all(Radius.circular(height / 2)),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Container(
                                                  child: Center(
                                                    child: Container(
                                                      height: height / 2,
                                                      width: width / 2,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 1.5,
                                                        value: downloadProgress
                                                            .progress,
                                                        valueColor:
                                                            new AlwaysStoppedAnimation<
                                                                    Color>(
                                                                appColors
                                                                    .loaderColor),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        errorWidget: (context, url, error) =>
                                            circularImageOrNameViewLocal(
                                                name: name,
                                                height: height,
                                                width: width)),
                                alignment: Alignment.center,
                              )
                            : image.contains('assets')
                                ? new CircleAvatar(
                                    radius: height / 2,
                                    backgroundImage: /*image.contains('http')?Image.network(image)*/ AssetImage(
                                        image),
                                  )
                                : new CircleAvatar(
                                    radius: height / 2,
                                    backgroundImage: /*image.contains('http')?Image.network(image)*/ FileImage(
                                        File(image)),
                                  ))
                        : new CircleAvatar(
                            radius: height / 2,
                            backgroundImage: NetworkImage(imageNotFoundC),
                          )
                  ],
                )));
      } else {
        return circularImageOrNameViewLocal(
            name: name, height: height, width: width);
      }
    }

    //Main view
    return Container(
        child: circularImageOrNameView(
            widget.height, widget.width, widget.image!, widget.name!));
  }

  void showPhoto(String image) {
    /*Navigator.push(context, MaterialPageRoute(builder: (_) {
      return FullPhotoView(imageUrl: image);
    }));*/
  }
}
