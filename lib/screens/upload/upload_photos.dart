import 'dart:io';

import 'package:dating_app/screens/matched_screen.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotos extends StatefulWidget {
  const UploadPhotos({super.key});

  @override
  State<UploadPhotos> createState() => _UploadPhotosState();
}

class _UploadPhotosState extends State<UploadPhotos> {
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        // Limit to 5 images
        _images =
            selectedImages.take(5).map((xfile) => File(xfile.path)).toList();
      });
    }
  }

  void _onButtonPressed() {
    if (_images.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MatchedScreen()),
      );
    } else {
      _pickImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: size.width * 0.06,
        ),
        title: Text(
          'Add Photo',
          style: TextStyle(
            color: MyColors.black,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_images.isEmpty)
            Center(
              child: SizedBox(
                width: size.width * 0.6,
                child: Text(
                  'No Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: size.height * 0.3,
              child: GridView.count(
                childAspectRatio: 1,
                crossAxisCount: 3,
                crossAxisSpacing: size.width * 0.02,
                mainAxisSpacing: size.height * 0.01,
                children: List.generate(
                  5,
                  (index) {
                    if (index >= _images.length) {
                      return Container(); // Fill remaining with empty containers
                    }
                    return Container(
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                        image: DecorationImage(
                          image: FileImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          SizedBox(
            height: size.height * 0.133,
          ),
          CustomButton(
            activeColors: Colors.pink.shade200,
            buttonText: _images.isEmpty ? 'Add Photos' : 'Next',
            textColor: Colors.white,
            size: size,
            ontap: _onButtonPressed,
            width: size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
