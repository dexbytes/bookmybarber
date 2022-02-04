import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/model/main_app_state_model.dart';

import 'package:base_flutter_app/src/widgets/alerts/error_alert.dart';

abstract class VerificationCodeState {
  /*VerificationCodeModel verificationCodeModel;
  VerificationCodeState({this.verificationCodeModel});
  void updateModel({verificationCodeModel}) {
    this.verificationCodeModel = verificationCodeModel;
  }

  get getVerificationCodeModel => verificationCodeModel;*/
}

class VerificationCodeInitStat extends VerificationCodeState {}
/*
class VerificationCodeInProgressState extends VerificationCodeState {
  Map requestData;
  VerificationCodeInProgressState({this.requestData});
}

class VerificationCodeErrorState extends VerificationCodeState {
  VerificationCodeErrorState({BuildContext context, String errorMessage}) {
    ErrorAlert(context: context, message: errorMessage);
  }
}

class VerificationCodeDoneState extends VerificationCodeState {
  VerificationCodeModel verificationCodeModel;
  VerificationCodeDoneState({this.verificationCodeModel})
      : super(verificationCodeModel: verificationCodeModel);
  @override
  String toString() => ' $verificationCodeModel }';
}

class VerificationCodeResendDoneState extends VerificationCodeState {
  VerificationCodeModel verificationCodeModel;
  VerificationCodeResendDoneState({this.verificationCodeModel})
      : super(verificationCodeModel: verificationCodeModel);
  @override
  String toString() => ' $verificationCodeModel }';
}

class SignInVerificationDoneState extends VerificationCodeState {
  SignInModel signInModel;
  SignInVerificationDoneState({this.signInModel});
  @override
  String toString() => ' $signInModel }';
}*/
