import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/api_calling/upload_to_s3_upload.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'api_constant.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';

//Response call back
class Response {
  final bool status;
  final String message;
  final int statusCode;
  final String responseData;
  Response(this.status, this.message, this.statusCode, this.responseData);

  Response.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        statusCode = json['statusCode'],
        responseData = json['data'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'statusCode': statusCode,
        'responseData': responseData,
      };
}

//Basic parser Old version
/*class ParserBasic {
  bool status;
  String message;
  var data = "";
  ParserBasic({this.status, this.message, this.data});
  ParserBasic.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'] : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}*/

//Basic parser  version
class ParserBasic {
  bool status = false;
  String message = "";
  var data;
  ParserBasic({this.status = false, this.message = "", this.data});
  ParserBasic.fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'] == "SUCCESS" ? true : false;
    } catch (e) {
      print(e);
    }
    try {
      //bool isError = json['error']==false?true:false;
      projectUtil.printP("$status");
      message = json['message'];
    } catch (e) {
      print(e);
    }
    try {
      data = status ? (json['data'] != null ? json['data'] : null) : null;
    } catch (e) {
      print(e);
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = this.status;
    data['message'] = this.message;
    data['success'] = this.data;
    return data;
  }
}

//Main API calling Class
class ApiRequestMain {
  int connectTimeout = 10;
  int writeTimeout = 10;
  int readTimeout = 20;

  String checkInternetMessage = 'Please check internet connection';
  String tryAgain = 'Something went wrong please try again';
  var headers = {
    'Content-Type': 'application/json',
  };

  //Post type request function with input data
  Future<Response> apiRequestPost(
      {required String? url,
      required bodyData,
      headersTemp,
      String? authorization,
      bool isLoader = false}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }
        final response = await http
            .post(Uri.parse(fullUrl), headers: headers, body: bodyData)
            .timeout(Duration(seconds: readTimeout));
        projectUtil.printP("$response");
        //Check response is empty or not
        if (response != null) {
          //Check data body is in response
          if (response.body != null) {
            var responseBody = response.body;
            print("$responseBody");
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              var data = mParserBasic.data;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        try {
          if (e.runtimeType == SocketException ||
              e.runtimeType == TimeoutException) {
            projectUtil.printP("Please check internet connection");
            Response mResponse =
                Response(false, checkInternetMessage, -1000, "");
            return mResponse;
          } else {
            projectUtil.printP("Error in requested api: $e");
            Response mResponse = Response(false, tryAgain, 1000, "");
            return mResponse;
          }
        } catch (e) {
          projectUtil.printP("Error in requested api: " + e.toString());
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -1000, "");
      return mResponse;
    }
  }

  //Post type request function with input data
  Future<Response> apiRequestPost1(String? url, bodyData, bool isLoader) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        final response = await http
            .post(Uri.parse(fullUrl), headers: headers, body: bodyData)
            .timeout(Duration(seconds: readTimeout));
        //Check response is empty or not
        if (response != null) {
          //Checking is api called successfully
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              //Check Data is exist or not
              Response mResponse = Response(true, mParserBasic.message,
                  response.statusCode, responseBody.toString());
              return mResponse;
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        if (e.runtimeType == SocketException ||
            e.runtimeType == TimeoutException) {
          projectUtil.printP("Please check internet connection");
          Response mResponse = Response(false, checkInternetMessage, -1000, "");
          return mResponse;
        } else {
          projectUtil.printP("Error in requested api: $e");
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(" appString.noInternetConnection");
      Response mResponse =
          Response(false, AppString().noInternetConnection, -2000, "");
      return mResponse;
    }
  }

  //Post type request function with input data
  Future<Response> apiRequestPostAuthorize(
      String? url, bodyData, bool isLoader, String? authorization) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }

        final response = await http
            .post(Uri.parse(fullUrl), headers: headers, body: bodyData)
            .timeout(Duration(seconds: readTimeout));
        //Check response is empty or not
        if (response != null) {
          //Check is response coming from server
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            projectUtil.printP("$responseBody");
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              var data = mParserBasic.data;
              //Check Data is exist or not
              if (data != null) {
                //var dataJson = json.encode(data);
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        if (e.runtimeType == SocketException ||
            e.runtimeType == TimeoutException) {
          projectUtil.printP("Please check internet connection");
          print("Error in requested api: $e");
          Response mResponse = Response(false, checkInternetMessage, -1000, "");
          return mResponse;
        } else {
          projectUtil.printP("Error in requested api: $e");
          print("Error in requested api: $e");
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      Response mResponse =
          Response(false, appString.noInternetConnection, -2000, "");
      return mResponse;
    }
  }

  //Get type request function with input data
  Future<Response> apiRequestGet(
      {String? url, bodyData, bool isLoader = false}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        String values = "";
        if (bodyData != null) {
          int i = 0;
          for (var data in bodyData.entries) {
            String key = data.key;
            if (key != "") {
              String localValue = "?" + data.key + "=" + data.value;
              if (i == 0) {
                values = localValue;
              } else {
                values = values + "&&" + localValue;
              }
            } else {
              String localValue = data.value;
              if (i == 0) {
                values = "/" + localValue;
              } else {
                values = values + "/" + localValue;
              }
            }
            i++;
          }
        }

        fullUrl = fullUrl + values;
        final response = await http
            .get(Uri.parse(fullUrl), headers: headers)
            .timeout(Duration(seconds: readTimeout));
        //Check response is empty or not
        if (response != null) {
          //Check is response coming from server
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status != null) {
              var data = mParserBasic;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse = Response(false,
                "Server Error Please try again", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again", 1000, "");
          return mResponse;
        }
      } catch (e) {
        if (e.runtimeType == SocketException ||
            e.runtimeType == TimeoutException) {
          projectUtil.printP("Please check internet connection");
          Response mResponse = Response(false, checkInternetMessage, -1000, "");
          return mResponse;
        } else {
          projectUtil.printP("Error in requested api: $e");
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -2000, "");
      return mResponse;
    }
  }

  //Get type request function with input data
  Future<Response> apiRequestGetAuthorize(
      {String? url,
      var bodyData,
      bool isLoader = false,
      String? authorization}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        String values = "";
        if (bodyData != null) {
          int i = 0;
          for (var data in bodyData.entries) {
            String key = data.key;
            if (key != "") {
              String localValue = data.key + "=" + data.value;
              if (i == 0) {
                values = localValue;
              } else {
                values = values + "&&" + localValue;
              }
            } else {
              String localValue = data.value;
              if (i == 0) {
                values = "/" + localValue;
              } else {
                values = values + "/" + localValue;
              }
            }
            i++;
          }
        }

        fullUrl = fullUrl + values;
        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }
        final response = await http
            .get(Uri.parse(fullUrl), headers: headers)
            .timeout(Duration(seconds: readTimeout));
        //Check response is empty or not
        if (response != null) {
          //Check is response coming from server
          if (response.body != null) {
            var responseBody = response.body;
            ParserBasic? mParserBasic;
            //Parse message and data from response body
            try {
              mParserBasic = ParserBasic.fromJson(json.decode(responseBody));
            } catch (e) {
              print(e);
            }
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status != null) {
              var data = mParserBasic;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic!.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse = Response(false,
                "Server Error Please try again", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again", 1000, "");
          return mResponse;
        }
      } catch (e) {
        if (e.runtimeType == SocketException ||
            e.runtimeType == TimeoutException) {
          projectUtil.printP("Please check internet connection");
          Response mResponse = Response(false, checkInternetMessage, -1000, "");
          return mResponse;
        } else {
          projectUtil.printP("Error in requested api: $e");
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -1000, "");
      return mResponse;
    }
  }

  //Put type request function with input data
  Future<Response> apiRequestPut(
      String? url, bodyData, bool isLoader, String? authorization) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }
        final response = await http
            .put(Uri.parse(fullUrl), headers: headers, body: bodyData)
            .timeout(Duration(seconds: readTimeout));
        //Check response is empty or not
        if (response != null) {
          //Check is response coming from server
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status != null) {
              var data = mParserBasic.data;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse = Response(false,
                "Server Error Please try again", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again", 1000, "");
          return mResponse;
        }
      } catch (e) {
        if (e.runtimeType == SocketException ||
            e.runtimeType == TimeoutException) {
          projectUtil.printP("Please check internet connection");
          Response mResponse =
              Response(false, "Please check internet connection", -1000, "");
          return mResponse;
        } else {
          projectUtil.printP("Error in requested api: $e");
          Response mResponse = Response(false, "$e", 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -2000, "");
      return mResponse;
    }
  }

  //update profile image and other media files with text data
  Future<StreamedResponse?> apiRequestMultipartAuthorizeWithBodyData(
      {String? url,
      Map<String, String>? bodyData,
      imageFile,
      bool isLoader = false,
      String? authorization}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }

        // string to uri
        var uri = Uri.parse(fullUrl);
        // create multipart request
        var request = http.MultipartRequest("POST", uri);
        request.headers.addAll(headers);
        try {
          if (imageFile != null) {
            for (var data in imageFile.entries) {
              String key = data.key;
              if (key != "") {
                var localValue = data.value;
                // open a bytestream
                var stream =
                    http.ByteStream(DelegatingStream(localValue.openRead()));
                // get file length
                var length = await localValue.length();
                // multipart that takes file
                var multipartFile = http.MultipartFile("image", stream, length,
                    filename: basename(localValue.path));
                // add file to multipart
                request.files.add(multipartFile);
              }
            }
          } else {
            projectUtil.printP('image file not selected');
          }
        } catch (e) {
          projectUtil.printP("Error in selected image: $e");
        }

        //If no text data
        if (bodyData != null) {
          try {
            request.fields.addAll(bodyData);
          } catch (e) {
            print(e);
          }
        }
        final response = await request.send();
        return response;
      } catch (e) {
        projectUtil.printP("Error in requested api: $e");
        return null;
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      // Response mResponse =  Response(false,  appString.noInternetConnection, -2000, null);
      return null;
    }
  }

  //
  Future<StreamedResponse?> apiRequestMultipartAuthorizeWithBodyDataPatch(
      {String? url,
      Map<String, String>? bodyData,
      imageFile,
      bool isLoader = false,
      String? authorization}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }

        // string to uri
        var uri = Uri.parse(fullUrl);
        // create multipart request
        var request = http.MultipartRequest("PATCH", uri);
        request.headers.addAll(headers);
        try {
          if (imageFile != null) {
            for (var data in imageFile.entries) {
              String key = data.key;
              if (key != "") {
                var localValue = data.value;
                // open a bytestream
                var stream =
                    http.ByteStream(DelegatingStream(localValue.openRead()));
                // get file length
                var length = await localValue.length();
                // multipart that takes file
                var multipartFile = http.MultipartFile(
                    "testFile", stream, length,
                    filename: basename(localValue.path));
                // add file to multipart
                request.files.add(multipartFile);
              }
            }
          } else {
            projectUtil.printP('image file not selected');
          }
        } catch (e) {
          projectUtil.printP("Error in selected image: $e");
        }

        //If no text data
        if (bodyData != null) {
          try {
            request.fields.addAll(bodyData);
          } catch (e) {
            print(e);
          }
        }
        final response = await request.send();
        return response;
      } catch (e) {
        projectUtil.printP("Error in requested api: $e");

        return null;
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      // Response mResponse =  Response(false,  appString.noInternetConnection, -2000, null);
      return null;
    }
  }

  //Update single image
  Future<StreamedResponse?> apiRequestMultipartAuthorizeWithoutBodyData(
      String? url,
      imageKey,
      imageFile,
      bool isLoader,
      String? authorization) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }
        //String to uri
        var uri = Uri.parse(fullUrl);
        // create multipart request
        var request = http.MultipartRequest("POST", uri);
        request.headers.addAll(headers);
        try {
          if (imageFile != null) {
            // open a bytestream
            var stream =
                http.ByteStream(DelegatingStream(imageFile.openRead()));
            // get file length
            var length = await imageFile.length();
            // multipart that takes file
            var multipartFile = http.MultipartFile(imageKey, stream, length,
                filename: basename(imageFile.path));
            // add file to multipart
            request.files.add(multipartFile);
          } else {
            projectUtil.printP('image file not selected');
          }
        } catch (e) {
          projectUtil.printP("Error in selected image: $e");
        }
        final response = await request.send();
        return response;
      } catch (e) {
        projectUtil.printP("Error in requested api: $e");
        return null;
      }
    } else {
      print(appString.noInternetConnection);
      return null;
    }
  }

  //***************************************  patch   *******************************/
  //Post type request function with input data
  Future<Response> apiRequestpatch(
      {required String? url,
      required bodyData,
      headersTemp,
      String? authorization,
      bool isLoader = false}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();

    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }

        final response = await http
            .patch(Uri.parse(fullUrl), headers: headers, body: bodyData)
            .timeout(Duration(seconds: readTimeout));
        projectUtil.printP("$response");
        //Check response is empty or not
        if (response != null) {
          //Check data body is in response
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              var data = mParserBasic.data;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        try {
          if (e.runtimeType == SocketException ||
              e.runtimeType == TimeoutException) {
            projectUtil.printP("Please check internet connection");
            Response mResponse =
                Response(false, checkInternetMessage, -1000, "");
            return mResponse;
          } else {
            projectUtil.printP("Error in requested api: $e");
            Response mResponse = Response(false, tryAgain, 1000, "");
            return mResponse;
          }
        } catch (e) {
          projectUtil.printP("Error in requested api: $e");
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -1000, "");
      return mResponse;
    }
  }

  //Delete type request function with input data
  Future<Response> apiRequestDelete(
      {required String? url,
      String? authorization,
      bool isLoader = false}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }

        final response = await http
            .delete(Uri.parse(fullUrl), headers: headers)
            .timeout(Duration(seconds: readTimeout));
        projectUtil.printP("$response");
        //Check response is empty or not
        if (response != null) {
          //Check data body is in response
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              // var data = mParserBasic.data;
              //Check Data is exist or not
              if (mParserBasic.status) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        try {
          if (e.runtimeType == SocketException ||
              e.runtimeType == TimeoutException) {
            projectUtil.printP("Please check internet connection");
            Response mResponse =
                Response(false, checkInternetMessage, -1000, "");
            return mResponse;
          } else {
            projectUtil.printP("Error in requested api: $e");
            Response mResponse = Response(false, tryAgain, 1000, "");
            return mResponse;
          }
        } catch (e) {
          projectUtil.printP("Error in requested api: $e");
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -1000, "");
      return mResponse;
    }
  }

  //Update single image
  Future<StreamedResponse?> apiRequestMultipartAuthorizeWithoutBodyDataPatch(
      {String? url,
      imageKey,
      imageFile,
      bool isLoader = false,
      String? authorization}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }
        //String to uri
        var uri = Uri.parse(fullUrl);
        // create multipart request
        var request = http.MultipartRequest("PATCH", uri);
        request.headers.addAll(headers);
        try {
          if (imageFile != null) {
            // open a bytestream
            var stream =
                http.ByteStream(DelegatingStream(imageFile.openRead()));
            // get file length
            var length = await imageFile.length();
            // multipart that takes file
            var multipartFile = http.MultipartFile(imageKey, stream, length,
                filename: basename(imageFile.path));
            // add file to multipart
            request.files.add(multipartFile);
          } else {
            projectUtil.printP('image file not selected');
          }
        } catch (e) {
          projectUtil.printP("Error in selected image: $e");
        }
        final response = await request.send();
        return response;
      } catch (e) {
        projectUtil.printP("Error in requested api: $e");
        return null;
      }
    } else {
      print(appString.noInternetConnection);
      return null;
    }
  }

  //Convert multipart response
  Future<dynamic> convert(result) async {
    var response = await http.Response.fromStream(result);
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body != null) {
          var responseBody = response.body;
          ParserBasic mParserBasic =
              ParserBasic.fromJson(json.decode(responseBody));
          //Check Data is exist or not
          if (mParserBasic != null && mParserBasic.status != null) {
            var data = mParserBasic.data;
            //Check Data is exist or not
            if (data != null) {
              Response mResponse = Response(true, mParserBasic.message,
                  response.statusCode, responseBody.toString());
              return mResponse;
            }
            if (mParserBasic.status) {
              Response mResponse = Response(true, mParserBasic.message,
                  response.statusCode, responseBody.toString());
              return mResponse;
            } else {
              Response mResponse =
                  Response(true, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, mParserBasic.message, response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(
              false, "Server Error Please try again", response.statusCode, "");
          return mResponse;
        }
      }
    }
  }

  //Function for check internet
  checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      projectUtil.printP("Connected to Mobile Network");
      Response mResponse =
          Response(true, "Connected to Mobile Network", 1000, "");
      return mResponse;
      //return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      projectUtil.printP("Connected to WiFi");
      Response mResponse = Response(true, "Connected to WiFi", 1000, "");
      return mResponse;
    } else {
      projectUtil.printP("Unable to connect. Please Check Internet Connection");
      Response mResponse =
          Response(false, "Please check internet connection", 1000, "");
      return mResponse;
    }
  }

  Future<Response> apiRequestPostSendFCMNotification(
      {required String? url,
      required bodyData,
      headersTemp,
      String? authorization,
      bool isLoader = false}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = "https://fcm.googleapis.com/fcm/send";
        authorization = 'key=${ConstantC.fcmAuthKey}';
        if (authorization != null) {
          // var headers1 = {HttpHeaders.authorizationHeader: authorization};
          // headers.addAll(headers1);
          headers = {
            'content-type': 'application/json',
            'Authorization': authorization
          };
        }

        final response = await http
            .post(Uri.parse(fullUrl),
                headers: headers,
                body: bodyData,
                encoding: Encoding.getByName('utf-8'))
            .timeout(Duration(seconds: readTimeout));
        projectUtil.printP("$response");
        //Check response is empty or not
        if (response != null) {
          //Check data body is in response
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              var data = mParserBasic.data;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        try {
          if (e.runtimeType == SocketException ||
              e.runtimeType == TimeoutException) {
            projectUtil.printP("Please check internet connection");
            Response mResponse =
                Response(false, checkInternetMessage, -1000, "");
            return mResponse;
          } else {
            projectUtil.printP("Error in requested api: $e");
            Response mResponse = Response(false, tryAgain, 1000, "");
            return mResponse;
          }
        } catch (e) {
          projectUtil.printP("Error in requested api: " + e.toString());
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -1000, "");
      return mResponse;
    }
  }

  Future<Response> apiRequestPostSendFCMNotificationOurServer(
      {required String? url,
      required bodyData,
      headersTemp,
      String? authorization,
      bool isLoader = false}) async {
    //Check Internet connection
    Response isInternetConnected = await checkInternetConnection();
    if (isInternetConnected != null && isInternetConnected.status) {
      try {
        String fullUrl = ConstantC.baseUrl + url!;
        //authorization = 'key=${ConstantC.fcmAuthKey}';

        if (authorization != null) {
          var headers1 = {HttpHeaders.authorizationHeader: authorization};
          headers.addAll(headers1);
        }
        //final response = await http.post(Uri.parse(fullUrl), headers: headers,body:bodyData,encoding: Encoding.getByName('utf-8')).timeout(Duration(seconds: readTimeout));
        final response = await http
            .post(Uri.parse(fullUrl), headers: headers, body: bodyData)
            .timeout(Duration(seconds: readTimeout));
        projectUtil.printP("$response");
        //Check response is empty or not
        if (response != null) {
          //Check data body is in response
          if (response.body != null) {
            var responseBody = response.body;
            //Parse message and data from response body
            ParserBasic mParserBasic =
                ParserBasic.fromJson(json.decode(responseBody));
            //Check Data is exist or not
            if (mParserBasic != null && mParserBasic.status == true) {
              var data = mParserBasic.data;
              //Check Data is exist or not
              if (data != null) {
                Response mResponse = Response(true, mParserBasic.message,
                    response.statusCode, responseBody.toString());
                return mResponse;
              } else {
                Response mResponse = Response(
                    true, mParserBasic.message, response.statusCode, "");
                return mResponse;
              }
            } else {
              Response mResponse = Response(
                  false, mParserBasic.message, response.statusCode, "");
              return mResponse;
            }
          } else {
            Response mResponse =
                Response(false, "Please try again ", response.statusCode, "");
            return mResponse;
          }
        } else {
          Response mResponse = Response(false, "Please try again ", 1000, "");
          return mResponse;
        }
      } catch (e) {
        try {
          if (e.runtimeType == SocketException ||
              e.runtimeType == TimeoutException) {
            projectUtil.printP("Please check internet connection");
            Response mResponse =
                Response(false, checkInternetMessage, -1000, "");
            return mResponse;
          } else {
            projectUtil.printP("Error in requested api: $e");
            Response mResponse = Response(false, tryAgain, 1000, "");
            return mResponse;
          }
        } catch (e) {
          projectUtil.printP("Error in requested api: " + e.toString());
          Response mResponse = Response(false, tryAgain, 1000, "");
          return mResponse;
        }
      }
    } else {
      projectUtil.printP(appString.noInternetConnection);
      Response mResponse =
          Response(false, appString.noInternetConnection, -1000, "");
      return mResponse;
    }
  }

  /*Upload image on aws server Amazon*/
  Future<dynamic> apiRequestUploadImageAws(
      {String? imageOf,
      String? loggedInUserId,
      String? companyId,
      String? imageMainFolderName,
      String? imageSubFolderName,
      bool isThumbnailsCreate = false,
      List<dynamic>? newImageFileList,
      List<dynamic>? oldImageFileListForUpload,
      onProgressUpdate}) async {
    // projectUtil.printP("New Images $newImageFileList Old Images $oldImageFileListForUpload ");

    //Image upload for post/profile
    if (imageOf != null && imageOf.trim() != "") {
      imageOf = imageOf + "_";
    } else if (imageOf == null) {
      imageOf = "";
    }
    String imageNameBase = "wbs_app_$imageOf";
    if (loggedInUserId != null && loggedInUserId.trim() != "") {
      imageNameBase = "wbs_$imageOf" + "uId_$loggedInUserId" + "_";
    }
    String accessKeyId = ConstantC.awsAccessKeyId;
    String secretKeyId = ConstantC.awsSecretKeyId;
    String region = ConstantC.awsRegion;
    String s3Endpoint = ConstantC.awsS3Endpoint;
    String bucketName = ConstantC.awsBucketName;
    String uploadIn = ConstantC.uploadIn;
    String downloadImagePathBaseUrl = ConstantC.awsDownloadImagePathBaseUrl;

    //Delete old image
    if (oldImageFileListForUpload != null &&
        oldImageFileListForUpload.length > 0) {
      //  projectUtil.printP("Old Images $oldImageFileListForUpload ");
    }

    //Upload  image
    if (newImageFileList != null && newImageFileList.length > 0) {
      //List<String> newImageFileListTemp;
      UploadToS3 instance = UploadToS3();
      List<dynamic> newImageFileListTemp = newImageFileList;
      for (int i = 0; i < newImageFileList.length; i++) {
        //String imagePath = newImageFileList[i];
        String imagePath = newImageFileList[i];
        String imagePathTemp =
            newImageFileList[i].toString().replaceAll(" ", "_");

        if (imagePath != null &&
            imagePath.length > 0 &&
            !imagePath.startsWith("http")) {
          String pdfFileName = '';
          try {
            // List abc = imagePath.split('/');
            List abc = imagePathTemp.split('/');
            List abc2 = abc[abc.length - 1].toString().split('.');
            pdfFileName = abc2[0];
          } catch (e) {
            print(e);
          }

          // If Thumbnails not require
          if (isThumbnailsCreate == null || isThumbnailsCreate == false) {
            //get image name from path
            String currentTime =
                DateTime.now().microsecondsSinceEpoch.toString();
            String imageName = "";
            imageName = uploadIn + "/";
            imageName = (companyId != null && companyId != "")
                ? (imageName + companyId + "/")
                : "";
            imageName = (loggedInUserId != null && loggedInUserId != "")
                ? (imageName + loggedInUserId + "/")
                : "";
            imageName =
                (imageMainFolderName != null && imageMainFolderName != "")
                    ? (imageName + imageMainFolderName + "/")
                    : imageName;
            imageName = (imageSubFolderName != null && imageSubFolderName != "")
                ? (imageName + imageSubFolderName + "/")
                : imageName;
            imageName = (pdfFileName != null && pdfFileName != "")
                ? (imageName + pdfFileName + "_")
                : imageName + imageNameBase;
            imageName = imageName +
                currentTime +
                imagePathTemp.substring(imagePathTemp.lastIndexOf('.'));
            print(imageName);
            /*  imageName = imageName +
                currentTime +
                imagePath.substring(imagePath.lastIndexOf('.'));*/

            try {
              //Calling to upload image
              await instance.send(
                  imagePathOfPhone: imagePath,
                  imagePathInS3Bucket: imageName,
                  bucketName: bucketName,
                  accessKeyId: accessKeyId,
                  secretKeyId: secretKeyId,
                  region: region,
                  s3Endpoint: s3Endpoint,
                  onProgressUpdate: (value) {
                    print('$value value');
                    print('$value value');
                    onProgressUpdate?.call(value);
                  });
            } catch (e) {
              print(e);
            }
            //Live Uploaded image path
            String downloadImagePath = downloadImagePathBaseUrl + imageName;
            newImageFileListTemp[i] = downloadImagePath;
            projectUtil
                .printP("New Images $downloadImagePath  && $newImageFileList");
          }
          // If Thumbnails is require
          else if (isThumbnailsCreate != null && isThumbnailsCreate) {
            //************** Live Uploaded image path
            String? downloadImagePath;
            try {
              //get image name from path
              String currentTime =
                  DateTime.now().microsecondsSinceEpoch.toString();
              String imageName = imageNameBase +
                  currentTime +
                  imagePath.substring(imagePath.lastIndexOf('.'));
              //Calling to upload real image
              await instance.send(
                  imagePathOfPhone: imagePath,
                  imagePathInS3Bucket: imageName,
                  bucketName: bucketName,
                  accessKeyId: accessKeyId,
                  secretKeyId: secretKeyId,
                  region: region,
                  s3Endpoint: s3Endpoint,
                  onProgressUpdate: (value) {
                    print('$value value');
                    print('$value value');
                    onProgressUpdate?.call(value);
                  });

              //************** Live Uploaded image path
              downloadImagePath = downloadImagePathBaseUrl + imageName;
              //**************************************
            } catch (e) {
              print(e);
            }

            String? downloadImagePathThumbnails;
            try {
              //Compress image for
              /* await CompressImage.compress(
                  imageSrc: newImageFileList[i], desiredQuality: 60);*/
              //Compressed image
              String thumbImagePath = newImageFileList[i];
              //get image name from path
              String currentTimeThumbnails =
                  DateTime.now().microsecondsSinceEpoch.toString();
              String imageNameThumbnails = imageNameBase +
                  "_thumbnail_" +
                  currentTimeThumbnails +
                  thumbImagePath.substring(thumbImagePath.lastIndexOf('.'));

              //Calling to upload image
              await instance.send(
                imagePathOfPhone: thumbImagePath,
                imagePathInS3Bucket: imageNameThumbnails,
                bucketName: bucketName,
                accessKeyId: accessKeyId,
                secretKeyId: secretKeyId,
                region: region,
                s3Endpoint: s3Endpoint,
              );
              //Live Uploaded image path
              downloadImagePathThumbnails =
                  downloadImagePathBaseUrl + imageNameThumbnails;
            } catch (e) {
              print(e);
            }
            Map<String, String> imagePathDetails = Map();
            imagePathDetails["profile_pic"] = downloadImagePath!;
            imagePathDetails["profile_thumbnail"] =
                downloadImagePathThumbnails != null
                    ? downloadImagePathThumbnails
                    : downloadImagePath;
            newImageFileListTemp[i] = imagePathDetails;

            print('finalGroupImage: $downloadImagePath');
            print('groupImageThumbnail: $downloadImagePathThumbnails');
            print('printed');
            //projectUtil.printP("New Images $downloadImagePath  && $newImageFileList");
          }
        }
      }
      //  projectUtil.printP("New Images $newImageFileList ");
      return newImageFileListTemp;
    }
    return null;
  }
}
