import 'package:dating_app/app/search_screen/search_screen.dart';
import 'package:dating_app/screens/notification/notification_screen.dart';
import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "John Doe";
  int age = 30;
  List<String> items = ["item1", "item2", "item3"];
  int distance = 100;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Column(
          children: [
            Text(
              'Discover',
              style: CustomTextTheme.textTheme.headlineSmall!.copyWith(
                fontSize: size.width * 0.06,
              ),
            ),
            Text(
              'Chicago, II',
              style: CustomTextTheme.textTheme.labelMedium!.copyWith(
                fontSize: size.width * 0.04,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.addBellNotification,
            height: size.width * 0.06,
            width: size.width * 0.06,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: SvgPicture.asset(
              Assets.searchIconDiscover,
              height: size.width * 0.06,
              width: size.width * 0.06,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.filterIconDiscover,
              height: size.width * 0.06,
              width: size.width * 0.06,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                  ),
                  child: card(size, name, age, items, distance),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget card(Size size, String name, int age, List list, int distance) {
  return Card(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.02),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            child: Image.asset(
              Assets.frameImage,
              height: size.width * 0.75,
              width: size.width * 0.75,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: size.width * 0.75,
          width: size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.05),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name, $age',
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    color: MyColors.primaryColorWithOpacity,
                  ),
                  child: Text(
                    "$distance km away",
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: MyColors.white,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Wrap(
                  spacing: size.width * 0.01,
                  runSpacing: size.height * 0.005,
                  children: list.map((list) {
                    return Chip(
                      label: Text(
                        list,
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          color: MyColors.black,
                        ),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      backgroundColor: Colors.transparent.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.transparent.withOpacity(0.2),
                          width: size.width * 0.001,
                        ),
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
