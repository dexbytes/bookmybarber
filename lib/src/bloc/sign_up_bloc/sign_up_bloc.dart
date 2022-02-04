import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/api_calling/app_api_function.dart';
import 'package:base_flutter_app/src/bloc/sign_up_bloc/sign_up_event.dart';
import 'package:base_flutter_app/src/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitStat());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    //   if (event is SubmitUserDetailsEvent) {
    //     yield SignUpInProgressState();
    //     Map data = event
    //             .requestData /*{
    //       "username": signupUserInfo.userName,
    //       "password": signupUserInfo.password,
    //       "fcm_token": deviceToken ?? "",
    //       "device_type": deviceType,
    //       "device_id": deviceId,
    //       "device_name": deviceName
    //     }*/
    //         ;
    //     String enteredEmail = event.requestData["email"];
    //     try {
    //       LoadingWidget.startLoadingWidget(event.mContext);
    //       AuthBase? _auth =  Auth();
    //       String fcmUid = await _auth.registerUsingEmailPassword(
    //           name: enteredEmail, email: enteredEmail, password: "$enteredEmail");
    //       if (fcmUid != null && fcmUid.trim().length > 0) {
    //         data["fcm_id"] = fcmUid;
    //       } else {
    //         /*LoadingWidget.endLoadingWidget(event.mContext);
    //         yield SignUpErrorState(
    //             context: event.mContext,
    //             errorMessage:
    //                 "Email id \"$enteredEmail\" already taken by another",
    //             emailId: enteredEmail);*/
    //       }
    //       var response = await apiRequest.signUpUser(
    //           context: event.mContext, userDetails: data);
    //       LoadingWidget.endLoadingWidget(event.mContext);
    //       if (response != null &&
    //           response.status &&
    //           response.responseData != null) {
    //         SignUpModel resultBean;
    //         projectUtil.printP(response.responseData);
    //         await sharedPreferencesFile.saveStr(
    //             userAutoLoginDetails, json.encode(data));
    //         resultBean = SignUpModel.fromJson(json.decode(response.responseData));
    //         if (resultBean != null && resultBean.data != null) {
    //           yield SignUpInDoneState(signUpModel: resultBean);
    //         } else {
    //           yield SignUpErrorState(
    //               context: event.mContext,
    //               errorMessage: response.message,
    //               emailId: enteredEmail);
    //         }
    //       } else {
    //         yield SignUpErrorState(
    //             context: event.mContext,
    //             errorMessage: response.message,
    //             emailId: enteredEmail);
    //       }
    //     } catch (e) {
    //       print(e);
    //       yield SignUpErrorState(
    //           context: event.mContext, errorMessage: "Something went wrong");
    //     }
    //   }
  }
}
