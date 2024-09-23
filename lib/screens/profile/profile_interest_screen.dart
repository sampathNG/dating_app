import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> interests = [
    'Photography',
    'Shopping',
    'Karaoke',
    'Yoga',
    'Cooking',
    'Tennis',
    'Run',
    'Swimming',
    'Art',
    'Traveling',
    'Extreme',
    'Music',
    'Drink',
    'Video games'
  ];

  Map<String, IconData> interestIcons = {
    'Photography': Icons.camera_alt,
    'Shopping': Icons.shopping_cart,
    'Karaoke': Icons.mic,
    'Yoga': Icons.self_improvement,
    'Cooking': Icons.kitchen,
    'Tennis': Icons.sports_tennis,
    'Run': Icons.directions_run,
    'Swimming': Icons.pool,
    'Art': Icons.palette,
    'Traveling': Icons.flight,
    'Extreme': Icons.sports_motorsports,
    'Music': Icons.music_note,
    'Drink': Icons.local_bar,
    'Video games': Icons.videogame_asset,
  };

  List<String> selectedInterests = [];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.instance.skipTxt,
              style: const TextStyle(color: MyColors.primaryColor),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 110, right: 100),
            child: Text(
              AppStrings.instance.yourInterestTxt,
              style: CustomTextTheme.textTheme.headlineLarge
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 110,right: 100),
            child: Text(
              AppStrings.instance.selectYourInterestTxt,
              style: CustomTextTheme.textTheme.titleSmall,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 110),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 15,
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  String interest = interests[index];
                  return GestureDetector(
                    onTap: () => toggleInterest(interest),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedInterests.contains(interest)
                            ? MyColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: selectedInterests.contains(interest)
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Icon(
                              interestIcons[interest],
                              color: selectedInterests.contains(interest)
                                  ? Colors.white
                                  : MyColors.primaryColor,
                                  size: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            interest,
                            style: TextStyle(
                              color: selectedInterests.contains(interest)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: CustomButton(
                activeColors: MyColors.primaryColor,
                buttonText: AppStrings.instance.continueText,
                textColor: Colors.white,
                size: size ,
                ontap: () {
                },
                width: screenWidth * 0.55,
              ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}