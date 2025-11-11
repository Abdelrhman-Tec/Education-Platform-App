// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollments_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollmentsRequestModel _$EnrollmentsRequestModelFromJson(
  Map<String, dynamic> json,
) => EnrollmentsRequestModel(
  userId: (json['user_id'] as num).toInt(),
  courseIds: (json['course_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$EnrollmentsRequestModelToJson(
  EnrollmentsRequestModel instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'course_ids': instance.courseIds,
};
