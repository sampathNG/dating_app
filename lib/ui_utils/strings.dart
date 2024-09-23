import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  // Private constructor
  CustomTextTheme._();

  // Singleton instance
  static final CustomTextTheme _instance = CustomTextTheme._();

  // Getter for the singleton instance
  static CustomTextTheme get instance => _instance;

  // Static TextTheme
  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(fontSize: 57, height: 64 / 57),
    displayMedium: GoogleFonts.roboto(fontSize: 45, height: 52 / 45),
    displaySmall: GoogleFonts.roboto(fontSize: 36, height: 44 / 36),
    headlineLarge: GoogleFonts.roboto(fontSize: 32, height: 40 / 32),
    headlineMedium: GoogleFonts.roboto(fontSize: 28, height: 36 / 28),
    headlineSmall: GoogleFonts.roboto(
        fontSize: 24, height: 32 / 24, fontWeight: FontWeight.w700),
    titleLarge: GoogleFonts.roboto(
        fontSize: 22, height: 28 / 22, fontWeight: FontWeight.w400),
    titleMedium: GoogleFonts.roboto(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5),
    labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        height: 16 / 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5),
    bodyLarge:
        GoogleFonts.roboto(fontSize: 16, height: 24 / 16, letterSpacing: 0.5),
    bodyMedium:
        GoogleFonts.roboto(fontSize: 14, height: 20 / 14, letterSpacing: 0.25),
    bodySmall:
        GoogleFonts.roboto(fontSize: 12, height: 16 / 12, letterSpacing: 0.4),
  );
}

class AppStrings {
  // Private constructor
  AppStrings._privateConstructor();

  // Singleton instance
  static final AppStrings instance = AppStrings._privateConstructor();

  // Strings
  final String name = "Name";
  final String edit = "Edit";
  final String accountSetting = "Account Settings";
  final String personalSetting = "Personal Settings";
  final String personalDetail = "Personal Details";
  final String number = "Phone Number";
  final String editProfile = "Edit profile";
  final String addPhotos = "Add your photos";
  final String changePassword = "Change password";
  final String pushNotifications = "Push notifications";
  final String darkMode = "Dark Mode";
  final String dob = 'Date Of Birth';
  final String save = 'Save';
  final String emailAddress = "Email Address";
  final String privacyPolicy = "Privacy policy";
  final String termsConditions = "Terms and conditions";
  final String dataPrivacy = "Data Privacy";
  final String dataPrivacyDescription =
      "Enable /  Disable your Private Information to be displayed.";
  final String discoverySetting = "Discovery Setting";
  final String updatePassword = "Update Password";
  final String forgot = "Forgot ?";
  final String continueText = "Continue";
  final String pleaseEnterMail = "Please enter your email";
  final String pleaseEnterValidMail = "Please enter your valid email";
  final String pleaseEnterPassword = "Please enter your password";
  final String enterCode = "Enter Code";
  final String codeIsSent = "Code is sent your email address";
  final String resend = "RESEND";
  final String dotHaveAccount = 'Do not have account ? Signup';
  final String myEmailIs = "My Email is";
  final String loginWithMail = "LOGIN WITH EMAIL";
  final String byClickingPrivacyPolicy =
      'By clicking Log In, you agree with our Terms.  Learn how process your data in our Privacy  Policy and Cookies Policy. By clicking Log In, you agree with our Terms.  Learn how process your data in our Privacy  Policy and Cookies';
  final String cookiesPolicy = "My Email is";
  final String signUp = "Sign Up";
  final String gender = 'Gender';
  final String accountPrivacyTxt = "Account Privacy";
  final String showAccountDetailsTxt = 'Show Account Details';
  final String onlyTo = 'Only to';

  static String notification = "Notification";
  static String isRequestingAccessTo = "is requesting access to";
  static String chatYou = "Chat you!";
  static String accept = "Accept";
  static String decline = "Decline";
  static String newFeatureAlert = "New Feature Alert!";
  static String tryNow = "Try Now";
  static String hasSharedTheImageWithYou = "has shared the image with you";
  static String viewedYour = "viewed your";
  static String message = "Message";
  static String search = "Search";
  static String writeAMessage = "Write a message...";

  static String requestSent = "Request is send ,";
  static String writeRequestmessage =
      "Write a request message to   \n                 username";
  static String send = "Send";
  static String sendMessgae = "Send Message";
  static String photos = "Photos";

  // final String updatePassword = "Update Password";
  // final String forgot = "Forgot ?";
  // final String continueText = "Continue";
  // final String pleaseEnterMail = "Please enter your email";
  // final String pleaseEnterValidMail = "Please enter your valid email";
  // final String pleaseEnterPassword = "Please enter your password";
  // final String enterCode = "Enter Code";
  // final String resend = "RESEND";
  // final String dotHaveAccount = 'Do not have account ? Signup';
  // final String myEmailIs = "My Email is";
  // final String loginWithMail = "LOGIN WITH EMAIL";
  // final String byClickingPrivacyPolicy =
  //     'By clicking Log In, you agree with our Terms.  Learn how process your data in our Privacy  Policy and Cookies Policy. By clicking Log In, you agree with our Terms.  Learn how process your data in our Privacy  Policy and Cookies';
  // final String cookiesPolicy = "My Email is";
  // final String signUp = "Sign Up";
  // final String gender = 'Gender';
  // static String notification = "Notification";
  // static String isRequestingAccessTo = "is requesting access to";
  // static String chatYou = "Chat you!";
  // static String accept = "Accept";
  // static String decline = "Decline";
  // static String newFeatureAlert = "New Feature Alert!";
  // static String tryNow = "Try Now";
  // static String hasSharedTheImageWithYou = "has shared the image with you";
  // static String viewedYour = "viewed your";
  // static String message = "Message";
  // static String search = "Search";
  // static String writeAMessage = "Write a message...";
  final String skipTxt = "Skip";
  final String profileDetailTxt = "Profile details";
  final String firstName = "First name";
  final String lastName = "Last name";
  final String chooseBirhDateTxt = "Choose birthday date";
  final String yourInterestTxt = 'Your interests';
  final String bothMatched = 'You Both Matched';
  final String selectYourInterestTxt =
      'Select a few of your interests and let everyone know what you\'re passionate about.';
  final String searchFriendTxt = "Search friend's";
  final String findFriendFromContatctTxt =
      'You can find friends from your contact lists \n to connect.';
  final String accessContactListTxt = 'Access to a contact list';
  final String allowAccessContactTxt = 'Allow [𝐀𝐩𝐩] to access';
  final String allowAccessContactTxt1 = 'Contact on your device?';
  final String allowTxt = 'Allow';
  final String dontAllowTxt = "Don't allow";
  final String notificationsTxt = "Enable notification’s";
  final String getNotificationsTxt =
      "Get push-notification when you get the match \n or receive a message.";
  final String wantToBeNotifiedBtn = "I want to be notified";
  final String allowAppSendNotificationTxt = "Allow [𝐀𝐩𝐩] to send you";
  final String allowAppSendNotificationTxt1 = 'notifications?';

  final String requestedAccept = "";

  final String chat = 'Chat';
  final String chatRequest = 'Chat Request';
  final String userName = 'Jessica Parker, 23';
  final String profession = 'Proffesional model';
  final String location = 'Location';
  final String cityName = 'Chicago, IL United States';
  final String about = 'About';
  final String aboutText =
      'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..';
  final String readMore = 'Read more';
  final String distance = '1 KM';
  final String interests = 'Interests';
  final String travelling = 'Travelling';
  final String books = 'Books';
  final String dance = 'Dancing';
  final String music = 'Music';
  final String modeling = 'Modeling';
  final String gallery = 'Gallery';
  final String viewAll = 'View All';
  String reportText(String Username) => '$Username is reported';
  String chatUse(String Username) => Username;
  final String ourTeamConntactYou =
      'Our team will contact you soon! to provide more feekback';
  String removeText(String username) =>
      'Are you sure you want to remove the $username?';
  String blockText(String username) =>
      'Are you sure you want to Block the $username?';
  final String yes = 'yes';
  final String no = 'No';
  final String reportUser = 'Report User';
  final String reason = 'Reason';
  final String report = 'Report';
}

class Style {
// fontFamily = "";
  static double splashTitleFontSize = 35;
  static double titleFontSize = 18;
  static double appBarTitleFontSize = 20;
  static double primaryAppBarTitleFontSize = 34;

  static TextStyle primaryAppBarTitleStyle = GoogleFonts.roboto(
      fontSize: primaryAppBarTitleFontSize,
      fontWeight: FontWeight.w700,
      color: Colors.black);

  static TextStyle appBarTitleStyle = GoogleFonts.roboto(
      fontSize: appBarTitleFontSize,
      fontWeight: FontWeight.w600,
      color: const Color(0xff1E293B));
}

// class AppStrings {

  
// }

