import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:photo_view/photo_view.dart';


class FullPhotoView extends StatelessWidget {
  final String? profileImgUrl;

  const FullPhotoView({Key? key,
    this.profileImgUrl,


  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: !isDarkMode? appColors.white :appColors.appBgColor2,
      body: Center(
        child: Stack(
          children: [
            Container(
              child: PhotoView(
                imageProvider: NetworkImage(
                  profileImgUrl ?? "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F37%2F2020%2F11%2F25%2FHow-much-to-tip-at-salon.jpg",
                  // width:  widget.imageWidth == null? MediaQuery.of(context).size.width:widget.imageWidth, ,
                ),
                backgroundDecoration: BoxDecoration(
                  color:!isDarkMode? Colors.white:AppColors().appBgColor2,
                ),
                maxScale: PhotoViewComputedScale.covered * 1.8,
                minScale: PhotoViewComputedScale.contained * 1,
              ),
            ),
            Positioned(
              top: 53,
              left: 10,
              child: IconButton(
                splashRadius: 30,
                icon: iconApps.iconImage(
                    imageUrl: iconApps.backArrow2,
                    imageColor: !isDarkMode? Colors.black : appColors.textHeadingColor1,
                    iconSize: Size(21, 21)
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

