import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double size;
  bool isBold = false;
  CustomText(
      {required this.size,
      required this.color,
      required this.isBold,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: isBold ? FontWeight.w400 : FontWeight.normal,
        ),
      ),
    );
  }
}
