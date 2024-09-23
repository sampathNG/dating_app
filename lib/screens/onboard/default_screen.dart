import 'package:dating_app/screens/login_screen/login_scren.dart';
import 'package:dating_app/screens/sign_up_screen/signup_screen.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.pink.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: screenHeight * 0.15),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'By clicking Log In, you agree with our ',
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Terms tap
                          },
                      ),
                      TextSpan(
                        text: 'Learn how we process your data in our',
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.instance.privacyPolicy,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Privacy Policy tap
                          },
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.instance.cookiesPolicy,
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Cookies Policy tap
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.12),
              CustomButton(
                activeColors: Colors.white,
                buttonText: AppStrings.instance.loginWithMail,
                textColor: Colors.black,
                size: size,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                width: screenWidth * 0.9,
              ),
              SizedBox(height: screenHeight * 0.07),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                  },
                  child: Text(
                    AppStrings.instance.dotHaveAccount,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
