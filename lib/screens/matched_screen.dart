import 'dart:ui';
import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../ui_utils/colors.dart';

class MatchedScreen extends StatefulWidget {
  const MatchedScreen({
    super.key,
  });

  @override
  State<MatchedScreen> createState() => _MatchedScreenState();
}

class _MatchedScreenState extends State<MatchedScreen> {
  final String userName = 'abcd';
  final List<Map<String, dynamic>> data = [
    {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "Jane Smith", "age": 25, "distance": 15},
    {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "John Doe", "age": 30, "distance": 10},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.whiteBg,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        title: Padding(
          padding: EdgeInsets.only(left: size.width * 0.02),
          child: Text(
            'Matches',
            style: Style.primaryAppBarTitleStyle,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Text(
                'Lorem ipsum dolor sit amat consecrator. Maecenas advising endue eger.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: size.width * 0.035,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.6,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: size.width * 0.02,
                  mainAxisSpacing: size.width * 0.02,
                  childAspectRatio: 0.7,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width * 0.02),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(size.width * 0.02),
                          child: Image.asset(
                            Assets.frameImage,
                            height: size.height * 0.3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.145,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(size.width * 0.01),
                            bottomRight: Radius.circular(size.width * 0.01),
                          ),
                          child: Stack(
                            children: [
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 10),
                                child: Container(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01),
                                  child: const VerticalDivider(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: size.height * 0.06,
                        left: size.width * 0.02,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: size.height * 0.02,
                        left: size.width * 0.02,
                        child: SvgPicture.asset('assets/images/close-small.svg'),
                      ),
                      Positioned(
                        bottom: size.height * 0.02,
                        right: size.width * 0.02,
                        child: SvgPicture.asset('assets/images/close-small.svg'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
