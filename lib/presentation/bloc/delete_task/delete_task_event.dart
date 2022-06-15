part of 'delete_task_bloc.dart';

@immutable
abstract class DeleteTaskEvent {}

class DeleteUserTaskEvent extends DeleteTaskEvent {
  final String? id;
  DeleteUserTaskEvent({
    this.id,
  });
}
