// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesResponseModel _$CoursesResponseModelFromJson(
  Map<String, dynamic> json,
) => CoursesResponseModel(
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
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  instructor: json['instructor'] == null
      ? null
      : Instructor.fromJson(json['instructor'] as Map<String, dynamic>),
);

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  color: json['color'] as String?,
  backgroundColor: json['background_color'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Instructor _$InstructorFromJson(Map<String, dynamic> json) => Instructor(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);
