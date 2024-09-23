import 'package:dating_app/screens/notification/notification_screen.dart';
import 'package:dating_app/ui_utils/assets.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/custom_container.dart';
import 'package:dating_app/ui_utils/custom_text_field.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 0;
  final List<String> items = ['Interest 1', 'Interest', 'Interest', 'Interest'];
  late FocusNode myFocusNode;
   String name = "John Doe";
  int age = 30;
  int distance = 100;
final List<Map<String, dynamic>> data = [
  {"name": "John Doe", "age": 30, "distance": 10},
  {"name": "Jane Smith", "age": 25, "distance": 15},
   {"name": "John Doe", "age": 30, "distance": 10},
    {"name": "John Doe", "age": 30, "distance": 10},
     {"name": "John Doe", "age": 30, "distance": 10},
      {"name": "John Doe", "age": 30, "distance": 10},
      {"name": "John Doe", "age": 30, "distance": 10},
       {"name": "John Doe", "age": 30, "distance": 10},
  // Add more data as needed
];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Column(
          children: [
            Text(
              'Discover',
              style: CustomTextTheme.textTheme.headlineSmall,
            ),
            Text(
              'Chicago, II',
              style: CustomTextTheme.textTheme.labelMedium,
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.addBellNotification,
            height: 24,
            width: 24,
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
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.filterIconDiscover,
              height: 24,
              width: 24,
            ),
          ),
        ],
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.2), // Adjust height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategoryList(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Adjust spacing
          buildSearchField(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04), // Adjust spacing
         
        ],
      ),
    ),
      ),
       body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns in grid
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
             childAspectRatio: 0.6
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              Assets.frameImage,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                       Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.primaryColorWithOpacity),
                  child: Text(
              '${data[index]['distance']} km',
                    style: const TextStyle(
                      fontSize: 16,
                      color: MyColors.white,
                    ),
                  ),
                ),
                    
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


Widget recentSearchCard(String name, int age,  int distance) {
  return Card(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              Assets.frameImage,
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name, $age',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.primaryColorWithOpacity),
                  child: Text(
                    "${distance} km away",
                    style: const TextStyle(
                      fontSize: 16,
                      color: MyColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                
      ])
          ),
        ),
      ],
    ),
  );}
Widget buildSearchField(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05), // Adjust horizontal padding
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06, // Adjust height
      child: CustomTextField(
        labelText: AppStrings.search,
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
}}