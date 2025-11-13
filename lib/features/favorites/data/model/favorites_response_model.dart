import 'package:json_annotation/json_annotation.dart';

part 'favorites_response_model.g.dart';

@JsonSerializable()
class FavoritesResponseModel {
  FavoritesResponseModel({required this.status, required this.data});

  final bool? status;
  final List<Datum>? data;

  factory FavoritesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  Datum({
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
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class FavoritesRemoveResponseModel {
  FavoritesRemoveResponseModel({required this.status, required this.message});

  final bool? status;
  final String? message;

  factory FavoritesRemoveResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesRemoveResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesRemoveResponseModelToJson(this);
}
