import 'package:json_annotation/json_annotation.dart';

part 'enrollments_request_model.g.dart';

@JsonSerializable()
class EnrollmentsRequestModel {
  EnrollmentsRequestModel({
    required this.userId,
    required this.courseIds,
  });

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'course_ids')
  final List<int> courseIds;

  factory EnrollmentsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollmentsRequestModelToJson(this);
}
