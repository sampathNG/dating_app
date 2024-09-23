// ignore_for_file: prefer_const_constructors

import 'package:dating_app/screens/account_screen/update_password/update_pass_entercode.dart';
import 'package:dating_app/screens/account_screen/update_password/update_password.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/ui_utils/colors.dart';

// ignore: use_key_in_widget_constructors
class UpdatePasswordScreen extends StatefulWidget {
  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        title:  Text(AppStrings.instance.updatePassword,
        
          style: TextStyle(
                    fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(screenWidth * 0.03,),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
    SizedBox(height: screenHeight*0.03),
              Container(
                padding:  EdgeInsets.all( screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: MyColors.whiteBg,
                    borderRadius: BorderRadius.circular( screenWidth * 0.02),
                    border: Border.all(
                      color: MyColors.surfaceDimColor,
                    )),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: AppStrings.instance.emailAddress,
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return  AppStrings.instance.pleaseEnterMail;
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return  AppStrings.instance.pleaseEnterValidMail;
                    }
                    return null;
                  },
                ),
              ),
           
              SizedBox(height: screenHeight*0.03),
              CustomButton(
                activeColors: MyColors.primaryColor,
                buttonText: AppStrings.instance.continueText,
                textColor: Colors.white,
                size: size,
                ontap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateEnterCodeScreen()));
                  }
                },
                width: screenWidth * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
