import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object> get props => [];
}

class SubmitUserDetailsEvent extends SignUpEvent {
  /* final Map requestData;
  final BuildContext mContext;
  SubmitUserDetailsEvent({this.requestData, this.mContext});
  @override
  String toString() => 'RemoveProduct { index: $requestData }';*/
}
