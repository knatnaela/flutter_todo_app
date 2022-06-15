import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'base_list_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseListResponseModel<T> extends BaseModel {
  final List<T>? data;

  BaseListResponseModel({
    this.data,
    String? error,
  }) : super(
          error: error,
        );

  factory BaseListResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseListResponseModelFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseListResponseModelToJson<T>(this, toJsonT);
}
