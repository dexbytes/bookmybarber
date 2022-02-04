import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/app_utility/app_navigator/app_navigator.dart';
import 'package:base_flutter_app/src/model/main_app_state_model.dart';
import 'package:base_flutter_app/src/widgets/alerts/error_alert.dart';

abstract class SignUpState {
  /* SignUpModel signUpModel;
  SignUpState({this.signUpModel});
  void updateModel({signUpModel}) {
    this.signUpModel = signUpModel;
  }

  get getSignUpModel => signUpModel;*/
}

class SignUpInitStat extends SignUpState {}
/*
class SignUpInProgressState extends SignUpState {
  Map requestData;
  SignUpInProgressState({this.requestData});
}

class SignUpErrorState extends SignUpState {
  SignUpErrorState(
      {BuildContext context, String errorMessage, String emailId}) {
    ErrorAlert(
        context: context,
        message: errorMessage,
        callBackYes: (mContext) {
          appNavigator.popBackStack(mContext);
          appNavigator.popBackStack(context);
          appNavigator.launchSignInPage(context, userEmail: emailId);
        });
  }
}

class SignUpInDoneState extends SignUpState {
  SignUpModel signUpModel;
  SignUpInDoneState({this.signUpModel}) : super(signUpModel: signUpModel);
  @override
  String toString() => ' $signUpModel }';
}*/
