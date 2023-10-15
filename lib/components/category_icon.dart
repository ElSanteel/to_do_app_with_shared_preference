import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  Color containerColor;
  Color iconColor;
  String imagePath;
  final VoidCallback onTap; // Add an onTap callback
  bool isSelected;

  CategoryIcon(
      {required this.containerColor,
      required this.iconColor,
      required this.imagePath,
      required this.onTap,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Colors.purple
                : Colors.white, // Change border color based on isSelected
            width: 2.0, // Border width
          ),
        ),
        child: Center(child: Image.asset(imagePath)),
      ),
    );
  }
}
