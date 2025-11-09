// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesResponseModel _$CoursesResponseModelFromJson(
  Map<String, dynamic> json,
) => CoursesResponseModel(
  status: json['status'] as bool?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  division: json['division'] as String?,
  createdBy: (json['created_by'] as num?)?.toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);
