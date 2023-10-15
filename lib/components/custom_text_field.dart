import 'package:flutter/material.dart';
import 'package:todo_app_with_shared_preference/core/size_config.dart';

class CustomTextField extends StatelessWidget {
  String text;
  Icon? icon;
  TextEditingController controller = TextEditingController();
  final onTap;

  dynamic validator;

  CustomTextField(
      {this.icon,
      super.key,
      required this.controller,
      required this.text,
      this.onTap,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: SizedBox(
        width: SizeConfig.screenWidth! * 0.9,
        child: TextFormField(
          validator: validator,
          controller: controller,
          textDirection: TextDirection.ltr,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: text,
            hintStyle: const TextStyle(fontSize: 16),
            hintTextDirection: TextDirection.ltr,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
