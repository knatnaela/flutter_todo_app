import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/domain/usecases/getAllTasks.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/no_params.dart';
import '../../../domain/entities/task_entity.dart';

part 'task_list_event.dart';
part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final GetAllTasks getAllTasks;
  final List<TaskEntity> taskList = [];
  final LoadingBloc loadingBloc;
  TaskListBloc({required this.getAllTasks, required this.loadingBloc})
      : super(TaskListInitial()) {
    on<TaskListEvent>((event, emit) async {
      if (event is TaskListLoadEvent) {
        loadingBloc.add(StartLoading());
        final tasks = await getAllTasks(NoParams());
        emit(
          tasks.fold(
            (l) => TaskListError(),
            (r) {
              taskList.addAll(r);
              return TaskListLoaded(taskList: taskList);
            },
          ),
        );
        loadingBloc.add(FinishLoading());
      } else if (event is TaskItemRemovedEvent) {
        taskList.removeWhere(
          (task) => task.id == event.id,
        );
        emit(TaskListLoaded(taskList: taskList));
      }
    });
  }
}
