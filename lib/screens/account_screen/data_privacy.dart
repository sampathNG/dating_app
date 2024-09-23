// ignore_for_file: prefer_const_constructors

import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class DataPrivacySetting extends StatefulWidget {
  const DataPrivacySetting({super.key});

  @override
  State<DataPrivacySetting> createState() => _DataPrivacySettingState();
}

class _DataPrivacySettingState extends State<DataPrivacySetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        title: Center(
          child: Text(
            AppStrings.instance.accountPrivacyTxt,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PrivacyDetail(),
                  SizedBox(height: screenHeight * 0.33), // Placeholder to create space for the button
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: CustomButton(
              activeColors: Colors.pink.shade200,
              buttonText: AppStrings.instance.save,
              textColor: Colors.white,
              size: size,
              ontap: () {},
              width: screenWidth * 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
class PrivacyDetail extends StatefulWidget {
  @override
  _PrivacyDetailState createState() => _PrivacyDetailState();
}

class _PrivacyDetailState extends State<PrivacyDetail> {
  final List<String> _options = [
    'Your Friends & Date',
    'Only to Near me',
    'All',
  ];

  final Map<String, bool> _selectedOptions = {};
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 13),
      child: GestureDetector(
        onTap: () {
          setState(() {
          _isExpanded = !_isExpanded;
          });
        },
        child: Stack(
          children:[ Container(
            height: _isExpanded ? screenHeight * 0.4 : screenHeight * 0.1,
            width: screenWidth * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
           
                    if (!_isExpanded) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Text(
                        AppStrings.instance.showAccountDetailsTxt,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  if (_isExpanded) ...[
                   Positioned(
        top: screenWidth* 0.09,
        left: screenWidth* 0.08,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              
              color: Color.fromARGB(255, 249, 193, 212),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding:  EdgeInsets.all(screenWidth* 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    AppStrings.instance.showAccountDetailsTxt,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontSize: screenWidth* 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                   Text(
                    AppStrings.instance.onlyTo,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontSize: screenWidth* 0.04,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: ListView(
                      children: _options.map((option) {
                        return Padding(
                          padding:
                               EdgeInsets.symmetric(vertical: screenWidth* 0.013),
                          child: Row(
                            children: [
                              Container(
                                width:     screenWidth* 0.09, 
                                height:
                                   screenWidth* 0.09, 
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _selectedOptions[option] ?? false
                                      ? MyColors.primaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: _selectedOptions[option] ?? false
                                        ? Colors.transparent
                                        : Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                child: _selectedOptions[option] ?? false
                                    ?  Icon(
                                        Icons.check,
                                        size:     screenWidth* 0.02,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                               SizedBox(
                                  width:
                                      screenWidth* 0.02), 
                              Expanded(
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
                  ],
                ],
              ),
            ),
          ),
      
              ],
              ),
      ),
    );
  }
}
