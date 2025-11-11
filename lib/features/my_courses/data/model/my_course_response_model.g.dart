// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCoursesResponseModel _$MyCoursesResponseModelFromJson(
  Map<String, dynamic> json,
) => MyCoursesResponseModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  division: json['division'] as String?,
  createdBy: (json['created_by'] as num?)?.toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  instructorId: (json['instructor_id'] as num?)?.toInt(),
  status: json['status'] as String?,
  students: (json['students'] as num?)?.toInt(),
  likes: (json['likes'] as num?)?.toInt(),
  shortVideoUrl: json['short_video_url'] as String?,
  shortVideoDuration: json['short_video_duration'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  pivot: json['pivot'] == null
      ? null
      : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
);

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
  userId: (json['user_id'] as num?)?.toInt(),
  courseId: (json['course_id'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);
