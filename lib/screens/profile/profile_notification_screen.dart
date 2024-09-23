
import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dating_app/ui_utils/assets.dart';


class ProfileNotificationScreen extends StatefulWidget {
  const ProfileNotificationScreen({super.key});

  @override
  State<ProfileNotificationScreen> createState() => _ProfileNotificationScreenState();
}

class _ProfileNotificationScreenState extends State<ProfileNotificationScreen> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.instance.skipTxt,
              style: const TextStyle(color: MyColors.primaryColor),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.36,
                    width: screenWidth * 0.36,
                    child: SvgPicture.asset(Assets.chatSvg),
                  ),
                ],
              ),
            ),
            Text(
              AppStrings.instance.notificationsTxt,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.instance.getNotificationsTxt,
                textAlign: TextAlign.center,
                style: CustomTextTheme.textTheme.labelLarge,
               
              ),
            ),
            SizedBox(height: screenHeight * 0.2,),
            ElevatedButton(
              onPressed: () {
                _showContactDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Text(AppStrings.instance.wantToBeNotifiedBtn,
                style: TextStyle(color: MyColors.white,),),
              ),
            ),
            SizedBox(height: screenHeight * 0.15,)
          ],
        ),
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: MyColors.primaryColor,
                size: 50,
              ),
              SizedBox(height: screenHeight * 0.02,),
              const SizedBox(height: 10),
              Text(AppStrings.instance.allowAppSendNotificationTxt),
              Text(AppStrings.instance.allowAppSendNotificationTxt1,),
              SizedBox(height: screenHeight * 0.04,)
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle allow action
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    child: Text(
                      AppStrings.instance.allowTxt,
                      style: const TextStyle(color: MyColors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.0050),
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle allow action
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    child: Text(
                      AppStrings.instance.dontAllowTxt,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        )
        );
      },
    );
  }
}

