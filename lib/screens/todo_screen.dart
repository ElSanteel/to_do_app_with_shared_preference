import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo_cubit.dart';
import '../components/build_list_tile.dart';
import '../core/size_config.dart';
import 'Add_task.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();

    final todoCubit = TodoCubit.get(context);
    todoCubit.initializeTasks(
        todoCubit.uncompletedTasks, todoCubit.completedTasks);
  }

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
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 23,
                child: Container(
                  width: SizeConfig.screenWidth! * 0.9,
                  height: SizeConfig.screenHeight! * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cubit.uncompletedTasks.length,
                      itemBuilder: (context, index) {
                        final task = cubit.uncompletedTasks[index];
                        return CustomListTile(
                          imagePath: task.imagePath,
                          title: task.title,
                          subtitle: task.subtitle,
                          completed: task.completed,
                          // Pass the toggle function as a callback
                          onCheckboxChanged: (bool? value) {
                            cubit.toggleTaskCompletion(task);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const Positioned(
                  top: 450,
                  left: 25,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                bottom: 200,
                left: 23,
                child: Container(
                  width: SizeConfig.screenWidth! * 0.9,
                  height: SizeConfig.screenHeight! * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.completedTasks.length,
                    itemBuilder: (context, index) {
                      final task = cubit.completedTasks[index];
                      return CustomListTile(
                        imagePath: task.imagePath,
                        title: task.title,
                        subtitle: task.subtitle,
                        completed: task.completed,
                        onCheckboxChanged: (bool? value) {
                          cubit.toggleTaskCompletion(task);
                        },
                      );
                    },
                  ),
                ),
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
                          builder: (context) => AddNewTaskScreen(
                            uncompletedTasks: cubit.uncompletedTasks,
                            onTaskAdded: (updatedTasks) {
                              cubit.uncompletedTasks = updatedTasks;
                            },
                          ),
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
