part of 'task_list_bloc.dart';

@immutable
abstract class TaskListState {}

class TaskListInitial extends TaskListState {}

class TaskListError extends TaskListState {}

class TaskListItemRemove extends TaskListState {}

class TaskListLoaded extends TaskListState {
  final List<TaskEntity> taskList;

  TaskListLoaded({
    required this.taskList,
  });
}
