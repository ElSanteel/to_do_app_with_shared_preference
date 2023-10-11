import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_shared_preference/components/build_task_list.dart';
import '../blocs/todo_cubit.dart';
import '../core/size_config.dart';
import 'add_task.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: const Color(0xfff1f5f9),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Stack(
            children: [
              Image.asset(
                "assets/images/Todo.png",
                width: SizeConfig.screenWidth! * 1,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 25,
                top: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 27,
                      color: Color(0xff4A3780),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 23,
                child: BuildTaskListView(
                    tasks: cubit.uncompletedTasks, cubit: cubit),
              ),
              const Positioned(
                top: 450,
                left: 25,
                child: Text(
                  "Completed",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 200,
                left: 23,
                child: BuildTaskListView(
                    tasks: cubit.completedTasks, cubit: cubit),
              ),
              Positioned(
                left: 50,
                bottom: 50,
                child: SizedBox(
                  width: SizeConfig.screenWidth! * 0.8,
                  height: SizeConfig.screenHeight! * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddNewTaskScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xFF4A3780),
                    ),
                    child: const Text(
                      "add to task",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
