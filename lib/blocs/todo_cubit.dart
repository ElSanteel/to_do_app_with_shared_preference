import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/task_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  static TodoCubit get(context) => BlocProvider.of(context);
  String selectedCategory = 'Task'; // Default category
  bool isCategorySelected = false;
  String taskTitle = '';
  String? taskTime;

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

  // Function to toggle the completion status of a task
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
    task.completed = !task.completed; // Toggle the completion status
    emit(TodoLoaded(uncompletedTasks, completedTasks));
  }

  // Function to initialize the cubit with initial tasks
  void initializeTasks(
      List<Task> initialUncompleted, List<Task> initialCompleted) {
    uncompletedTasks = initialUncompleted;
    completedTasks = initialCompleted;
    emit(TodoLoaded(uncompletedTasks, completedTasks));
  }

  void selectCategory(String category) {
    selectedCategory = category;
    isCategorySelected = true;
    emit(SelectCategoryState());
  }

  void taskSelected() {
    selectedCategory = 'Task';
    isCategorySelected = true;
    emit(TaskSelectedState());
  }

  void eventSelected() {
    selectedCategory = 'Event';
    isCategorySelected = true;
    emit(EventSelectedState());
  }

  void goalSelected() {
    selectedCategory = 'Goal';
    isCategorySelected = true;
    emit(GoalSelectedState());
  }

  // Function to add a new task to the list of uncompleted tasks
  void addNewTask() {
    if (taskTitle.isNotEmpty && isCategorySelected) {
      final Task newTask = Task(
        imagePath: 'assets/images/$selectedCategory.png',
        title: taskTitle,
        subtitle: taskTime,
        completed: false,
      );

      // Access the TodoCubit and add the new task
      final todoCubit = TodoCubit.get(context);
      todoCubit.addTask(newTask);

      // Navigate back to the TodoScreen
      Navigator.pop(context);
    }
  }
}
