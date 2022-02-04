import 'package:flutter/cupertino.dart';

const domainC = 'http://api.ch:3001/'; //domain for image
const profileImageNotFoundC =
    'https://www.fulhamco.com/team_members/andrew-fulham/user-profile-not-found/#iLightbox[postimages]/0';
const imageNotFoundC =
    'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';

const baseUrlDevC = 'https://api.my.webbabyshower.com/';
const baseUrlProC = 'https://api.my.webbabyshower.com/'; // Production API's

const userSignUpApiC = 'auth?cmd=signup';
const codeVerificationApiC = 'auth?cmd=verification_code';
const resendVerificationApiC = 'auth?cmd=resend_code';
const profileUpdateApiC = '?wbs_cmd=profile.update';
const profileAddKidsApiC = '?wbs_cmd=kids.add';
const profileRemoveKidsApiC = '?wbs_cmd=kids.delete';
const profileUpdateKidsInfoApiC = '?wbs_cmd=kids.update';
const profileUpdateUserImageApiC = '?wbs_cmd=profile.avatars';
const userSignApiC = 'auth?cmd=signin';
const changePasswordApiC = 'auth?wbs_cmd=change_password';
const logoutApiC = 'users/logout';
const aboutUsApiC = 'about-us';
const checkAppVersionC = 'version/check-app?';
const pushNotificationApiC = 'v1/notification/send-notification-for-chat';

class ConstantC {
  static bool isProduction = true;
  static String uploadInDev = 'development';
  static String uploadInPro = 'production';
  static String baseUrl = isProduction ? baseUrlProC : baseUrlDevC;
  static String uploadIn = isProduction ? uploadInPro : uploadInDev;
  //Our server for development
  static String awsAccessKeyIdDev = 'AKIAVFLH7OMPYJGCFDFS';
  static String awsSecretKeyIdDev = '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';
  static String awsRegionDev = 'eu-north-1';
  static String awsS3EndpointDev = 'https://.s3.eu-north-1.amazonaws.com';
  static String awsBucketNameDev = 'events';
  static String awsDownloadImagePathBaseUrlDev =
      ' https://d2d0ufj1wslma.cloudfront.net/';
  static String fcmAuthKeyDev = 'AIzaSyA3XCU567swjEuV2tVGUWqy7WgyvcIfXRcnvbn';
  static String googleMapKeyDev = 'AIzaSyD9kC1IftJ961H9Yu0e4DlDCZl12OKIy-onbvn';

  //Client server aws
  static String awsAccessKeyIdPro = 'AKIAXP73AANQQ6X6SBTO';
  static String awsSecretKeyIdPro = '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';
  static String awsRegionPro = 'us-east-2';
  static String awsS3EndpointPro =
      'https://media-webbabyshower-com50031-dev.s3.us-east-2.amazonaws.com';
  static String awsBucketNamePro = 'media-webbabyshower-com50031-dev';
  static String awsDownloadImagePathBaseUrlPro =
      'https://d2q7te2k3x5jfa.cloudfront.net/';
  static String fcmAuthKeyPro =
      'AIzaSyA3XCU567swjEuV2tVGUWqy7WgvnvnydsgvcIfXRc'; //it is use for send notification
  static String googleMapKeyPro =
      'AIzaSynbvgdfgD9kC1IftJ961H9Yu0e4DlDCZl12OKIy-o';

  static String showerWebApiC = "https://my.webbabyshower.com/WBSpreview";
  static String gamesWebApiC = "https://my.webbabyshower.com/WBSpreview/games";
  static String giftsWebApiC =
      "https://my.webbabyshower.com/WBSpreview/gift-registry";

  static String awsAccessKeyId =
      isProduction ? awsAccessKeyIdPro : awsAccessKeyIdDev;
  static String awsSecretKeyId =
      isProduction ? awsSecretKeyIdPro : awsSecretKeyIdDev;
  static String awsRegion = isProduction ? awsRegionPro : awsRegionDev;
  static String awsS3Endpoint =
      isProduction ? awsS3EndpointPro : awsS3EndpointDev;
  static String awsBucketName =
      isProduction ? awsBucketNamePro : awsBucketNameDev;
  static String awsDownloadImagePathBaseUrl = isProduction
      ? awsDownloadImagePathBaseUrlPro
      : awsDownloadImagePathBaseUrlDev;
  static String fcmAuthKey = isProduction
      ? fcmAuthKeyPro
      : fcmAuthKeyDev; //it is use for send notification
  static String googleMapKey = isProduction
      ? googleMapKeyPro
      : googleMapKeyDev; //it is use for send notification

  static String getGoogleMapStaticImageUrl(
          {String address = "",
          var latitude,
          var longitude,
          String googleMapKey = ""}) =>
      "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&"
      "zoom=6&"
      "size=600x300%20&"
      "markers=color:0xffc3f5%7Clabel:%7C$latitude,$longitude&"
      "style=feature:road%7Celement:geometry%7Cvisibility:simplified%7Ccolor:0xf5f5f5&"
      "style=feature:water|color:0xc9c9c9&"
      "key=%20$googleMapKey";
}
