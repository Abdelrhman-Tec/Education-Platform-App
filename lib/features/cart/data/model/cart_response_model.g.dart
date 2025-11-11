// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  json['status'] as bool?,
  json['message'] as String?,
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  courseId: (json['course_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  course: json['course'] == null
      ? null
      : Course.fromJson(json['course'] as Map<String, dynamic>),
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
);

CartResponseBody _$CartResponseBodyFromJson(Map<String, dynamic> json) =>
    CartResponseBody(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  userId: (json['user_id'] as num?)?.toInt(),
  courseId: (json['course_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: (json['id'] as num?)?.toInt(),
);

RemoveCartResponse _$RemoveCartResponseFromJson(Map<String, dynamic> json) =>
    RemoveCartResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$RemoveCartResponseToJson(RemoveCartResponse instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};
