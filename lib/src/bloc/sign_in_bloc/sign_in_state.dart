import 'package:base_flutter_app/src/model/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/app_utility/app_navigator/app_navigator.dart';
import 'package:base_flutter_app/src/widgets/alerts/error_alert.dart';

abstract class SignInState {
  SignInModel? signInModel;
  SignInState({this.signInModel});
  void updateModel({signInModel}) {
    this.signInModel = signInModel;
  }

  get getSignInModel => signInModel;
}

class SignInInitStat extends SignInState {}

class SignInInProgressState extends SignInState {
  Map? requestData;
  SignInInProgressState({this.requestData});
}

class SignInErrorState extends SignInState {
  SignInErrorState(
      {BuildContext? context, String? errorMessage, String? emailId}) {
    ErrorAlert(
        context: context!,
        message: errorMessage,
        callBackYes: (mContext) {
          appNavigator.popBackStack(mContext);
          // appNavigator.popBackStack(context);
          // appNavigator.launchVerificationCodePage(context, userEmail: emailId);
        });
  }
}

class SignInDoneState extends SignInState {
  SignInModel? signInModelOld;
  SignInDoneState({this.signInModelOld}) : super(signInModel: signInModelOld);
  @override
  String toString() => ' $signInModel }';
}

class BackGroundSignInDoneState extends SignInState {
  SignInModel? signInModelOld;
  BackGroundSignInDoneState({this.signInModelOld})
      : super(signInModel: signInModelOld);
  @override
  String toString() => ' $signInModel }';
}
