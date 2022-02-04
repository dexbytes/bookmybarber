import 'dart:io';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';

class LoadingWidget {
  endLoadingPopUp(BuildContext context) {
    Navigator.pop(context);
  }

  startLoadingPopUp(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(appColors.loaderColor),
              ),
            ),
          );
        });
  }

  //It is simple transparent bg loader user for any view not like popup loader
  loadViewWidget({double loaderSize = 50}) => Center(
        child: SizedBox.fromSize(
          size: Size.square(loaderSize),
          child: (Platform.isIOS || Platform.isMacOS)
              ? Center(
                  child: SizedBox(
                    height: loaderSize,
                    width: loaderSize,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          appColors.loaderColor),
                    ),
                  ),
                )
              : Center(
                  child: SizedBox(
                    height: loaderSize,
                    width: loaderSize,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          appColors.loaderColor),
                    ),
                  ),
                ),
        ),
      );
}

LoadingWidget loadingWidget = LoadingWidget();
