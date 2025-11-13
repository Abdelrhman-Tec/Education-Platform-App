import 'package:json_annotation/json_annotation.dart';

part 'unenroll_response_model.g.dart';

@JsonSerializable()
class UnenrollResponseModel {
  UnenrollResponseModel({required this.message});

  final String? message;

  factory UnenrollResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UnenrollResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnenrollResponseModelToJson(this);
}
