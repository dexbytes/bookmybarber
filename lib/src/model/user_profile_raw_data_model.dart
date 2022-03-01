class UserProfileRawDataModel {
  final String title;
  final String imageUrl;

  UserProfileRawDataModel( {
    required this.title,
    required this.imageUrl,
  });
}

List<UserProfileRawDataModel> userProfile = [
  UserProfileRawDataModel(
    title: "Booking Order & Appointment",
    imageUrl: 'assets/images/user_profile_booking_icon.png',
  ),
  UserProfileRawDataModel(
    title: "Package & Offers",
    imageUrl:'assets/images/user_profile_offer_icon.png',
    // imageUrl: "assets/images/card_image.png",
  ),
  UserProfileRawDataModel(
    title: "Favourites Barber & Salon",
    imageUrl:'assets/images/user_profile_favourite_icon.png',
  ),
  UserProfileRawDataModel(
    title: "Payment Methods",
    imageUrl:'assets/images/user_profile_payment_method_icon.png',
  ),
  // UserProfileRawDataModel(
  //   title: "Payment History",
  //   imageUrl:'assets/images/user_profile_history_icon.png',
  // ),
  UserProfileRawDataModel(
    title: "Change Password",
    imageUrl:'assets/images/user_profile_change_password_icon.png',
  ),
  UserProfileRawDataModel(
    title: "Invites friends",
    imageUrl: 'assets/images/user_profile_invite_friend_icon.png',
  ),
  UserProfileRawDataModel(
    title: "About Us",
    imageUrl:'assets/images/user_profile_about_icon.png',
  ),
  UserProfileRawDataModel(
    title: "Log out",
    imageUrl:'assets/images/user_profile_logout_icon.png',
  ),

];
