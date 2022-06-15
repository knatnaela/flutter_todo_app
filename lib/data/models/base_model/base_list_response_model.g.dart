// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListResponseModel<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
  BaseListResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data?.map(toJsonT).toList(),
    };
