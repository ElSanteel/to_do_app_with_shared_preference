import 'package:flutter/material.dart';
import 'package:todo_app_with_shared_preference/core/size_config.dart';

class AddNewTask extends StatelessWidget {
  String text;
  Icon? icon;
  AddNewTask({this.icon, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: SizedBox(
        width: SizeConfig.screenWidth! * 0.9,
        child: TextFormField(
          textDirection: TextDirection.ltr,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            filled: true, //<-- SEE HERE
            fillColor: Colors.white, //<-- SEE HERE
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
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
