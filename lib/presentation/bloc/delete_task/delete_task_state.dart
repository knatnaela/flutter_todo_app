part of 'delete_task_bloc.dart';

@immutable
abstract class DeleteTaskState {}

class DeleteTaskLoaded extends DeleteTaskState {
  final TaskEntity task;
  DeleteTaskLoaded({
    required this.task,
  });
}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskError extends DeleteTaskState {}
