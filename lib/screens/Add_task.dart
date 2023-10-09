import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_shared_preference/core/size_config.dart';
import 'package:todo_app_with_shared_preference/screens/todo_screen.dart';

import '../blocs/todo_cubit.dart';
import '../components/add_new_task_text_field.dart';
import '../components/category_icon.dart';
import '../components/custom_text.dart';
import '../model/task_model.dart';

class AddNewTaskScreen extends StatefulWidget {
  final List<Task> uncompletedTasks;
  final Function(List<Task>) onTaskAdded;

  const AddNewTaskScreen({
    Key? key,
    required this.uncompletedTasks,
    required this.onTaskAdded,
  }) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f5f9),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Header.png',
                  width: SizeConfig.screenWidth! * 1,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 27,
                      color: Color(0xff4A3780),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                    size: 20,
                    color: Colors.black,
                    isBold: true,
                    text: 'Task Title'),
                const SizedBox(
                  height: 10,
                ),
                AddNewTask(text: 'Task Title'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    CustomText(
                        size: 15,
                        color: Colors.black,
                        isBold: true,
                        text: 'Category'),
                    const SizedBox(
                      width: 30,
                    ),
                    CategoryIcon(
                      containerColor: cubit.selectedCategory == 'Task'
                          ? const Color(0xff92cbf5)
                          : Colors.transparent,
                      iconColor: cubit.selectedCategory == 'Task'
                          ? const Color(0xff194a66)
                          : Colors.black,
                      imagePath: "assets/images/Task.png",
                      onTap: () {
                        cubit.taskSelected;
                      },
                    ),
                    CategoryIcon(
                      containerColor: cubit.selectedCategory == 'Event'
                          ? const Color(0xffe7e2f3)
                          : Colors.transparent,
                      iconColor: cubit.selectedCategory == 'Event'
                          ? const Color(0xff4a3780)
                          : Colors.black,
                      imagePath: "assets/images/Event.png",
                      onTap: () {
                        // Update the selected category when tapped
                        cubit.eventSelected;
                      },
                    ),
                    CategoryIcon(
                      containerColor: cubit.selectedCategory == 'Goal'
                          ? const Color(0xfffef5d3)
                          : Colors.transparent,
                      iconColor: cubit.selectedCategory == 'Goal'
                          ? const Color(0xff403100)
                          : Colors.black,
                      imagePath: "assets/images/Goal.png",
                      onTap: () {
                        cubit.goalSelected;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                            size: 15,
                            color: Colors.black,
                            isBold: true,
                            text: 'Time'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AddNewTask(
                      text: 'Time',
                      icon: const Icon(Icons.alarm, color: Color(0xff4a3780)),
                    )
                  ],
                ),
                const SizedBox(height: 370),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: SizedBox(
                    width: SizeConfig.screenWidth! * 0.8,
                    height: SizeConfig.screenHeight! * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TodoScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: const Color(0xFF4A3780),
                      ),
                      child: const Text(
                        "save",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
