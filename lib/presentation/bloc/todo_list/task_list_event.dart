part of 'task_list_bloc.dart';

@immutable
abstract class TaskListEvent {}

class TaskListLoadEvent extends TaskListEvent {
  TaskListLoadEvent();
}

class TaskItemRemovedEvent extends TaskListEvent {
  final String id;
  TaskItemRemovedEvent({
    required this.id,
  });
}
