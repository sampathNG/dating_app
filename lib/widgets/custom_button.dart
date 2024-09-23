import 'package:dating_app/ui_utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({
    super.key,
    required this.activeColors,
    required this.buttonText,
    required this.textColor,
    required this.size,
    required this.ontap,
    required this.width,
    this.isTransparentButton = false,
  });

  final Size size;
  final Color activeColors;
  final Color textColor;
  final String buttonText;
  final VoidCallback ontap;
  final double width;
  final bool isTransparentButton;

  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width ,
      height: screenHeight*0.06,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: activeColors),
          backgroundColor: isTransparentButton == true
              ? Colors.white
              : activeColors,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight*0.02,
          ),
          textStyle: TextStyle(
             fontSize: screenWidth*0.05,
              fontWeight: FontWeight.bold,
              color: isTransparentButton == true
                  ? activeColors
                  : MyColors.whiteBg),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: screenWidth*0.04,
              fontWeight: FontWeight.w600,
              color: textColor),
        ),
      ),
    );
  }
}
