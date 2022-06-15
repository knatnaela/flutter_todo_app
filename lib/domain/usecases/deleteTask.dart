import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_todo_app/domain/entities/delete_task_param.dart';
import 'package:flutter_todo_app/domain/respository/task_repository.dart';
import 'package:flutter_todo_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/task_entity.dart';

class DeleteTask extends UseCase<TaskEntity, DeleteTaskParam> {
  final TaskRepository taskRepository;
  DeleteTask(this.taskRepository);

  @override
  Future<Either<AppError, TaskEntity>> call(DeleteTaskParam params) async {
    return await taskRepository.deleteTask(deleteTaskParam: params);
  }
}
