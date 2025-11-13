// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesRequestModel _$FavoritesRequestModelFromJson(
  Map<String, dynamic> json,
) => FavoritesRequestModel(
  userId: (json['user_id'] as num?)?.toInt(),
  courseId: (json['course_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$FavoritesRequestModelToJson(
  FavoritesRequestModel instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'course_id': instance.courseId,
};
