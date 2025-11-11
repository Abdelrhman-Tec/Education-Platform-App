// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollmentsResponseModel _$EnrollmentsResponseModelFromJson(
  Map<String, dynamic> json,
) => EnrollmentsResponseModel(
  userId: (json['user_id'] as num?)?.toInt(),
  courseId: (json['course_id'] as num?)?.toInt(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: (json['id'] as num?)?.toInt(),
);
