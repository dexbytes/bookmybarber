import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/api_calling/app_api_function.dart';
import 'package:base_flutter_app/src/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:base_flutter_app/src/bloc/sign_in_bloc/sign_in_state.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitStat());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SubmitSignInEvent) {
      yield SignInInProgressState();
      Map data = event.requestData!;
      String enteredEmail = event.requestData!["email"];
      try {
        loadingWidget.startLoadingPopUp(event.mContext!);

        String deviceToken = await sharedPreferencesFile.readStr(deviceTokenC);
        String deviceId = await sharedPreferencesFile.readStr(deviceIdC);
        String deviceType = await sharedPreferencesFile.readStr(deviceTypeC);
        String deviceName = deviceType == "1" ? "android" : "ios";

        data["fcmToken"] = deviceToken;
        data["deviceType"] = deviceType;
        data["deviceId"] = deviceId;
        data["deviceName"] = deviceName;

        var response = await apiRequest.submitSignIn(
            context: event.mContext!, userDetails: data);
        loadingWidget.endLoadingPopUp(event.mContext!);
        //Store login data
        await sharedPreferencesFile.saveStr(
            userAutoLoginDetails, json.encode(data));
        if (response != null &&
            response.status &&
            response.responseData != null) {
          /* SignInModel resultBean;
          projectUtil.printP(response.responseData);
          resultBean = SignInModel.fromJson(json.decode(response.responseData));
          if (resultBean != null && resultBean.data != null) {
            String loggedInUserDetails = response.responseData;
            await sharedPreferencesFile.saveStr(
                loggedInUserApiResponse, loggedInUserDetails);
            ProfileSetUpScreens profileSetUpScreens;
            if (event.mContext! != null) {
              MainAppBloc mainAppBloc =
                  BlocProvider.of<MainAppBloc>(event.mContext!);
              mainAppBloc.add(UpdateLoggedInUserDetailsEvent(resultBean));
              String userId = resultBean.data.loginDetailModel.id;
              await mainAppBloc.getUserProfileApi(userId: userId);
              profileSetUpScreens = await mainAppBloc.getProfileSetUpStep();
            }
            await sharedPreferencesFile.saveBool(isUserLoggedInC, true);

            yield SignInDoneState(
                signInModel: resultBean,
                profileSetUpScreens: profileSetUpScreens);
          } else {
            yield SignInErrorState(
                context: event.mContext!,
                errorMessage: response.message,
                emailId: enteredEmail);
          }*/
        } else {
          yield SignInErrorState(
              context: event.mContext!,
              errorMessage: response.message,
              emailId: enteredEmail);
        }
      } catch (e) {
        print(e);
        yield SignInErrorState(
            context: event.mContext!, errorMessage: "Something went wrong");
      }
    } else if (event is SubmitBackGrownSignInEvent) {
      yield SignInInProgressState();
      Map data = event.requestData!;
      String enteredEmail = event.requestData!["email"];
      try {
        loadingWidget.startLoadingPopUp(event.mContext!);
        String deviceToken = await sharedPreferencesFile.readStr(deviceTokenC);
        String deviceId = await sharedPreferencesFile.readStr(deviceIdC);
        String deviceType = await sharedPreferencesFile.readStr(deviceTypeC);
        String deviceName = deviceType == "1" ? "android" : "ios";

        data["fcmToken"] = deviceToken;
        data["deviceType"] = deviceType;
        data["deviceId"] = deviceId;
        data["deviceName"] = deviceName;

        var response = await apiRequest.submitSignIn(
            context: event.mContext!, userDetails: data);
        loadingWidget.endLoadingPopUp(event.mContext!);
        //Store login data
        await sharedPreferencesFile.saveStr(
            userAutoLoginDetails, json.encode(data));
        if (response != null &&
            response.status &&
            response.responseData != null) {
          /*
          SignInModel resultBean;
          projectUtil.printP(response.responseData);
          resultBean = SignInModel.fromJson(json.decode(response.responseData));
          if (resultBean != null && resultBean.data != null) {
            await sharedPreferencesFile.saveBool(isUserLoggedInC, true);
            //Store loggedIn user details
            String loggedInUserDetails = response.responseData;
            await sharedPreferencesFile.saveStr(
                loggedInUserApiResponse, loggedInUserDetails);
            if (event.mContext! != null) {
              MainAppBloc mainAppBloc =
                  BlocProvider.of<MainAppBloc>(event.mContext!);
              mainAppBloc.add(UpdateLoggedInUserDetailsEvent(resultBean));
            }
            yield BackGroundSignInDoneState(signInModel: resultBean);
          } else {
            yield SignInErrorState(
                context: event.mContext!,
                errorMessage: response.message,
                emailId: enteredEmail);
          }*/
        } else {
          yield SignInErrorState(
              context: event.mContext!,
              errorMessage: response.message,
              emailId: enteredEmail);
        }
      } catch (e) {
        print(e);
        yield SignInErrorState(
            context: event.mContext!, errorMessage: "Something went wrong");
      }
    }
  }
}
