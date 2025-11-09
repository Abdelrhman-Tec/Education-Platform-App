import 'package:json_annotation/json_annotation.dart';
part 'courses_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CoursesResponseModel {
  CoursesResponseModel({required this.status, required this.data});

  final bool? status;
  final List<Course>? data;

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesResponseModelFromJson(json);
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
    required this.status,
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
  final String? status;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
