import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/app_utility/app_localizations.dart';

class AppString {
  static BuildContext? context;

  //appString.trans(context,appString.basicInfo);
  trans(BuildContext context, String key) {
    if (key != null && key.trim() != "" && context != null) {
      var data = AppLocalizations.of(context)!.translate(key);
      if (data == null) {
        return "";
      }
      return data;
    } else {
      return "";
    }
  }

  String selectCountry = '';
  String appName = 'Base Flutter App';
  String profileSetup = 'profileSetup';
  String showerBegins = 'showerBegins';
  String start = 'start';
  String continueBt = 'continue';
  String next = 'next';
  String createProfile = 'createProfile';
  String nextSmall = 'nextSmall';

  String editPhoto = 'editPhoto';
  String choose = 'choose';
  String addPhoto = 'addPhoto';

  String remove = 'remove';
  String correctPhone = 'Phone number length must be 10 characters long.';
  String phoneNumber = 'Please enter phone number';
  String pleaseEnterOTP = 'Please enter OTP';
  String pleaseEnterCorrectOTP = 'Please enter correct OTP';


  String pleaseEnterPassword = 'pleaseEnterPassword';
  String pleaseEnterCurrentPassword = 'pleaseEnterCurrentPassword';
  String pleaseReEnterPassword = 'pleaseReEnterPassword';
  String firstName = 'firstName';
  String name = 'name';
  String chooseAvatar = 'chooseAvatar';
  String age = 'age';
  String enterValidEmail = 'enterValidEmail';
  String enterAPassword = 'enterAPassword';
  String enterValidPassword = 'enterValidPassword';
  String enterFirstEmail = 'enterFirstEmail';
  String signUpEmail = 'signUpEmail';
  String welcome = 'welcome';
  String signInTitle = 'signInTitle';
  String verificationCodeTitle = 'verificationCodeTitle';
  String acceptTermsCondition1 = 'acceptTermsCondition1';
  String terms = 'terms';
  String and = 'and';
  String privacyPolicy = 'privacyPolicy';
  String pleaseEnterNewPassword = 'pleaseEnterNewPassword';
  String changePassword = 'changePassword';
  String newPassword = 'newPassword';
  String currentPassword = 'currentPassword';
  String confirm = 'confirm';

  String email = 'email';
  String swipeToStart = 'swipeToStart';
  String pleaseEnterEmail = 'pleaseEnterEmail';
  String loginT = 'login';
  String createAccountButton = 'createAccountButton';
  String newCode = 'newCode';
  String verify = 'verify';
  String lastName = 'lastName';
  String password = 'password';
  String verificationCode = 'verificationCode';
  String confirmPassword = 'confirmPassword';
  String enterFirstName = 'enterFirstName';
  String enterName = 'enterName';
  String enterLastName = 'enterLastName';
  String enterPassword = 'enterPassword';
  String enterVerificationCode = 'enterVerificationCode';
  String enterConfirmPassword = 'enterConfirmPassword';
  String howManyEmployees = 'howManyEmployees';
  String createPassword = 'createPassword';
  String mustContain1LetterAndNumber = 'mustContain1LetterAndNumber';
  String completeSetUPButton = 'completeSetUPButton';
  String validName = 'validName';
  String signIn = 'signIn';
  String back = 'back';
  String signUpButton = 'signUpButton';
  String createAPassword = 'createAPassword';

  String send = 'send';
  String signOut = 'signOut';
  String aboutDrawer = 'aboutDrawer';
  String editProfile = 'editProfile';
  String passwordLength = 'passwordLength';
  String viewProfile = 'viewProfile';
  String titleText = 'titleText';
  String departmentText = 'departmentText';
  String save = 'save';

  String tryAgain = 'Something went wrong please try again';
  //Button text
  String buttonSave = "Save";
  String buttonCancel = "Cancel";
  String buttonApply = "Apply";
  String buttonConfirm = "Confirm";
  String buttonGallery = "Media";
  String buttonCamera = "Photo";
  //Alert message
  String logoutConfirmation = "Are you sure you want to logout";
  String deletePostMessage = "Are you sure to delete this post?";
  String deleteGroupChannelMessage =
      "Are you sure to delete this Group Channel?";
  String leftGroupMessage = "Are you sure to left this group?";
  String noInternetConnection =
      "No internet connection available. Please check your network!";
  String noText = "No";
  String yesText = "Yes";

  String notificationHeading = 'notificationHeading';

  String general = 'general';

  //error messages
  String passwordNotBlank = 'Please enter the password.';
  String screenTermsAndConditions = "Terms and conditions";

  //Login screen strings
  String contactText =
      "If you have problems to login, please get in contact at ";
  String acceptTermsAndConditions =
      'Check here to indicate that you have read and agree to the "';
  String termsAndConditions = 'terms of the main flutter app';

  String messageHeading = 'messageHeading';
  String messageScreenSubtitle1 = 'messageScreenSubtitle1';
  String chatBoxHintText = 'chatBoxHintText';

  //Contact email id
  String contactEmail = "dexbytes@gmail.com";

  String emailNotBlank = 'Please enter your number';
  String validEmail = 'Please enter a valid mobile number.';

  //confirmation message
  String confirmationMessage =
      "Are you sure you want to delete this notification?";
  String confirmationLogoutMessage = "Are you sure you want to sign out?";

  String confirmationChangePasswordOTPMessage =
      "It will send an OTP to your email, Do you want to change your password?";

  String confirmationChangeEmailOTPMessage =
      "It will send an OTP to your email, Do you want to change your email?";
  String confirmationExitMessage =
      "Are you sure you want to exit from the app?";
  String confirmationDeletePostMessage =
      "Are you sure you want to delete this post?";
  String confirmationDeleteGroupMessage =
      "Are you sure you want to delete this group?";
  String confirmationLeftGroupMessage =
      "Are you sure you want to leave this group?";

  String dateFormat = 'dd/MM/yyyy';
  String timeFormat = 'hh:mm a';

  String logout = 'logout';

  String signUpText = "signUpText";
  String signUpWith = "signUpWith";
  String personalEmail = "personalEmail";
  String recommendedText = "recommendedText";
  String contactWillText = "contactWillText";
  String hintText = "hintText";
  String continueBtnT = "continueBtnT";
  String byTappingText = "byTappingText";
  String termsOfServices = "termsOfServices";
  String contactManagement = "contactManagement";
  String signUpToday = "signUpToday";
  String noPaymentRequired = "noPaymentRequired";
  String getStarted = "getStarted";
  String step1Of2 = "step1Of2";
  String secretCode = "secretCode";
  String codeExpires = "codeExpires";
  String junkFolder = "junkFolder";
  String resendCode = "resendCode";
  String needHelp = "needHelp";
  String contactUs = "contactUs";

  String step2Of2 = "step20f2";
  String enterYourName = "enterYourName";
  String headingFirstName = "First Name";
  String headingLastName = "Last Name";

  String howManyContactText = "howManyContactText";
  String firstBtnValue = "firstBtnValue";
  String secondBtnValue = "secondBtnValue";
  String thirdBtnValue = "thirdBtnValue";
  String swipeBtn = "swipeBtn";
  String stepText2Of2 = "stepText2Of2";
  String signInText = "signInText";
  String signInEmail = "signInEmail";
  String hiNickText = "hiNickText";
  String setUpYours = "setUpYours";
  String step1Of3 = "step1Of3";
  String importContact = "importContact";
  String skip = "skip";
  String nextBtn = "nextBtn";
  String welcomeHeading = "welcomeHeading";
  String alreadyHaveAccount = "alreadyHaveAccount";

}

AppString appString = AppString();
