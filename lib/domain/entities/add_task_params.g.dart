// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskParams _$AddTaskParamsFromJson(Map<String, dynamic> json) =>
    AddTaskParams(
      id: json['id'] as String?,
      status: json['status'] as String? ?? "todo",
      assignedTo: json['assignedTo'] as String? ?? "622de5fed3f42ebf99d1b5de",
      dateTime: json['date'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AddTaskParamsToJson(AddTaskParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.dateTime,
      'status': instance.status,
      'assignedTo': instance.assignedTo,
    };
