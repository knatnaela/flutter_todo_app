import 'package:dartz/dartz.dart';
import 'package:flutter_todo_app/domain/entities/add_task_params.dart';
import 'package:flutter_todo_app/domain/entities/delete_task_param.dart';

import '../entities/app_error.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<AppError, List<TaskEntity>>> getTasks();

  Future<Either<AppError, TaskEntity>> addTask({
    required AddTaskParams addTaskParams,
  });
  Future<Either<AppError, TaskEntity>> deleteTask({
    required DeleteTaskParam deleteTaskParam,
  });
}
