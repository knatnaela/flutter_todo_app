part of 'add_task_bloc.dart';

@immutable
abstract class AddTaskState {}

class AddTaskLoaded extends AddTaskState {
  final TaskEntity task;
  AddTaskLoaded({
    required this.task,
  });
}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskError extends AddTaskState {}
