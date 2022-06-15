import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_todo_app/domain/entities/add_task_params.dart';
import 'package:flutter_todo_app/domain/respository/task_repository.dart';
import 'package:flutter_todo_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/task_entity.dart';

class AddTask extends UseCase<TaskEntity, AddTaskParams> {
  final TaskRepository taskRepository;
  AddTask(this.taskRepository);

  @override
  Future<Either<AppError, TaskEntity>> call(AddTaskParams params) async {
    return await taskRepository.addTask(addTaskParams: params);
  }
}
