part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Task> uncompletedTasks;
  final List<Task> completedTasks;

  TodoLoaded({required this.uncompletedTasks, required this.completedTasks});
}

class SelectCategoryState extends TodoState {}

class TaskSelectedState extends TodoState {}

class EventSelectedState extends TodoState {}

class GoalSelectedState extends TodoState {}

class AddTaskState extends TodoState {}
