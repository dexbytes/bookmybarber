import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/api_calling/api_constant.dart';
import 'package:base_flutter_app/src/api_calling/api_request.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/model/app_version_bean.dart';
import 'package:base_flutter_app/src/values/app_string.dart';

abstract class ApiCall {
  //Get otp
  Future<dynamic> loinUser({context, userDetails});
  Future<dynamic> signUpUser({context, userDetails});
  Future<dynamic> submitSignIn({context, userDetails});
  Future<dynamic> submitChangePassword({context, userDetails});
  Future<dynamic> submitVerificationCode({context, userDetails});
  Future<dynamic> submitReSendVerificationCode({context, userDetails});

  Future<dynamic> logOut({context});
  Future<dynamic> checkAppVersion({required int deviceType});
  Future<dynamic> getAboutUsGet({context});
  Future<dynamic> getUserProfileApi({requestData});

  Future<dynamic> uploadChatMediaAwsApi(
      {context, String loggedInUserId, List<String> imagePath = const []});
  Future<dynamic> dispose();
}

class ApiRequest implements ApiCall {
  static String? authorization = "";
  static ApiRequestMain? apiRequestMain;

  //Get Auth Token
  Future<String> token({bool isFirstTime = false}) async {
    //Call First time when
    if (isFirstTime) {
      sharedPreferencesFile.readStr(accessTokenC).then((value) {
        authorization = value;

        return authorization;
      });
    } else if (authorization!.trim() == "") {
      authorization = await sharedPreferencesFile.readStr(accessTokenC);
    }
    return authorization!;
  }

  ApiRequest() {
    apiRequestMain = ApiRequestMain();
    //Get authToken
    token(isFirstTime: true);
    // _userInfoFetcher = PublishSubject<UserInfoBean>();
    projectUtil.printP("Hello");
  }

  @override
  Future dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future checkAppVersion({required int deviceType}) async {
    try {
      try {
        authorization = await token();
        //authorization = "70a6ba8d-5c6e-4d23-b9df-24d61613c744";
      } catch (e) {
        print(e);
      }
      var requestBody;
      if (deviceType == 1) {
        requestBody = {
          "deviceType": "IOS",
        };
      } else {
        requestBody = {
          "deviceType": "ANDROID",
        };
      }

      String url = checkAppVersionC;
      AppVersionBean mAppVersionBean;
      var result = await ApiRequestMain().apiRequestGetAuthorize(
          url: url,
          bodyData: requestBody,
          isLoader: false,
          authorization: authorization);
      if (result.status && result.responseData != null) {
        projectUtil.printP("data" + result.responseData);
        try {
          mAppVersionBean =
              AppVersionBean.fromJson(json.decode(result.responseData));
          if (mAppVersionBean != null) {
            return mAppVersionBean;
          }
        } catch (e) {
          print(e);
        }
      } else {
        return result;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future loinUser({context, userDetails}) async {
    try {
      if (userDetails != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        var requestBody = json.encode(userDetails);
        var response = await apiRequestMain!.apiRequestPost(
            url: "userLoginApiC", bodyData: requestBody, isLoader: false);
        if (response.status && response.responseData != null) {
          try {
            /* UserLoggedInProfileBean mUserLoggedInProfileBean;
            projectUtil.printP(response.responseData);
            mUserLoggedInProfileBean = UserLoggedInProfileBean.fromJson(
                          json.decode(response.responseData));*/
            return null;
          } catch (e) {
            print(e);
            errorPopUp(context: context);
            return null;
          }
        }
        errorPopUp(context: context, response: response);
        return null;
      } else {
        errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future signUpUser({context, userDetails}) async {
    try {
      if (userDetails != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        var requestBody = json.encode(userDetails);
        //var requestBody = utf8.encode(requestBody1);
        // var requestBody = userDetails;
        var response = await apiRequestMain!.apiRequestPost(
            url: userSignUpApiC, bodyData: requestBody, isLoader: false);
        return response;
        /*  if (response.status && response.responseData != null) {
          try {
            return response.responseData;
          } catch (e) {
            print(e);
            errorPopUp(context: context);
            return null;
          }
        }
        // errorPopUp(context: context,response: response);
        return null;*/
      } else {
        //errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future submitVerificationCode({context, userDetails}) async {
    try {
      if (userDetails != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        var requestBody = json.encode(userDetails);
        //var requestBody = utf8.encode(requestBody1);
        // var requestBody = userDetails;
        var response = await apiRequestMain!.apiRequestPost(
            url: codeVerificationApiC, bodyData: requestBody, isLoader: false);
        return response;
        /*  if (response.status && response.responseData != null) {
          try {
            return response.responseData;
          } catch (e) {
            print(e);
            errorPopUp(context: context);
            return null;
          }
        }
        // errorPopUp(context: context,response: response);
        return null;*/
      } else {
        //errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future submitReSendVerificationCode({context, userDetails}) async {
    try {
      if (userDetails != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        var requestBody = json.encode(userDetails);
        //var requestBody = utf8.encode(requestBody1);
        // var requestBody = userDetails;
        var response = await apiRequestMain!.apiRequestPost(
            url: resendVerificationApiC,
            bodyData: requestBody,
            isLoader: false);
        return response;
        /*  if (response.status && response.responseData != null) {
          try {
            return response.responseData;
          } catch (e) {
            print(e);
            errorPopUp(context: context);
            return null;
          }
        }
        // errorPopUp(context: context,response: response);
        return null;*/
      } else {
        //errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future submitSignIn({context, userDetails}) async {
    try {
      if (userDetails != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        var requestBody = json.encode(userDetails);
        //var requestBody = utf8.encode(requestBody1);
        // var requestBody = userDetails;
        var response = await apiRequestMain!.apiRequestPost(
            url: userSignApiC, bodyData: requestBody, isLoader: false);
        return response;
        /*  if (response.status && response.responseData != null) {
          try {
            return response.responseData;
          } catch (e) {
            print(e);
            errorPopUp(context: context);
            return null;
          }
        }
        // errorPopUp(context: context,response: response);
        return null;*/
      } else {
        //errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future submitChangePassword({context, userDetails}) async {
    try {
      if (userDetails != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        var requestBody = json.encode(userDetails);
        var response = await apiRequestMain!.apiRequestPost(
            url: changePasswordApiC, bodyData: requestBody, isLoader: false);
        return response;
      } else {
        //errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future getUserProfileApi({requestData}) async {
    try {
      if (requestData != null) {
        await token(isFirstTime: false);
        //encode Map to JSON
        // var requestBody = json.encode(requestData);
        var response = await apiRequestMain!
            .apiRequestGet(url: "", bodyData: requestData, isLoader: false);
        if (response.status && response.responseData != null) {
          try {
            return response;
          } catch (e) {
            print(e);
            // errorPopUp(context: context);
            return null;
          }
        }
        //errorPopUp(context: context, response: response);
        return null;
      } else {
        // errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      //errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future uploadChatMediaAwsApi(
      {context,
      String? loggedInUserId,
      List<String> imagePath = const []}) async {
    try {
      if (loggedInUserId != null && imagePath.isNotEmpty) {
        await token(isFirstTime: false);
        //encode Map to JSON
        ;
        try {
          //newImageFileList.add(imagePath);
          //Image upload on AWS serverv
          if (imagePath.isNotEmpty) {
            return await new ApiRequestMain().apiRequestUploadImageAws(
                imageOf: "chatMedia",
                loggedInUserId: loggedInUserId,
                isThumbnailsCreate: false,
                imageMainFolderName: "$loggedInUserId",
                imageSubFolderName: "chatMediaFile",
                newImageFileList: imagePath,
                oldImageFileListForUpload: []);
          } else {
            return null;
          }
        } catch (e) {
          print(e);
        }
        // errorPopUp(context: context, response: response);
        return null;
      } else {
        errorPopUp(context: context);
        return null;
      }
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future logOut({context}) async {
    try {
      var deviceid = await sharedPreferencesFile.readStr(deviceIdC);
      var authorization = await sharedPreferencesFile.readStr(accessTokenC);
      Map data = {"device_id": deviceid};
      //encode Map to JSON
      var requestBody = json.encode(data);
      /* var response = await apiRequestMain!.apiRequestPostAuthorize(
          logoutApiC, requestBody, false, authorization);
      if (response.status) {
        return response;
      }
      errorPopUp(context: context, response: response);

      */
      return null;
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  @override
  Future getAboutUsGet({context}) async {
    try {
      var response = await apiRequestMain!
          .apiRequestGet(url: aboutUsApiC, bodyData: null, isLoader: false);
      if (response.status && response.responseData != null) {
        try {
          return null;
        } catch (e) {
          print(e);
          errorPopUp(context: context);
          return null;
        }
      }
      errorPopUp(context: context, response: response);
      return null;
    } catch (e) {
      print(e);
      errorPopUp(context: context);
      return null;
    }
  }

  //Common Error popup
  Future<void>? errorPopUp({context, response, message}) {
    if (context != null && response != null) {
      ErrorAlert(
          context: context,
          isItForInternet: true,
          alertTitle: appString.appName,
          message: response.message,
          callBackYes: (context) async {
            Navigator.pop(context);
//        if (response.statusCode == 401) {
//          await sharedPreferencesFile.clearAll();
//        }
          });
    } else if (context != null && message != null) {
      ErrorAlert(
          context: context,
          isItForInternet: true,
          alertTitle: appString.appName,
          message: message,
          callBackYes: (context) async {
            Navigator.pop(context);
          });
    } else if (context != null) {
      String message = "No Data Found";
      ErrorAlert(
          context: context,
          isItForInternet: true,
          alertTitle: appString.appName,
          message: message,
          callBackYes: (context) async {
            Navigator.pop(context);
//        if (response.statusCode == 401) {
//          await sharedPreferencesFile.clearAll();
//        }
          });
    }

    return null;
  }
}

final apiRequest = ApiRequest();
