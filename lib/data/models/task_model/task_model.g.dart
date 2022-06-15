// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      assignedTo: json['assignedTo'] as String?,
      createdAt: json['createdAt'] as String?,
      owner: json['owner'] as String?,
      acknowledged: json['acknowledged'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'status': instance.status,
      'assignedTo': instance.assignedTo,
      'createdAt': instance.createdAt,
      'owner': instance.owner,
      'acknowledged': instance.acknowledged,
    };
