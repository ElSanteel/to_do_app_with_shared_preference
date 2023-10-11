import 'package:flutter/material.dart';
import '../blocs/todo_cubit.dart';
import '../components/build_list_tile.dart';
import '../core/size_config.dart';
import '../model/task_model.dart';

class BuildTaskListView extends StatelessWidget {
  final List<Task> tasks;
  final TodoCubit cubit;

  const BuildTaskListView(
      {super.key, required this.tasks, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.9,
      height: SizeConfig.screenHeight! * 0.3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: SizeConfig.screenWidth! * 0.9,
          height: SizeConfig.screenHeight! * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
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
      ),
    );
  }
}
