import 'package:dartz/dartz.dart';
import 'package:flutter_todo_app/data/data_source/task_remote_data_source.dart';
import 'package:flutter_todo_app/data/models/task_model/task_model.dart';
import 'package:flutter_todo_app/domain/entities/delete_task_param.dart';
import 'package:flutter_todo_app/domain/entities/task_entity.dart';
import 'package:flutter_todo_app/domain/entities/app_error.dart';
import 'package:flutter_todo_app/domain/respository/task_repository.dart';

import '../../domain/entities/add_task_params.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  TaskRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError, List<TaskModel>>> getTasks() async {
    try {
      final tasks = await remoteDataSource.getAllTaskList();
      if (tasks.data != null) {
        return Right(tasks.data!);
      }
      return Left(AppError(message: "empty"));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, TaskEntity>> addTask({
    required AddTaskParams addTaskParams,
  }) async {
    try {
      final tasks = await remoteDataSource.addTask(
        addTaskParams: addTaskParams,
      );
      if (tasks.data != null) {
        return Right(tasks.data!);
      }
      return Left(AppError(message: "empty"));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, TaskEntity>> deleteTask(
      {required DeleteTaskParam deleteTaskParam}) async {
    try {
      final tasks = await remoteDataSource.deleteTask(
        deleteTaskParam: deleteTaskParam,
      );
      if (tasks.data != null) {
        return Right(tasks.data!);
      }
      return Left(AppError(message: "empty"));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}
