import 'package:flutter/material.dart';
import 'package:todo_app_with_shared_preference/service/shared_prefrence_helper.dart';
import 'package:todo_app_with_shared_preference/src/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(const AppRoot());
}
