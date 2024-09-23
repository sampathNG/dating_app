import 'package:dating_app/ui_utils/custom_button.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';

import '../../ui_utils/colors.dart';
import '../../ui_utils/custom_text_field.dart';

class Sendmessage extends StatefulWidget {
  const Sendmessage({super.key});

  @override
  State<Sendmessage> createState() => _SendmessageState();
}

class _SendmessageState extends State<Sendmessage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppStrings.sendMessgae,
          style: TextStyle(
            fontSize: size.width * 0.05,
            color: MyColors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MyColors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.requestSent,
                  style: TextStyle(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  AppStrings.writeRequestmessage,
                  maxLines: 2,
                  style: TextStyle(
                    color: MyColors.surfaceDimColor,
                    fontSize: size.width * 0.05,
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                TextField(
                  decoration: InputDecoration(
                    hintText: " ",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: size.height * 0.025),
                CustomButton(
                  text: AppStrings.send,
                  onPressed: () {
                    // Handle button press
                  },
                  backgroundColor: MyColors.onSurface,
                  textColor: Colors.white,
                  fontSize: size.width * 0.045,
                  padding: size.width * 0.35,
                  borderRadius: size.width * 0.125,
                  elevation: 5,
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
