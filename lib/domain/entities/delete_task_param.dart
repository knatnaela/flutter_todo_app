import 'package:json_annotation/json_annotation.dart';
part 'delete_task_param.g.dart';

@JsonSerializable()
class DeleteTaskParam {
  final String? id;
  DeleteTaskParam({
    this.id,
  });

  factory DeleteTaskParam.fromJson(Map<String, dynamic> json) =>
      _$DeleteTaskParamFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DeleteTaskParamToJson(this);
}
