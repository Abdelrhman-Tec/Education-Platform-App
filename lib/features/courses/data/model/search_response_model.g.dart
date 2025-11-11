// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseModelToJson(
  SearchResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
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

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'price': instance.price,
  'division': instance.division,
  'created_by': instance.createdBy,
  'category_id': instance.categoryId,
  'instructor_id': instance.instructorId,
  'status': instance.status,
  'students': instance.students,
  'likes': instance.likes,
  'short_video_url': instance.shortVideoUrl,
  'short_video_duration': instance.shortVideoDuration,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'category': instance.category,
  'instructor': instance.instructor,
};

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

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'color': instance.color,
  'background_color': instance.backgroundColor,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

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

Map<String, dynamic> _$InstructorToJson(Instructor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
