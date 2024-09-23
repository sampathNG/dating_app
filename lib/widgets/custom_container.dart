import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeContainer extends StatelessWidget {
  final String text;
  final borderColor;
  final color;
  String? image;
  CustomizeContainer(
      {super.key,
      required this.text,
      this.image,
      this.color,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.052,
      width: MediaQuery.of(context).size.width * 0.27,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: borderColor,
              //color: MyColors.darkPink,
              width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            image!,
            // Assets.doneAll,
            fit: BoxFit.cover,
            // height: MediaQuery.of(context).size.height * 0.016,
            // width: MediaQuery.of(context).size.width * 0.016,
          ),
          Text(text,
              style: TextStyle(
                  color: color,
                  // MyColors.darkPink,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
