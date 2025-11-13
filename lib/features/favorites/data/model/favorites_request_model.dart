import 'package:json_annotation/json_annotation.dart';

part 'favorites_request_model.g.dart';

@JsonSerializable()
class FavoritesRequestModel {
    FavoritesRequestModel({
        required this.userId,
        required this.courseId,
    });

    @JsonKey(name: 'user_id') 
    final int? userId;

    @JsonKey(name: 'course_id') 
    final int? courseId;

    factory FavoritesRequestModel.fromJson(Map<String, dynamic> json) => _$FavoritesRequestModelFromJson(json);

    Map<String, dynamic> toJson() => _$FavoritesRequestModelToJson(this);

}
