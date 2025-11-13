// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesResponseModel _$FavoritesResponseModelFromJson(
  Map<String, dynamic> json,
) => FavoritesResponseModel(
  status: json['status'] as bool?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FavoritesResponseModelToJson(
  FavoritesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
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
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

FavoritesRemoveResponseModel _$FavoritesRemoveResponseModelFromJson(
  Map<String, dynamic> json,
) => FavoritesRemoveResponseModel(
  status: json['status'] as bool?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$FavoritesRemoveResponseModelToJson(
  FavoritesRemoveResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
