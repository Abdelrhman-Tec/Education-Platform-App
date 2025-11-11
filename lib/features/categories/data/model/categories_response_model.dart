import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesResponseModel {
  CategoriesResponseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
    required this.backgroundColor,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? color;

  @JsonKey(name: 'background_color')
  final String? backgroundColor;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
