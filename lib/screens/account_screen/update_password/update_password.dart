// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:dating_app/ui_utils/colors.dart';

class EnterUpdatePassword extends StatefulWidget {
  const EnterUpdatePassword({super.key});

  @override
  State<EnterUpdatePassword> createState() => _EnterUpdatePasswordState();
}

class _EnterUpdatePasswordState extends State<EnterUpdatePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        title:  Text(AppStrings.instance.updatePassword),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                           SizedBox(height: screenWidth*0.05),
              Container(
                padding:  EdgeInsets.all(screenWidth*0.01),
                decoration: BoxDecoration(
                  color: MyColors.whiteBg,
                  borderRadius: BorderRadius.circular(screenWidth*0.03),
                  border: Border.all(color: MyColors.surfaceDimColor),
                ),
                child: CustomPasswordField(controller: _passwordController),
              ),
              SizedBox(height: screenWidth*0.2),
              CustomButton(
                activeColors: MyColors.primaryColor,
                buttonText:AppStrings.instance.continueText,
                textColor: Colors.white,
                size: size,
                ontap: () {
                  // Handle update password action
                  if (_formKey.currentState?.validate() ?? false) {
                    
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

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordField({super.key, required this.controller});

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: AppStrings.instance.pleaseEnterPassword,
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.instance.pleaseEnterPassword;
        }
        return null;
      },
    );
  }
}
