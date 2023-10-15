import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_shared_preference/blocs/todo_cubit.dart';

import '../screens/todo_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => TodoCubit()),
      ],
      child:
          (MaterialApp(debugShowCheckedModeBanner: false, home: TodoScreen())),
    );
  }
}
