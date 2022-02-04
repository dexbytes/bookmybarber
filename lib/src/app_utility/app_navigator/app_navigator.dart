import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_screens_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_event.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:base_flutter_app/src/pages/verification_code_screen.dart';

class AppNavigator {
  //SignUpScreen
  void launchSignUpPage(BuildContext context, {bool canBackArrow = false}) {
    Navigator.push(
      context,
      SlideRightRoute(widget: SignUpPage()),
    );
  }

  void launchDashBoardScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        SlideRightRoute(widget: DashBoardPage()),
        ModalRoute.withName("dashBoardScreen"));
  }

  Future<void> launchLogOutAndSign(BuildContext context) async {
    MainAppBloc mainAppBloc = MainAppBloc();
    mainAppBloc.add(LogOutEvent(context: context));
  }

  //SignInScreen
  void launchSignInPage(BuildContext context,
      {String userEmail = "", bool canBackArrow = false}) {
    Navigator.push(
      context,
      SlideRightRoute(
          widget: SignInPage(
        userEmailId: userEmail,
        canBackArrow: canBackArrow,
      )),
    );
  }

  //SignInScreen
  void launchVerificationCodePage(BuildContext context,
      {String userEmail = ""}) {
    Navigator.push(
      context,
      SlideRightRoute(
          widget: VerificationCodePage(
        userEmailId: userEmail,
      )),
    );
  }

  void popBackStack(BuildContext context) {
    Navigator.pop(context);
  }
}

AppNavigator appNavigator = AppNavigator();
