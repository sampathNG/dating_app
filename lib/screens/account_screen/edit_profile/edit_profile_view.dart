// ignore_for_file: prefer_const_constructors

import 'package:dating_app/screens/account_screen/edit_profile/edit_personal_detail.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/ui_utils/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        title: Text(
          AppStrings.instance.editProfile,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.instance.personalSetting,
                    style: TextStyle(
                        fontSize: screenWidth * 0.047,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditPersonalDetail()),
            );

                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          text: AppStrings.instance.edit,
                          style: TextStyle(
                            fontSize: screenWidth * 0.043,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue, // Set to blue color
                            decoration: TextDecoration.underline, // Underline
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenWidth * 0.047,
            ),
            _buildProfileField(
                AppStrings.instance.name, AppStrings.instance.name),
            SizedBox(
              height: screenWidth * 0.047,
            ),
            _buildProfileField(AppStrings.instance.number, '567678567'),
            SizedBox(
              height: screenWidth * 0.047,
            ),
            _buildProfileField(AppStrings.instance.dob, '01/01/1990'),
            SizedBox(
              height: screenWidth * 0.047,
            ),
            _buildProfileField(
                AppStrings.instance.emailAddress, 'johndoe@example.com'),
            SizedBox(
              height: screenWidth * 0.047,
            ),
            Text(
              AppStrings.instance.discoverySetting,
              style: TextStyle(
                  fontSize: screenWidth * 0.047, fontWeight: FontWeight.w700),
            ),
             SizedBox(
              height: screenWidth * 0.047,
            ),
            _buildPDiscoverySetting(     AppStrings.instance.location, 'My Current Location'),
             SizedBox(
              height: screenWidth * 0.047,
            ),
       _buildPDiscoverySetting(    'Preferred Language', 'English'),
             SizedBox(
              height: screenWidth * 0.047,
            ),
            _buildPDiscoverySetting(    'Show Me', 'Men')
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(
        screenWidth * 0.04,
      ),
      decoration: BoxDecoration(
        color: MyColors.whiteBg,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        border: Border.all(color: MyColors.surfaceDimColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: MyColors.secondaryColor),
          ),
        ],
      ),
    );
  }


Widget _buildPDiscoverySetting(String label, String value) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(
        screenWidth * 0.04,
      ),
      decoration: BoxDecoration(
        color: MyColors.whiteBg,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        border: Border.all(color: MyColors.surfaceDimColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}