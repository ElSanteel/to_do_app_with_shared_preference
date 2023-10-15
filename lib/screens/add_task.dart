import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_shared_preference/components/custom_elevated_button.dart';
import 'package:todo_app_with_shared_preference/core/size_config.dart';
import 'package:todo_app_with_shared_preference/screens/todo_screen.dart';

import '../blocs/todo_cubit.dart';
import '../components/custom_text_field.dart';
import '../components/category_icon.dart';
import '../components/custom_text.dart';
import '../model/task_model.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f5f9),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 30,
                          color: Color(0xff4A3780),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
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
                  CustomTextField(
                    text: 'Task Title',
                    controller: cubit.titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field must not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CustomText(
                          size: 20,
                          color: Colors.black,
                          isBold: true,
                          text: 'Category:'),
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
                        isSelected: cubit.selectedCategory == 'Task',
                        onTap: () {
                          cubit.taskSelected();
                          cubit.imagePath = "assets/images/Task.png";
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryIcon(
                        containerColor: cubit.selectedCategory == 'Event'
                            ? const Color(0xff92cbf5)
                            : Colors.transparent,
                        iconColor: cubit.selectedCategory == 'Event'
                            ? const Color(0xff194a66)
                            : Colors.black,
                        imagePath: "assets/images/Event.png",
                        isSelected: cubit.selectedCategory == 'Event',
                        onTap: () {
                          cubit.eventSelected();
                          cubit.imagePath = "assets/images/Event.png";
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryIcon(
                        containerColor: cubit.selectedCategory == 'Goal'
                            ? const Color(0xff92cbf5)
                            : Colors.transparent,
                        iconColor: cubit.selectedCategory == 'Goal'
                            ? const Color(0xff194a66)
                            : Colors.black,
                        imagePath: "assets/images/Goal.png",
                        isSelected: cubit.selectedCategory == 'Goal',
                        onTap: () {
                          cubit.goalSelected();
                          cubit.imagePath = "assets/images/Goal.png";
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      size: 20,
                      color: Colors.black,
                      isBold: true,
                      text: 'Time'),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    text: 'Time',
                    controller: cubit.timeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field must not be empty";
                      }
                      return null;
                    },
                    //           onTap: () async {
                    //             final value = await showDatePicker(
                    //               context: context,
                    //               initialDate: DateTime.now(),
                    //               firstDate: DateTime.now(),
                    //               lastDate: DateTime(2060),
                    //               builder: (context, child) {
                    //                 return Theme(
                    //                   data: Theme.of(context).copyWith(
                    //                     colorScheme: const ColorScheme.light(
                    //                       primary: Color(0xff4a3780),
                    //                       onPrimary: Colors.blueAccent,
                    //                       onSurface: Colors.black,
                    //                     ),
                    //                   ),
                    //                   child: child!,
                    //                 );
                    //               },
                    //             );
                    // if (value != null) {
                    // cubit.dateController.text =
                    // "${value.year}-${value.month}-${value.day}";
                    // }
                    //           },
                    icon: const Icon(Icons.alarm, color: Color(0xff4a3780)),
                  ),
                  const SizedBox(height: 300),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: CustomElevatedButton(
                      buttonFunction: () {
                        if (cubit.formKey.currentState!.validate()) {
                          // Form is valid, proceed with adding the task
                          cubit.addTask(
                            task: Task(
                              imagePath: cubit.imagePath,
                              title: cubit.titleController.text,
                              completed: false,
                              subtitle: cubit.timeController.text,
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoScreen(),
                            ),
                          );
                          cubit.clearFields();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please fill out all required fields and fix any errors.'),
                            ),
                          );
                        }
                      },
                      content: 'Save',
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
