import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CartResponseModel {
  CartResponseModel({required this.status, required this.data});

  final bool? status;
  final List<Cart>? data;

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Cart {
  Cart(
    this.status,
    this.message, {
    required this.id,
    required this.userId,
    required this.courseId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.course,
  });
  final bool? status;
  final String? message;

  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'course_id')
  final int? courseId;
  final int? quantity;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Course? course;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@JsonSerializable(createToJson: false)
class Course {
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.division,
    required this.createdBy,
    required this.categoryId,
    required this.instructorId,
    required this.status,
    required this.students,
    required this.likes,
    required this.shortVideoUrl,
    required this.shortVideoDuration,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String? price;
  final String? division;

  @JsonKey(name: 'created_by')
  final int? createdBy;

  @JsonKey(name: 'category_id')
  final int? categoryId;

  @JsonKey(name: 'instructor_id')
  final int? instructorId;
  final String? status;
  final int? students;
  final int? likes;

  @JsonKey(name: 'short_video_url')
  final String? shortVideoUrl;

  @JsonKey(name: 'short_video_duration')
  final String? shortVideoDuration;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@JsonSerializable(createToJson: false)
class CartResponseBody {
  CartResponseBody({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory CartResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CartResponseBodyFromJson(json);
}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.userId,
    required this.courseId,
    required this.quantity,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'course_id')
  final int? courseId;
  final int? quantity;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
