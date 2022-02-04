import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/api_calling/app_api_function.dart';
import 'package:base_flutter_app/src/bloc/verification_code_bloc/verification_code_event.dart';
import 'package:base_flutter_app/src/bloc/verification_code_bloc/verification_code_state.dart';

class VerificationCodeBloc
    extends Bloc<VerificationCodeEvent, VerificationCodeState> {
  VerificationCodeBloc() : super(VerificationCodeInitStat());

  @override
  Stream<VerificationCodeState> mapEventToState(
      VerificationCodeEvent event) async* {
    /* if (event is SubmitVerificationCodeEvent) {
      yield VerificationCodeInProgressState();
      Map data = event.requestData;
      try {
        LoadingWidget.startLoadingWidget(event.mContext);
        var response = await apiRequest.submitVerificationCode(
            context: event.mContext, userDetails: data);
        LoadingWidget.endLoadingWidget(event.mContext);
        if (response != null &&
            response.status &&
            response.responseData != null) {
          VerificationCodeModel resultBean;
          projectUtil.printP(response.responseData);
          resultBean = VerificationCodeModel.fromJson(
              json.decode(response.responseData));
          if (resultBean != null && resultBean.data != null) {
            yield VerificationCodeDoneState(verificationCodeModel: resultBean);
          } else {
            yield VerificationCodeErrorState(
                context: event.mContext, errorMessage: response.message);
          }
        } else {
          yield VerificationCodeErrorState(
              context: event.mContext, errorMessage: response.message);
        }
      } catch (e) {
        print(e);
        yield VerificationCodeErrorState(
            context: event.mContext, errorMessage: "Something went wrong");
      }
    } else if (event is SubmitResendVerificationCodeEvent) {
      yield VerificationCodeInProgressState();
      Map data = event.requestData;
      try {
        LoadingWidget.startLoadingWidget(event.mContext);
        var response = await apiRequest.submitReSendVerificationCode(
            context: event.mContext, userDetails: data);
        LoadingWidget.endLoadingWidget(event.mContext);
        if (response != null &&
            response.status &&
            response.responseData != null) {
          VerificationCodeModel resultBean;
          projectUtil.printP(response.responseData);
          resultBean = VerificationCodeModel.fromJson(
              json.decode(response.responseData));
          if (resultBean != null && resultBean.data != null) {
            yield VerificationCodeResendDoneState(
                verificationCodeModel: resultBean);
            yield VerificationCodeErrorState(
                context: event.mContext, errorMessage: resultBean.data.note);
          } else {
            yield VerificationCodeErrorState(
                context: event.mContext, errorMessage: response.message);
          }
        } else {
          yield VerificationCodeErrorState(
              context: event.mContext, errorMessage: response.message);
        }
      } catch (e) {
        print(e);
        yield VerificationCodeErrorState(
            context: event.mContext, errorMessage: "Something went wrong");
      }
    }*/
  }
}
