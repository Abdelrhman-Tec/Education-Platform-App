import 'package:json_annotation/json_annotation.dart';

part 'enrollments_response_model.g.dart';

@JsonSerializable(createToJson: false)
class EnrollmentsResponseModel {
  EnrollmentsResponseModel({
    required this.userId,
    required this.courseId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'course_id')
  final int? courseId;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;

  factory EnrollmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentsResponseModelFromJson(json);
}
