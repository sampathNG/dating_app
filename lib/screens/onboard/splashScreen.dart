import 'package:dating_app/screens/onboard/default_screen.dart';
import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
 
void initState() {
    super.initState();
  navigateToNextScreen();
  }
  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) 
    =>  ProfileDetailsScreen()));
    });
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
              SizedBox(height: screenHeight * 0.3), 
             
       
             
            ],
          ),
        ),
      ),
    );
  }
}