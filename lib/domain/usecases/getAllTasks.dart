import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_todo_app/domain/respository/task_repository.dart';
import 'package:flutter_todo_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/no_params.dart';
import '../entities/task_entity.dart';

class GetAllTasks extends UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository taskRepository;
  GetAllTasks(this.taskRepository);

  @override
  Future<Either<AppError, List<TaskEntity>>> call(NoParams params) async {
    return await taskRepository.getTasks();
  }
}
