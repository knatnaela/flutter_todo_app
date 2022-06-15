import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/entities/delete_task_param.dart';
import 'package:flutter_todo_app/domain/entities/task_entity.dart';
import 'package:flutter_todo_app/domain/usecases/deleteTask.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  final DeleteTask deleteTask;
  final LoadingBloc loadingBloc;
  DeleteTaskBloc({required this.deleteTask, required this.loadingBloc})
      : super(DeleteTaskInitial()) {
    on<DeleteTaskEvent>((event, emit) async {
      if (event is DeleteUserTaskEvent) {
        loadingBloc.add(StartLoading());
        emit(DeleteTaskLoading());
        final response = await deleteTask(
          DeleteTaskParam(
            id: event.id,
          ),
        );
        emit(response.fold(
            (l) => DeleteTaskError(), (task) => DeleteTaskLoaded(task: task)));
        loadingBloc.add(FinishLoading());
      }
    });
  }
}
