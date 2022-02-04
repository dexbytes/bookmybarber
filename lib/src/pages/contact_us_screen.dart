import 'dart:io';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    //

    //
    //
    appDimens.appDimensFind(context: context);

    //Return main view
    return Container(
      color: appColors.textNormalColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(appDimens.widthFullScreen(), 60),
            child: TitleWithBackArrow(
              appBarColor: appColors.textNormalColor,
              showBackArrow: true,
              title: 'Contact Us',
              backArrowCallback: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: 'https://webbabyshower.com/privacy-policy/',
                onPageStarted: (String url) {
                  setState(() {
                    isLoading = true;
                  });
                },
                onPageFinished: (String url) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              !isLoading ? Container() : loadingWidget.loadViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
