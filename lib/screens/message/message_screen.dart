import 'package:dating_app/screens/chat/chat_screen.dart';
import 'package:dating_app/ui_utils/custom_container.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui_utils/assets.dart';
import '../../ui_utils/colors.dart';
import '../../ui_utils/custom_text_field.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> items = ['Friends', 'Date', 'Other', 'Other'];

  int selectedIndex = 0;

  late FocusNode myFocusNode;

  List<Map<String, dynamic>> userData = [
    {
      'name': "Emelie",
      'message': 'Sticker 😍',
      'type': 'received',
      'unread': 1
    },
    {'name': "Abigail", 'message': 'Typing..', 'type': 'received', 'unread': 1},
    {
      'name': "Elizabeth",
      'message': 'Ok, see you then.',
      'type': "received",
      'unread': 1
    },
    {
      'name': "Penelope",
      'message': 'Hey! What’s up, long time..',
      'type': "sent",
      'unread': 0
    },
    {
      'name': "Chloe",
      'message': 'Hello how are you?',
      'type': "sent",
      'unread': 0
    },
    {
      'name': "Grace",
      'message': 'Great I will write later..',
      'type': "sent",
      'unread': 0
    },
    {
      'name': "Emelie",
      'message': 'Sticker 😍',
      'type': 'received',
      'unread': 1
    },
    {'name': "Abigail", 'message': 'Typing..', 'type': 'received', 'unread': 1},
    {
      'name': "Elizabeth",
      'message': 'Ok, see you then.',
      'type': "received",
      'unread': 1
    },
    {
      'name': "Penelope",
      'message': 'Hey! What’s up, long time..',
      'type': "sent",
      'unread': 0
    },
    {
      'name': "Chloe",
      'message': 'Hello how are you?',
      'type': "sent",
      'unread': 0
    },
    {
      'name': "Grace",
      'message': 'Great I will write later..',
      'type': "sent",
      'unread': 0
    },
  ];

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: MyColors.whiteBg,
    title: Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02), // Adjust padding
      child: Text(
        AppStrings.message,
        style: Style.primaryAppBarTitleStyle,
      ),
    ),
    centerTitle: false,
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.2), // Adjust height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategoryList(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Adjust spacing
          buildSearchField(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Adjust spacing
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              AppStrings.message,
              style: GoogleFonts.roboto(
                fontSize: MediaQuery.of(context).size.width * 0.045, // Adjust font size
                fontWeight: FontWeight.w700,
                color: MyColors.black,
              ),
            ),
          )
        ],
      ),
    ),
  ),
  body: ListView.builder(
    shrinkWrap: true,
    itemCount: userData.length,
    itemBuilder: (context, index) {
      return buildMessageTile(context, userData[index]);
    },
  ),
);
  }
Widget buildSearchField(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05), // Adjust horizontal padding
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06, // Adjust height
      child: CustomTextField(
        labelText: AppStrings.search,
        focusNode: myFocusNode,
        autoFocus: true,
        hintTextStyle: GoogleFonts.roboto(
          fontSize: MediaQuery.of(context).size.width * 0.035, // Adjust font size
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w400,
        ),
        labelStyle: GoogleFonts.roboto(
          fontSize: MediaQuery.of(context).size.width * 0.035, // Adjust font size
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w400,
        ),
        onTap: () {},
        onChanged: (value) {},
        borderColor: MyColors.borderColor,
        fillColor: MyColors.white,
        isFilled: true,
        borderRadius: MediaQuery.of(context).size.width * 0.04, // Adjust border radius
        borderWidth: 1.0,
        focusedBorderWidth: 0.0,
        hintText: AppStrings.search,
        margin: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        keyboardType: TextInputType.text,
        isLabelEnabled: false,
        overrideHintText: true,
        elevation: 0,
        focusedBorderColor: MyColors.borderColor,
        trailingFunction: () {},
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.03), // Adjust width
            InkWell(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Icon(Icons.search)
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02), // Adjust width
          ],
        ),
        showTrailingWidget: false,
        textStyle: GoogleFonts.workSans(
          fontSize: MediaQuery.of(context).size.width * 0.035, // Adjust font size
          color: MyColors.black,
          fontWeight: FontWeight.w500,
        ),
        showLeadingWidget: true,
      ),
    ),
  );
}

Widget buildCategoryList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.045), // Adjust left padding
    child: Container(
      height: MediaQuery.of(context).size.height * 0.038, // Adjust height
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomContainer(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            width: MediaQuery.of(context).size.width * 0.25, // Adjust width
            height: MediaQuery.of(context).size.height * 0.05, // Adjust height
            borderRadius: MediaQuery.of(context).size.width * 0.02, // Adjust border radius
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03), // Adjust right margin
            backgroundColor: (selectedIndex == index)
                ? MyColors.primaryColor
                : MyColors.unselectedColor,
            child: Center(
              child: Text(
                items[index],
                style: GoogleFonts.roboto(
                  color: MyColors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.035, // Adjust font size
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
Widget buildMessageTile(BuildContext context, Map userData) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    },
    child: Container(
      color: MyColors.whiteBg,
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05, // Adjust left padding
          right: MediaQuery.of(context).size.width * 0.05, // Adjust right padding
          top: MediaQuery.of(context).size.height * 0.01, // Adjust top padding
          bottom: MediaQuery.of(context).size.height * 0.01, // Adjust bottom padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              height: MediaQuery.of(context).size.height * 0.07, // Adjust height
              width: MediaQuery.of(context).size.width * 0.13, // Adjust width
              borderRadius: MediaQuery.of(context).size.width * 0.1, // Adjust border radius
              backgroundColor: MyColors.containerBackground1,
              padding: 0,
              margin: EdgeInsets.zero,
              child: Image.network('https://picsum.photos/250?image=9'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4, // Adjust width
                  child: Text(
                    userData['name'],
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width * 0.035, // Adjust font size
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004, // Adjust spacing
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6, // Adjust width
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04, // Adjust font size
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: (userData['type'] == 'sent') ? 'You:' : '',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width * 0.04, // Adjust font size
                            color: MyColors.black.withOpacity(0.4),
                          ),
                        ),
                        TextSpan(
                          text: ' ${userData['message']}',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width * 0.04, // Adjust font size
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "23 min",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * 0.025, // Adjust font size
                    color: MyColors.lightGreyColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01, // Adjust spacing
                ),
                (userData['unread'] != 0)
                    ? CustomContainer(
                        height: MediaQuery.of(context).size.height * 0.025, // Adjust height
                        width: MediaQuery.of(context).size.height * 0.025, // Adjust width
                        backgroundColor: MyColors.red,
                        borderRadius: MediaQuery.of(context).size.height * 0.015, // Adjust border radius
                        margin: EdgeInsets.zero,
                        padding: 0,
                        paddingEdge: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            "1",
                            style: GoogleFonts.roboto(
                              fontSize: MediaQuery.of(context).size.width * 0.03, // Adjust font size
                              color: MyColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    ),
  );
}}