import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final _otpControllers = List.generate(4, (index) => TextEditingController());
  final _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body:  Padding(
        padding:  EdgeInsets.only(left:screenHeight*0.01,
        top: screenHeight*0.12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.instance.enterCode, 
                  style:  TextStyle(
                                   fontSize: screenWidth*0.1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                Text(AppStrings.instance.codeIsSent, 
                  style:  TextStyle(
                                   fontSize: screenWidth*0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),),
                              SizedBox(height: screenHeight * 0.09), 
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: screenWidth*0.1,
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          fontSize:  screenWidth*0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                          }
                        },
                      ),
                    );
                  }),
                ),
               SizedBox(height: screenHeight * 0.04),
              
                  Center(
                    child: TextButton(
                      
                      onPressed: (){}, child: Text(
                      style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                    AppStrings.instance.resend)),
                  ),
                  CustomButton(
                      activeColors: Colors.pink.shade200,
                      buttonText:   AppStrings.instance.continueText,
                      textColor: Colors.white,
                      size: size,
                      ontap: () {
                        
                      },
                      width: screenWidth*0.9,
                    ),
                      SizedBox(height: screenHeight * 0.42), 
                ],
              ),
            ),
          ),
        ),
      ),
    );;
  }
}