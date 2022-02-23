import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_event.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_state.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainAppInitStat());
  static Map<String, dynamic> configTheme = Map<String, dynamic>();
  static BuildContext? dashboardContext;
  static get getDashboardContext => dashboardContext!;

  @override
  Stream<MainAppState> mapEventToState(MainAppEvent event) async* {
    if (event is UpdateLoggedInUserAuth) {
      yield UserAuthState(loggedInUserAuth: event.apiAuth);
    } else if (event is LoggedInEvent) {
      yield LoggedInState(isLoggedInUser: event.isLoggedIn);
    } else if (event is HomeBottomNavigationBarTapedEvent) {
      yield HomeBottomNavigationBarTapedState(
          tapedBottomBarIndex: event.tapedBottomBarIndex,
          tapedBottomBarPageId: event.tapedBottomBarPageId,
          statusBarColor: event.statusBarColor);
    } else if (event is LogOutEvent) {
      loadingWidget.startLoadingPopUp(event.context);
      /*await sharedPreferencesFile.saveBool(isUserLoggedInC, false);
      await sharedPreferencesFile.saveStr(loggedInUserApiResponse, "");
      await sharedPreferencesFile.saveStr(profileSetUpStepLocal, "");*/
      await sharedPreferencesFile.clearAll();
      await sharedPreferencesFile.saveBool(isIsTutorialSeenC, true);
      // yield LogOutUserState();
      loadingWidget.endLoadingPopUp(event.context);
      Navigator.pushAndRemoveUntil(
          event.context,
          SlideRightRoute(widget: SignInPage()),
          ModalRoute.withName("signInPage"));
    } else if (event is UpdateLoggedInUserDetailsEvent) {
      yield UserLoggedInDetailState(
          loggedInUserDetails: event.loggedInUserDetails);
    } else if (event is ProfileSetUpStepUpdateEvent) {
      /*Map storedProfileSetUpStep;
      String profileStepDa =
          await sharedPreferencesFile.readStr(profileSetUpStepLocal);
      if (profileStepDa != null && profileStepDa.trim() != "") {
        storedProfileSetUpStep = json.decode(profileStepDa);
      }
      yield ProfileSetUpSetUpdateState(
          profileSetUpScreens: event.profileSetUpScreens,
          screenData: event.screenData,
          context: event.context,
          storedProfileSetUpStep: storedProfileSetUpStep)*/
      ;
    } else if (event is GetProfileSetUpStepEvent) {
      /* var profileSetUpScreens = await getProfileSetUpStep(
          profileSetUpScreens: event.profileSetUpScreens);
      yield GetProfileSetUpStepState(
          profileSetUpScreens: event.profileSetUpScreens != null
              ? profileSetUpScreens
              : event.profileSetUpScreens,
          context: event.context,
          screenData:
              event.profileSetUpScreens == null ? profileSetUpScreens : Map());*/
    } else if (event is GetUserProfileDetailsApiEvent) {
      /* MainAppBloc mainAppBloc = BlocProvider.of<MainAppBloc>(event.context);
      String id =
          mainAppBloc.state.loggedInUserDetails.data.loginDetailModel.id;
      Map data = {"wbs_cmd": "profile.get&id=$id"};
      LoadingWidget.startLoadingWidget(event.context);
      var response = await apiRequest.getUserProfileApi(
        requestData: data,
      );
      if (response.status && response.responseData != null) {
        UserProfileDetailModel mUserProfileDetailModel;
        projectUtil.printP(response.responseData);
        mUserProfileDetailModel =
            UserProfileDetailModel.fromJson(json.decode(response.responseData));
        UpdateUserProfileDetailsBackgroundState(
            userProfileData: mUserProfileDetailModel);
        await setProfileSetUpStepFromApi(
            userProfileData: mUserProfileDetailModel);
      }
      LoadingWidget.endLoadingWidget(event.context);
      yield GetUserProfileDetailsApiState();*/
    }
  }

/* Future getProfileSetUpStep({ProfileSetUpScreens profileSetUpScreens}) async {
    String profileStepDa =
        await sharedPreferencesFile.readStr(profileSetUpStepLocal);
    ProfileSetUpScreens profileSetUpScreensTemp = profileSetUpScreens;
    if (profileStepDa != null && profileStepDa.trim() != "") {
      Map profileSetUpStep = json.decode(profileStepDa);
      //Return selected screen data
      if (profileSetUpScreensTemp != null) {
        //screenData = screenData.profileSetUpStep[profileSetUpScreens];
        for (int i = 0; i < profileSetUpStep.length; i++) {
          String mapKey = profileSetUpStep.entries.elementAt(i).key;
          Map mapValue = profileSetUpStep.entries.elementAt(i).value;
          print("$mapValue");
          if ("$profileSetUpScreens" == mapKey) {
            profileSetUpStep = mapValue;
            break;
          }
        }
      }
      //Return empty screen name
      else {
        String lastProfileStep = "";
        print("");
        // String emptyScreen1 = screenData.entries.map((e) => "hello");
        for (int i = 0; i < profileSetUpStep.length; i++) {
          String mapKey = profileSetUpStep.entries.elementAt(i).key;
          Map mapValue = profileSetUpStep.entries.elementAt(i).value;
          print("$mapValue");
          if (mapValue == null || mapValue.length <= 0) {
            lastProfileStep = mapKey;
            for (int k = 0; k < ProfileSetUpScreens.values.length; k++) {
              if ("${ProfileSetUpScreens.values[k]}" == lastProfileStep) {
                profileSetUpScreens = ProfileSetUpScreens.values[k];
                break;
              }
            }
            break;
          }
        }
        print("$lastProfileStep ?? $profileSetUpScreens");
      }
      return profileSetUpScreensTemp != null
          ? profileSetUpStep
          : profileSetUpScreens;
    } else {
      return profileSetUpScreensTemp != null
          ? Map()
          : ProfileSetUpScreens.PRONOUNS;
    }
  }*/

/*Future getUserProfileApi({String userId}) async {
    Map data = {"wbs_cmd": "profile.get&id=$userId"};
    var response = await apiRequest.getUserProfileApi(
      requestData: data,
    );
    if (response.status && response.responseData != null) {
      UserProfileDetailModel mUserProfileDetailModel;
      projectUtil.printP(response.responseData);
      mUserProfileDetailModel =
          UserProfileDetailModel.fromJson(json.decode(response.responseData));
      UpdateUserProfileDetailsBackgroundState(
          userProfileData: mUserProfileDetailModel);
      await setProfileSetUpStepFromApi(
          userProfileData: mUserProfileDetailModel);
    }
  }*/

/* Future setProfileSetUpStepFromApi(
      {UserProfileDetailModel userProfileData}) async {
    String profileStepDa =
        await sharedPreferencesFile.readStr(profileSetUpStepLocal);
    Map<String, dynamic> profileSetUpStep;
    if (profileStepDa != null && profileStepDa.trim() != "") {
      profileSetUpStep = json.decode(profileStepDa);
      print("$profileSetUpStep");
    } else {
      profileSetUpStep = MainAppState.mainAppStateModel.profileSetUpStep;
      print("$profileSetUpStep");
    }
    if (userProfileData != null) {
      Data userData = userProfileData.data;
      List<Websites> websites = userProfileData.data.websites;
      String knownFrom = "";
      String hostFunFact = "";
      bool groupGift = false;
      if (websites != null && websites.length > 0) {
        knownFrom = websites[0].knownFrom;
        hostFunFact = websites[0].hostFunFact;
        groupGift = websites[0].groupGift;
      }
      //Pronouns
      */ /*profileSetUpStep["${ProfileSetUpScreens.PRONOUNS}"] = {
        "data": {"gender": "${userData.gender}"}
      };*/ /*
      if (userData.gender != null) {
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.PRONOUNS,
            screenData: {
              "data": {"gender": "${userData.gender}"}
            });
      }
      // profileSetUpStep["${ProfileSetUpScreens.PARTY_QUESTIONS}"]
      if (userData.firstName != null && userData.firstName.isNotEmpty) {
        Map partyQuestion = {
          "data": {
            "first_name": "${userData.firstName}",
            "last_name": "${userData.lastName != null ? userData.lastName : ""}"
          }
        };
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.PARTY_QUESTIONS,
            screenData: partyQuestion);
      }
      */ /*profileSetUpStep["${ProfileSetUpScreens.PARTY_QUESTIONS2}"] = {
        "data": {"known_from": "$knownFrom"}
      };*/ /*
      if (knownFrom != null && knownFrom.isNotEmpty) {
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.PARTY_QUESTIONS2,
            screenData: {
              "data": {"known_from": "$knownFrom"}
            });
      }
      if (userData.hasKids != null &&
          userData.hasKids &&
          userData.kids != null &&
          userData.kids.length > 0) {
        */ /*profileSetUpStep["${ProfileSetUpScreens.KIDS_OS}"] = {
          "data": {"kids": userData.kids}
        };*/ /*
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.KIDS_OS,
            screenData: {
              "data": {"kids": userData.kids}
            });
      }
      */ /*profileSetUpStep["${ProfileSetUpScreens.FUN_FACT}"] = {
        "data": {"host_fun_fact": "$hostFunFact"}
      };*/ /*
      if (hostFunFact != null && hostFunFact.isNotEmpty) {
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.FUN_FACT,
            screenData: {
              "data": {"host_fun_fact": "$hostFunFact"}
            });
      }
      */ /*profileSetUpStep["${ProfileSetUpScreens.GROUP_GIFT}"] = {
        "data": {"group_gift": groupGift}
      };*/ /*
      if (groupGift != null) {
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.GROUP_GIFT,
            screenData: {
              "data": {"group_gift": groupGift}
            });
      }
      */ /*profileSetUpStep["${ProfileSetUpScreens.PHOTO_PROFILE}"] = {
        "data": {"profile_photo": "${userData.profilePhoto}"}
      };*/ /*
      if (userData.profilePhoto != null) {
        // if (userData.profilePhoto.isNotEmpty) {
        // sharedPreferencesFile.saveBool(isOneTimeProfileSetUpDoneC, true);
        ProfileSetUpSetUpdateState(
            profileSetUpScreens: ProfileSetUpScreens.PHOTO_PROFILE,
            screenData: {
              "data": {"profile_photo": "${userData.profilePhoto}"}
            });
        // }
      }
      if (userData.isProfileSetup != null && userData.isProfileSetup) {
        // if (userData.profilePhoto.isNotEmpty) {
        sharedPreferencesFile.saveBool(
            isOneTimeProfileSetUpDoneC, userData.isProfileSetup);
      }
      if (userData.isTutorialRead != null && userData.isTutorialRead) {
        // if (userData.profilePhoto.isNotEmpty) {
        sharedPreferencesFile.saveBool(
            isIsTutorialSeenC, userData.isTutorialRead);
      }
      if (userData.fcmId != null && userData.fcmId.trim() != "") {
        // if (userData.profilePhoto.isNotEmpty) {
        sharedPreferencesFile.saveStr(fcmUidC, userData.fcmId).then((value) {
          fcmLoginStatusApi(
              email: "${userData.email}",
              password: "${userData.email}",
              userData: userData);
        });
      }
      */ /*String profileSetUpStepStr = json.encode(profileSetUpStep);
      sharedPreferencesFile.saveStr(profileSetUpStepLocal, profileSetUpStepStr);*/ /*
      // return;
      //print("$profileSetUpStep");
      //ProfileSetUpScreens profileSetUpScreensTemp = profileSetUpScreens;
      //Return selected screen data
      */ /*if (profileSetUpScreensTemp != null) {
        //screenData = screenData.profileSetUpStep[profileSetUpScreens];
        for (int i = 0; i < profileSetUpStep.length; i++) {
          String mapKey = profileSetUpStep.entries.elementAt(i).key;
          Map mapValue = profileSetUpStep.entries.elementAt(i).value;
          print("$mapValue");
          if ("$profileSetUpScreens" == mapKey) {
            profileSetUpStep = mapValue;
            break;
          }
        }
      }*/ /*
      //Return empty screen name
      */ /* else {
        String lastProfileStep = "";
        print("");
        // String emptyScreen1 = screenData.entries.map((e) => "hello");
        for (int i = 0; i < profileSetUpStep.length; i++) {
          String mapKey = profileSetUpStep.entries.elementAt(i).key;
          Map mapValue = profileSetUpStep.entries.elementAt(i).value;
          print("$mapValue");
          if (mapValue == null || mapValue.length <= 0) {
            lastProfileStep = mapKey;
            for (int k = 0; k < ProfileSetUpScreens.values.length; k++) {
              if ("${ProfileSetUpScreens.values[k]}" == lastProfileStep) {
                profileSetUpScreens = ProfileSetUpScreens.values[k];
                break;
              }
            }
            break;
          }
        }
        print("$lastProfileStep ?? $profileSetUpScreens");
      }
      return profileSetUpScreensTemp != null
          ? profileSetUpStep
          : profileSetUpScreens;*/ /*
    }
  }*/

//login api calling to check fcm details and update
/*  fcmLoginStatusApi(
      {String email, String password = "Moh@1234", Data userData}) async {
    try {
      sharedPreferencesFile.readStr(fcmUidC).then((uId) {
        AuthBase _auth = new Auth();
        FireBaseStore _fireBaseStore = new FireBaseStore();
        String fullName = userData != null
            ? "${userData.firstName != null ? userData.firstName : ""} " +
                "${userData.lastName != null ? userData.lastName : ""}"
            : "";
        String image = userData != null ? "${userData.profilePhoto}" : null;
        fullName = fullName.trim();
        */ /*_auth
            .registerUsingEmailPassword(
                name: fullName, email: email, password: "Moh@1234")
            .then((value) {
          */ /* */ /*james101@mailinator.com
"uid" -> "MBcJ4WFKQVd5Wum1VWygMJVjE2C3"*/ /* */ /*
          print("$value");
        });*/ /*
        try {
          //email = "james101@mailinator.com";
          _auth
              .signInWithEmailAndPassword(email, password)
              .then((authUserDetails) {
            if (authUserDetails == null) {
              try {
                _fireBaseStore.addNewUserOnFireBase(
                    uId: uId, nickName: "$fullName", imageUrl: image);
              } catch (e) {
                print(e);
              }
              try {
                _fireBaseStore
                    .updatedUserProfileFireBase(
                        uId: uId, nickName: "$fullName", imageUrl: image)
                    .then((value) {
                  _fireBaseStore
                      .getUserDetailsFireBase(uId: "$uId")
                      .then((value) {
                    print("uId = $uId / $value");
                    print("$value");
                  });
                });
              } catch (e) {
                print(e);
              }
            } else {
              try {
                _fireBaseStore.addNewUserOnFireBase(
                    uId: uId, nickName: "$fullName", imageUrl: image);
              } catch (e) {
                print(e);
              }
              try {
                _fireBaseStore
                    .updatedUserProfileFireBase(
                        uId: uId, nickName: "$fullName", imageUrl: image)
                    .then((value) {
                  _fireBaseStore
                      .getUserDetailsFireBase(uId: "$uId")
                      .then((value) {
                    print("uId = $uId / $value");
                    print("$value");
                  });
                });
              } catch (e) {
                print(e);
              }
              */ /*if (authUserDetails != null) {
                uId = authUserDetails.uid;
                sharedPreferencesFile.saveStr(fcmUidC, uId ?? "");
                _fireBaseStore.getUserDetailsFireBase(uId: uId).then((value) {
                  //New entry
                  if (value == null) {
                    sharedPreferencesFile.readStr(userFullNameC).then((_eName) {
                      if (_eName == null) {
                        _eName = email;
                      }
                      try {
                        _fireBaseStore.addNewUserOnFireBase(
                            uId: uId, nickName: "$fullName", imageUrl: image);
                      } catch (e) {
                        print(e);
                      }
                      try {
                        _fireBaseStore
                            .updatedUserProfileFireBase(
                                uId: uId,
                                nickName: "$fullName",
                                imageUrl: image)
                            .then((value) {
                          _fireBaseStore
                              .getUserDetailsFireBase(uId: "$uId")
                              .then((value) {
                            print("uId = $uId / $value");
                            print("$value");
                          });
                        });
                      } catch (e) {
                        print(e);
                      }
                    });
                  }
                });
              }*/ /*
            }
          });
        } catch (e) {
          print(e);
        }
      });
    } catch (e) {
      print(e);
    }
  }*/

/*Future<List<dynamic>> chatMediaUpload(
      {BuildContext context, Map requestData}) async {
    Map data = requestData;
    MainAppBloc mainAppBloc = BlocProvider.of<MainAppBloc>(context);
    String id = mainAppBloc.state.loggedInUserDetails.data.loginDetailModel.id;
    String webId = mainAppBloc
        .state.loggedInUserDetails.data.loginDetailModel.websites[0].websiteId;
    if (id != null && id.length > 0 && webId != null && webId.length > 0) {
      String photoPath = data["profile_photo"];
      try {
        LoadingWidget.startLoadingWidget(context);
        var response = await apiRequest.uploadChatMediaAwsApi(
            context: context, imagePath: [photoPath], loggedInUserId: id);
        LoadingWidget.endLoadingWidget(context);
        if (response != null && response.length > 0) {
          photoPath = response[0];
          data["profile_photo"] = photoPath;
          return response;
        } else {
          */ /* SelfProfileErrorState(
              context: context,
              errorMessage: response.message,
              emailId: "");*/ /*
        }
      } catch (e) {
        print(e);
        */ /*SelfProfileErrorState(
            context: context, errorMessage: "Something went wrong");*/ /*
      }
    } else {
      */ /*SelfProfileErrorState(
          context: context,
          errorMessage: "No id found",
          emailId: "enteredEmail");*/ /*
    }
    return [];
  }*/

}