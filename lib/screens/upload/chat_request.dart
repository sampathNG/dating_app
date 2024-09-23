import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ChatRequest extends StatelessWidget {
  final String userName = 'abcd';
  const ChatRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: size.width * 0.06,
        ),
        title: Text(
          AppStrings.instance.chatRequest,
          style: TextStyle(
            color: MyColors.black,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.188,
          ),
          Center(
            child: SizedBox(
              width: size.width * 0.6,
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.instance.requestedAccept,
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.7,
            child: Text(
              textAlign: TextAlign.center,
              AppStrings.instance.chatUse("$userName you can chat with each other!"),
              style: TextStyle(
                color: MyColors.grey,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.081,
          ),
          CustomButton(
            activeColors: Colors.pink.shade200,
            buttonText: AppStrings.instance.chat,
            textColor: Colors.white,
            size: size,
            ontap: () {},
            width: size.width * 0.8,
          ),
          SizedBox(
            height: size.height * 0.283,
          ),
        ],
      ),
    );
  }
}
