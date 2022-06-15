import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_todo_app/data/models/base_model/base_single_response_model.dart';
import 'package:flutter_todo_app/domain/entities/add_task_params.dart';
import 'package:flutter_todo_app/domain/entities/delete_task_param.dart';

import '../../service/apis.dart';
import '../../service/http/http_service.dart';
import '../models/base_model/base_list_response_model.dart';
import '../models/task_model/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<BaseListResponseModel<TaskModel>> getAllTaskList();
  Future<BaseSingleResponseModel<TaskModel>> addTask(
      {required AddTaskParams addTaskParams});
  Future<BaseSingleResponseModel<TaskModel>> deleteTask(
      {required DeleteTaskParam deleteTaskParam});
}

class TaskRemoteDataSourceImpl extends TaskRemoteDataSource {
  HttpService httpService;
  TaskRemoteDataSourceImpl(this.httpService);
  @override
  Future<BaseListResponseModel<TaskModel>> getAllTaskList() async {
    final response = await httpService.getRequest(urlPath: Apis.getAllTasks);

    return BaseListResponseModel.fromJson(
      response.data,
      TaskModel.fromJsonModel,
    );
  }

  @override
  Future<BaseSingleResponseModel<TaskModel>> addTask(
      {required AddTaskParams addTaskParams}) async {
    try {
      late Future<Response> request;
      if (addTaskParams.id != null) {
        request = httpService.putRequest(
          urlPath: "${Apis.createTask}${addTaskParams.id}",
          data: addTaskParams.toJson(),
        );
      } else {
        request = httpService.postRequest(
          urlPath: Apis.createTask,
          data: addTaskParams.toJson(),
        );
      }
      var response = await request;
      return BaseSingleResponseModel.fromJson(
        response.data,
        TaskModel.fromJsonModel,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseSingleResponseModel<TaskModel>> deleteTask(
      {required DeleteTaskParam deleteTaskParam}) async {
    final response = await httpService.deleteRequest(
        urlPath: "${Apis.getAllTasks}${deleteTaskParam.id}", data: {});

    return BaseSingleResponseModel.fromJson(
      response.data,
      TaskModel.fromJsonModel,
    );
  }
}
