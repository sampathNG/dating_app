// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/screens/account_screen/data_privacy.dart';
import 'package:dating_app/screens/account_screen/edit_profile/edit_profile_view.dart';
import 'package:dating_app/screens/account_screen/update_password/update_pass.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _notificationSwitch = false;
  bool _darkModeSwitch = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: screenWidth * 0.05,
            left: screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.06),
              Row(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.09,
                    backgroundImage: const AssetImage(''),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Text(
                    AppStrings.instance.name,
                    style: CustomTextTheme.textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                AppStrings.instance.accountSetting,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                title: Text(AppStrings.instance.editProfile),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                ),
                onTap: () {
                         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfileScreen()),
            );
                },
              ),
              SizedBox(height: screenHeight * 0.01),
              ListTile(
                title: Text(AppStrings.instance.addPhotos),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                ),
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.01),
              ListTile(
                title: Text(AppStrings.instance.changePassword),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                ),
                onTap: () {
                           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdatePasswordScreen()),
            );

                },
              ),
              SizedBox(height: screenHeight * 0.01),
              ListTile(
                title: Text(AppStrings.instance.pushNotifications),
                trailing: Switch(
                  value: _notificationSwitch,
                  onChanged: (value) {
                    setState(() {
                      _notificationSwitch = value;
                    });
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              ListTile(
                title: Text(AppStrings.instance.darkMode),
                trailing: Switch(
                  value: _darkModeSwitch,
                  onChanged: (value) {
                    setState(() {
                      _darkModeSwitch = value;
                    });
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              ListTile(
                title: Text(AppStrings.instance.privacyPolicy),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                ),
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.01),
              ListTile(
                title: Text(AppStrings.instance.termsConditions),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.instance.dataPrivacy),
                    Text(
                      AppStrings.instance.dataPrivacyDescription,
                      style: const TextStyle(color: MyColors.secondaryColor),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                ),
                onTap: () {
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DataPrivacySetting()),
            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
