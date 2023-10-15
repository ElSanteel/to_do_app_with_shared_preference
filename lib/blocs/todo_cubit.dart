import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../model/task_model.dart';
import '../service/shared_prefrence_helper.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  static TodoCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String? selectedCategory;
  bool isCategorySelected = false;
  String imagePath = '';
  var formKey = GlobalKey<FormState>();
  List<Task> uncompletedTasks = [
    Task(
      imagePath: "assets/images/Task.png",
      title: "Study lesson",
      completed: false,
    ),
    Task(
      imagePath: "assets/images/Goal.png",
      title: "Run 5k",
      subtitle: "4:00pm",
      completed: false,
    ),
    Task(
      imagePath: "assets/images/Event.png",
      title: "Go to party",
      subtitle: "10:00pm",
      completed: false,
    ),
  ];

  List<Task> completedTasks = [
    Task(
      imagePath: "assets/images/Event.png",
      title: "Game meetup",
      subtitle: "1:00pm",
      completed: true,
    ),
    Task(
      imagePath: "assets/images/Task.png",
      title: "Take out trash",
      completed: true,
    ),
  ];

  void toggleTaskCompletion(Task task) {
    if (task.completed) {
      // Move the task from completed to uncompleted
      completedTasks.remove(task);
      uncompletedTasks.add(task);
    } else {
      // Move the task from uncompleted to completed
      uncompletedTasks.remove(task);
      completedTasks.add(task);
    }
    task.completed = !task.completed;
    emit(TodoLoaded(
        uncompletedTasks: uncompletedTasks, completedTasks: completedTasks));
  }

  void taskSelected() {
    selectedCategory = 'Task';
    isCategorySelected = true;
    imagePath = "assets/images/Task.png";
    emit(TaskSelectedState());
  }

  void eventSelected() {
    selectedCategory = 'Event';
    isCategorySelected = true;
    imagePath = "assets/images/Event.png";
    emit(EventSelectedState());
  }

  void goalSelected() {
    selectedCategory = 'Goal';
    isCategorySelected = true;
    imagePath = "assets/images/Goal.png";
    emit(GoalSelectedState());
  }

  void addTask({required Task task}) {
    uncompletedTasks.add(task);

    SharedPreferenceHelper.saveData(
        key: 'uncompletedTasks', value: uncompletedTasks);
    SharedPreferenceHelper.saveData(
        key: 'completedTasks', value: completedTasks);

    emit(AddTaskState());
  }

  void clearFields() {
    titleController.text = '';
    timeController.text = '';
    emit(ClearFieldsState());
  }
}
