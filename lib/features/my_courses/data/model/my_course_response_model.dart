import 'package:json_annotation/json_annotation.dart';

part 'my_course_response_model.g.dart';

@JsonSerializable(createToJson: false)
class MyCoursesResponseModel {
    MyCoursesResponseModel({
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
        required this.pivot,
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
    final Pivot? pivot;

    factory MyCoursesResponseModel.fromJson(Map<String, dynamic> json) => _$MyCoursesResponseModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Pivot {
    Pivot({
        required this.userId,
        required this.courseId,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    @JsonKey(name: 'user_id') 
    final int? userId;

    @JsonKey(name: 'course_id') 
    final int? courseId;
    final String? status;

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;

    factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

}
