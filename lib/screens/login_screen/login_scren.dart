import 'package:dating_app/screens/login_screen/enter_code.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
            AppStrings.instance.myEmailIs,
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.09),
               TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.instance.emailAddress,
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.03),
                child: Text(
                  textAlign: TextAlign.left,
                  AppStrings.instance.byClickingPrivacyPolicy,
                  style: TextStyle(
                      fontSize: screenWidth * 0.03, color: Colors.grey),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              CustomButton(
                activeColors: Colors.pink.shade200,
                buttonText: AppStrings.instance.continueText,
                textColor: Colors.white,
                size: size,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EnterCodeScreen()));
                },
                width: screenWidth * 0.9,
              ),
              SizedBox(height: screenHeight * 0.3),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
