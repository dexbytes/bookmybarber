import 'package:base_flutter_app/src/model/signin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MainAppEvent extends Equatable {
  const MainAppEvent();
  @override
  List<Object> get props => [];
}

class UpdateLoggedInUserDetails extends MainAppEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddProduct { index: }';
}

class UpdateLoggedInUserAuth extends MainAppEvent {
  final String apiAuth;
  UpdateLoggedInUserAuth(this.apiAuth);
  @override
  String toString() => 'RemoveProduct { index: $apiAuth }';
}

class UpdateLoggedInUserDetailsEvent extends MainAppEvent {
  final SignInModel? loggedInUserDetails;
  const UpdateLoggedInUserDetailsEvent(this.loggedInUserDetails);
  @override
  String toString() => 'RemoveProduct { index: $loggedInUserDetails }';
}

class LoggedInEvent extends MainAppEvent {
  final bool isLoggedIn;
  const LoggedInEvent(this.isLoggedIn);
  @override
  String toString() => 'RemoveProduct { index: $isLoggedIn }';
}

class ProfileSetUpStepUpdateEvent extends MainAppEvent {
  final Map? screenData;
  final BuildContext? context;
  const ProfileSetUpStepUpdateEvent({this.screenData, this.context});
  @override
  String toString() => 'RemoveProduct { index: }';
}

//It will return next selected screen filled data and not filled screen name
class GetProfileSetUpStepEvent extends MainAppEvent {
  final BuildContext? context;
  const GetProfileSetUpStepEvent({this.context});
  @override
  String toString() => 'RemoveProduct { index: }';
}

//get user profile details in background
class GetUserProfileDetailsApiEvent extends MainAppEvent {
  final BuildContext? context;
  const GetUserProfileDetailsApiEvent({@required this.context});
  @override
  String toString() => 'RemoveProduct { index: }';
}

class LogOutEvent extends MainAppEvent {
  final BuildContext context;
  const LogOutEvent({required this.context});
  @override
  String toString() => 'RemoveProduct { index: }';
}

class HomeBottomNavigationBarTapedEvent extends MainAppEvent {
  final int tapedBottomBarIndex;
  final String? statusBarColor;
  final String tapedBottomBarPageId;
  const HomeBottomNavigationBarTapedEvent(
      {required this.tapedBottomBarIndex,
        required this.tapedBottomBarPageId,
        this.statusBarColor});
  @override
  String toString() => 'RemoveProduct { index: }';
}
