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
