import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/entities/add_task_params.dart';

import 'package:flutter_todo_app/domain/entities/task_entity.dart';
import 'package:flutter_todo_app/domain/usecases/addTask.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final AddTask addTask;
  final LoadingBloc loadingBloc;
  AddTaskBloc({required this.addTask, required this.loadingBloc})
      : super(AddTaskInitial()) {
    on<AddTaskEvent>((event, emit) async {
      if (event is AddUserTaskEvent) {
        loadingBloc.add(StartLoading());
        emit(AddTaskLoading());
        final response = await addTask(
          AddTaskParams(
            title: event.title,
            description: event.description,
            dateTime: DateTime.now().toString(),
            id: event.id,
          ),
        );
        emit(response.fold(
            (l) => AddTaskError(), (task) => AddTaskLoaded(task: task)));
        loadingBloc.add(FinishLoading());
      }
    });
  }
}
