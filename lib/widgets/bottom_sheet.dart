import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? _selectedGender;
  String? _selectedLocation = 'Select Location';
  double _radius = 50;
  String selectedGender = 'male';

  void _showBottomSheet(BuildContext context) {
        final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left:screenWidth*0.4),
                child: Row(
                  children: [
                    const Center(
                      child:  Text(
                        'Filters',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                         SizedBox(
                          width: screenWidth*0.17),
                    TextButton(onPressed: (){}, child: const Text('Clear',style: TextStyle(color: MyColors.primaryColor,),))
                  ],
                ),
              ),
               const SizedBox(height: 16),
                const Text(
                    'Intrested In',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    const SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
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
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = 'Boy';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGender == 'Boy'
                                ? Colors.pink
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Boy',
                              style: TextStyle(
                                color: selectedGender == 'Boy'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = 'Girl';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGender == 'Girl'
                                ? Colors.pink
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Girl',
                              style: TextStyle(
                                color: selectedGender == 'Girl'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = 'both';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGender == 'both'
                                ? Colors.pink
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Both',
                              style: TextStyle(
                                color: selectedGender == 'both'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  title: Text(_selectedLocation!),
                  trailing: const Icon(Icons.location_on),
                  onTap: () {
                    // Handle location selection here
                  },
                ),
              ),
              const SizedBox(height: 16),
               Row(
                children: [
                  const Text(
                    'Distance',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(width: screenWidth*0.8),
                  const Text(
                    '40km',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                                 ),
                ],
              ),
              Slider(
                thumbColor: MyColors.primaryColor,
                secondaryActiveColor: MyColors.primaryColor,
                activeColor: MyColors.primaryColor,
                value: _radius,
                min: 1,
                max: 100,
                divisions: 99,
                label: _radius.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _radius = value;
                  });
                },
              ),
                Row(
                 children: [
                   const Text(
                    'Age',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                                 ),
                                     SizedBox(width: screenWidth*0.8),
                                 const Text(
                    '19',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                                 ),
                 ],
               ),
              Slider(
                  thumbColor: MyColors.primaryColor,
                secondaryActiveColor: MyColors.primaryColor,
                activeColor: MyColors.primaryColor,
                value: _radius,
                min: 1,
                max: 100,
                divisions: 99,
                label: _radius.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _radius = value;
                  });
                },
              ),
              const SizedBox(height: 16),
            
               CustomButton(
                activeColors: Colors.pink.shade200,
                buttonText: 'Continue',
                textColor: Colors.white,
                size: size,
                ontap: () {

                 
                },
                width: screenWidth * 0.9,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _genderOption(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: _selectedGender == gender ? Colors.pink : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: _selectedGender == gender ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: const Text('Show Filter Bottom Sheet'),
        ),
      ),
    );
  }
}
