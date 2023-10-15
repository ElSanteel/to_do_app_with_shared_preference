import 'package:flutter/material.dart';

import '../core/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  String content;
  VoidCallback buttonFunction;

  CustomElevatedButton(
      {required this.content, required this.buttonFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.8,
      height: SizeConfig.screenHeight! * 0.06,
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color(0xFF4A3780),
        ),
        child: Text(
          content,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
