// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonsResponseModel _$LessonsResponseModelFromJson(
  Map<String, dynamic> json,
) => LessonsResponseModel(
  status: json['status'] as bool,
  lessons: (json['lessons'] as List<dynamic>)
      .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LessonsResponseModelToJson(
  LessonsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'lessons': instance.lessons};

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
  id: (json['id'] as num).toInt(),
  courseId: (json['course_id'] as num).toInt(),
  title: json['title'] as String,
  videoUrl: json['video_url'] as String,
  duration: (json['duration'] as num).toInt(),
  isDummy: (json['is_dummy'] as num).toInt(),
  orderIndex: (json['order_index'] as num).toInt(),
);

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'course_id': instance.courseId,
  'title': instance.title,
  'video_url': instance.videoUrl,
  'duration': instance.duration,
  'is_dummy': instance.isDummy,
  'order_index': instance.orderIndex,
};
