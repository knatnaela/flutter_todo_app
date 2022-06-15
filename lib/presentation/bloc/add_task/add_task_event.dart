part of 'add_task_bloc.dart';

@immutable
abstract class AddTaskEvent {}

class AddUserTaskEvent extends AddTaskEvent {
  final String title;
  final String description;
  final String? id;
  AddUserTaskEvent({
    required this.title,
    required this.description,
    this.id,
  });
}
