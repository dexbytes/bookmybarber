import 'package:equatable/equatable.dart';

abstract class VerificationCodeEvent extends Equatable {
  const VerificationCodeEvent();
  @override
  List<Object> get props => [];
}
/*
class SubmitVerificationCodeEvent extends VerificationCodeEvent {
  final Map requestData;
  final BuildContext mContext;
  SubmitVerificationCodeEvent({this.requestData, this.mContext});
  @override
  String toString() => 'RemoveProduct { index: $requestData }';
}

class SubmitResendVerificationCodeEvent extends VerificationCodeEvent {
  final Map requestData;
  final BuildContext mContext;
  SubmitResendVerificationCodeEvent({this.requestData, this.mContext});
  @override
  String toString() => 'RemoveProduct { index: $requestData }';
}

class BackGrownSignInEvent extends VerificationCodeEvent {
  final Map requestData;
  final BuildContext mContext;
  BackGrownSignInEvent({this.requestData, this.mContext});
  @override
  String toString() => 'RemoveProduct { index: $requestData }';
}*/
