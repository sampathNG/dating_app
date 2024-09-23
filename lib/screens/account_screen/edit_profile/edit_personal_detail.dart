import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EditPersonalDetail extends StatefulWidget {
  const EditPersonalDetail({super.key});

  @override
  State<EditPersonalDetail> createState() => _EditPersonalDetailState();
}

class _EditPersonalDetailState extends State<EditPersonalDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        title: Text(     AppStrings.instance.edit,
         style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05,),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.instance.personalDetail,
                style: TextStyle(
                    fontSize: screenWidth * 0.06, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: MyColors.whiteBg,
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    border: Border.all(
                      color: MyColors.surfaceDimColor,
                    )),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: AppStrings.instance.name,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: MyColors.whiteBg,
    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    border: Border.all(
                      color: MyColors.surfaceDimColor,
                    )),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: AppStrings.instance.number,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: MyColors.whiteBg,
        borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    border: Border.all(
                      color: MyColors.surfaceDimColor,
                    )),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: AppStrings.instance.dob,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.01),
                decoration: BoxDecoration(
                    color: MyColors.whiteBg,
    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    border: Border.all(
                      color: MyColors.surfaceDimColor,
                    )),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: AppStrings.instance.emailAddress,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomButton(
                activeColors: Colors.pink.shade200,
                buttonText: AppStrings.instance.save,
                textColor: Colors.white,
                size: size,
                ontap: () {},
                width: screenWidth * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
