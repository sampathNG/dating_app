import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ReportuserPopUp extends StatefulWidget {
  const ReportuserPopUp({super.key});

  @override
  State<ReportuserPopUp> createState() => _ReportuserPopUpState();
}

class _ReportuserPopUpState extends State<ReportuserPopUp> {
  void _showReportDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * 0.733,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: AlertDialog(
              title: Text(
                AppStrings.instance.reportUser,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              content: Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .85,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.instance.reason,
                                  style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.circle_outlined,
                                  size: 22,
                                  color: MyColors.primaryColor,
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1.5,
                                color: MyColors.grey,
                              )),
                        ),
                      );
                    }),
              ),
              actions: [
                CustomButton(
                    activeColors: MyColors.primaryColor,
                    buttonText: AppStrings.instance.report,
                    textColor: MyColors.white,
                    size: MediaQuery.of(context).size,
                    ontap: () {},
                    width: MediaQuery.of(context).size.width * 8)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.023,
            ),
            ElevatedButton(
              child: Text("Report User"),
              onPressed: _showReportDialog,
            ),
          ],
        ),
      ),
    );
  }
}
