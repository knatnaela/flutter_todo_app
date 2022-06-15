import 'package:dio/dio.dart';
import 'package:flutter_todo_app/data/data_source/authentication_local_data_source.dart';
import 'package:flutter_todo_app/data/data_source/authentication_remote_data_source.dart';
import 'package:flutter_todo_app/data/data_source/task_remote_data_source.dart';
import 'package:flutter_todo_app/data/respository/authentication_respository_impl.dart';
import 'package:flutter_todo_app/data/respository/task_repository_impl.dart';
import 'package:flutter_todo_app/domain/respository/authentication_repository.dart';
import 'package:flutter_todo_app/domain/respository/task_repository.dart';
import 'package:flutter_todo_app/domain/usecases/addTask.dart';
import 'package:flutter_todo_app/domain/usecases/deleteTask.dart';
import 'package:flutter_todo_app/domain/usecases/getAllTasks.dart';
import 'package:flutter_todo_app/domain/usecases/login_user.dart';
import 'package:flutter_todo_app/domain/usecases/logout_user.dart';
import 'package:flutter_todo_app/domain/usecases/register_user.dart';
import 'package:flutter_todo_app/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/register/register_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/todo_list/task_list_bloc.dart';
import 'package:flutter_todo_app/service/http/http_service.dart';
import 'package:flutter_todo_app/service/http/http_service_impl.dart';
import 'package:flutter_todo_app/service/secure_storage/secure_storage_service.dart';
import 'package:flutter_todo_app/service/secure_storage/secure_storage_service_impl.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance.registerLazySingleton<SecureStorageService>(
      () => SecureStorageServiceImpl());

  final secureStorageService = getItInstance<SecureStorageService>();
  secureStorageService.init();

  getItInstance.registerLazySingleton<HttpService>(
    () => HttpServiceImpl(
      getItInstance(),
    ),
  );

  final httpService = getItInstance<HttpService>();
  httpService.init();

  getItInstance.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<GetAllTasks>(
    () => GetAllTasks(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<AddTask>(
    () => AddTask(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => TaskListBloc(
      loadingBloc: getItInstance(),
      getAllTasks: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => AddTaskBloc(
      loadingBloc: getItInstance(),
      addTask: getItInstance(),
    ),
  );
  getItInstance.registerFactory<DeleteTaskBloc>(
    () => DeleteTaskBloc(
      loadingBloc: getItInstance(),
      deleteTask: getItInstance(),
    ),
  );
  getItInstance.registerFactory<DeleteTask>(() => DeleteTask(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()),
  );
  getItInstance.registerLazySingleton<LogOutUser>(() => LogOutUser(
        getItInstance(),
      ));
  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));
  getItInstance.registerFactory(
    () => LoginBloc(
      logOutUser: getItInstance(),
      loadingBloc: getItInstance(),
      loginUser: getItInstance(),
    ),
  );
  getItInstance
      .registerLazySingleton<RegisterUser>(() => RegisterUser(getItInstance()));
  getItInstance.registerFactory(
    () => RegisterBloc(
      loadingBloc: getItInstance(),
      registerUser: getItInstance(),
    ),
  );
  getItInstance.registerSingleton<LoadingBloc>(LoadingBloc());
  getItInstance.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(
      localDataSource: getItInstance(),
      loadingBloc: getItInstance(),
    ),
  );
}
