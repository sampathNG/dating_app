
// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/ui_utils/colors.dart';
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key, required bool value, required Null Function(dynamic value) onChanged});

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return  Center(child:Transform.scale(
            scale: 0.9,
        child: 
        Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
        isSwitched = value;
                });
              },
              activeTrackColor: MyColors.primaryColor,
              activeColor: MyColors.whiteBg,
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: MyColors.primaryColor,
        )    ));
        
    
  }
}