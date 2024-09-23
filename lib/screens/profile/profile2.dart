import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});

  @override
  _ProfilePage2State createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  final String profileImageUrl =
      'https://your-image-hosting-url/your-image.jpg';
  final String name = 'Jessica Parker';
  final int age = 23;
  final String profession = 'Professional model';
  final String location = 'Chicago, IL United States';
  final String about =
      'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading...';
  final List<String> interests = [
    'Travelling',
    'Books',
    'Music',
    'Dancing',
    'Modeling'
  ];
  final List<String> galleryImages = [
    Assets.pic1,
    Assets.pic2,
    Assets.pic3,
    Assets.pic4,
  ];

  double _buttonPosition = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueGrey[100]!, Colors.white],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 1.0,
                expand: false,
                builder: (context, scrollController) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        setState(() {
                          _buttonPosition = 250 - scrollController.offset * 4;
                        });
                      }
                      return false;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width *
                                    0.05,
                                vertical: MediaQuery.of(context).size.height *
                                    0.02,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '$name, $age',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            profession,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Text(
                                        location,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                                vertical: MediaQuery.of(context).size.height *
                                    0.02,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .width *
                                          0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    about,
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .width *
                                          0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                                vertical: MediaQuery.of(context).size.height *
                                    0.02,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Interests',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .width *
                                          0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: interests.map((interest) {
                                      bool isSelected =
                                          interests.indexOf(interest) < 2;
                                      return Chip(
                                        backgroundColor: MyColors.whiteBg,
                                        side: BorderSide(
                                          color: isSelected
                                              ? MyColors.darkPink
                                              : MyColors.lightGreyColor,
                                        ),
                                        avatar: isSelected
                                            ? SvgPicture.asset(Assets.doneAll)
                                            : null,
                                        label: Text(
                                          interest,
                                          style: TextStyle(
                                            color: isSelected
                                                ? MyColors.darkPink
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                                vertical: MediaQuery.of(context).size.height *
                                    0.02,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gallery',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: TextStyle(
                                            color: MyColors
                                                .primaryColorWithOpacity,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                            color: MyColors.primaryTextColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: galleryImages.length,
                                    itemBuilder: (context, index) {
                                      return Image.asset(galleryImages[index]);
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              top: _buttonPosition,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: MyColors.white,
                    elevation: 10,
                    shape: const CircleBorder(),
                    child: IconButton(
                      iconSize: MediaQuery.of(context).size.width * 0.08,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.dislike,
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.width * 0.07,
                      ),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.06),
                    ),
                  ),
                  Material(
                    color: const Color(0xffE94057),
                    elevation: 10,
                    shape: const CircleBorder(),
                    child: IconButton(
                      iconSize: MediaQuery.of(context).size.width * 0.08,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: MyColors.white,
                      ),
                      padding: const EdgeInsets.all(20), // Increase button size
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
