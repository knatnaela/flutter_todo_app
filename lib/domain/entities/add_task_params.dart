import 'package:json_annotation/json_annotation.dart';
part 'add_task_params.g.dart';

@JsonSerializable()
class AddTaskParams {
  final String? id;
  final String title;
  final String description;
  @JsonKey(name: "date")
  final String dateTime;
  final String status;
  final String assignedTo;
  AddTaskParams({
    this.id,
    this.status = "todo",
    this.assignedTo = "622de5fed3f42ebf99d1b5de",
    required this.dateTime,
    required this.title,
    required this.description,
  });

  factory AddTaskParams.fromJson(Map<String, dynamic> json) =>
      _$AddTaskParamsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AddTaskParamsToJson(this);
}
