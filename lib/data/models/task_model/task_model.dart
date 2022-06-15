import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/task_entity.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel extends TaskEntity {
  final String? date;
  final String? status;
  final String? assignedTo;
  final String? createdAt;
  final String? owner;
  final String? acknowledged;
  TaskModel({
    required String id,
    String? title,
    String? description,
    this.date,
    this.status,
    this.assignedTo,
    this.createdAt,
    this.owner,
    this.acknowledged,
  }) : super(
          description: description ?? "",
          title: title ?? "",
          id: id,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  factory TaskModel.fromJsonModel(Object? json) =>
      _$TaskModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJsonModel(TaskModel model) => _$TaskModelToJson(model);
}
