import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';

class CustomizePopup extends StatelessWidget {
  const CustomizePopup({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showPopupDialog(context);
          },
          child: Text('Show Popup'),
        ),
      ),
    );
  }

  void _showPopupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * 0.160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: AlertDialog(
              title: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: MyColors.reportTxtColor),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.048,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          textAlign: TextAlign.center,
                          AppStrings.instance.yes,
                          style: TextStyle(
                              color: MyColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: MyColors.primaryColor, width: 1),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.048,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          textAlign: TextAlign.center,
                          AppStrings.instance.no,
                          style: TextStyle(
                              color: MyColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: MyColors.primaryColor, width: 1),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
