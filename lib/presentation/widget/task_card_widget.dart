import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/todo_list/task_list_bloc.dart';
import 'package:flutter_todo_app/presentation/views/add_task_screen.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.id,
  }) : super(key: key);
  final String title;
  final String description;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 8,
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: const Icon(Icons.edit),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen(
                      title: title,
                      description: description,
                      id: id,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<DeleteTaskBloc>(context)
                      .add(DeleteUserTaskEvent(id: id));
                  BlocProvider.of<TaskListBloc>(context)
                      .add(TaskItemRemovedEvent(id: id));
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
