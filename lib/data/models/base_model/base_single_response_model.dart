import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'base_single_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseSingleResponseModel<T> extends BaseModel {
  final T? data;

  BaseSingleResponseModel({
    this.data,
    String? error,
  }) : super(
          error: error,
        );

  factory BaseSingleResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseSingleResponseModelFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseSingleResponseModelToJson<T>(this, toJsonT);
}
