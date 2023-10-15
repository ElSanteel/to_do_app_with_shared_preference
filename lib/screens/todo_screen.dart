import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_shared_preference/components/build_task_list.dart';
import 'package:todo_app_with_shared_preference/components/custom_elevated_button.dart';
import 'package:todo_app_with_shared_preference/model/task_model.dart';
import 'package:todo_app_with_shared_preference/screens/add_task.dart';
import '../blocs/todo_cubit.dart';
import '../core/size_config.dart';

class TodoScreen extends StatelessWidget {
  final Task? newTask;
  const TodoScreen({super.key, this.newTask});

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
                top: 435,
                left: 25,
                child: Text(
                  "Completed",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 140,
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
                  child: CustomElevatedButton(
                    content: "Add New Task",
                    buttonFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewTaskScreen(),
                        ),
                      );
                    },
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
