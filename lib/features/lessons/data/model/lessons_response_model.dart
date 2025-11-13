import 'package:json_annotation/json_annotation.dart';

part 'lessons_response_model.g.dart';

@JsonSerializable()
class LessonsResponseModel {
  final bool status;
  final List<Lesson> lessons;

  LessonsResponseModel({required this.status, required this.lessons});

  factory LessonsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LessonsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LessonsResponseModelToJson(this);
}

@JsonSerializable()
class Lesson {
  final int id;
  @JsonKey(name: 'course_id')
  final int courseId;
  final String title;
  @JsonKey(name: 'video_url')
  final String videoUrl;
  final int duration;
  @JsonKey(name: 'is_dummy')
  final int isDummy;
  @JsonKey(name: 'order_index')
  final int orderIndex;

  Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.videoUrl,
    required this.duration,
    required this.isDummy,
    required this.orderIndex,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
