import 'package:json_annotation/json_annotation.dart';

part 'courses_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CoursesResponseModel {
  final bool? status;
  final List<Course>? data;

  CoursesResponseModel({required this.status, required this.data});

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Course {
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

  @JsonKey(name: 'short_video')
  final ShortVideo? shortVideo;

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
    this.shortVideo,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ShortVideo {
  final String? url;
  final double? duration;

  ShortVideo({this.url, this.duration});

  factory ShortVideo.fromJson(Map<String, dynamic> json) =>
      _$ShortVideoFromJson(json);
}
