import 'package:json_annotation/json_annotation.dart';

part 'cart_request_model.g.dart';

@JsonSerializable()
class CartRequestModel {
  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'course_id')
  final int courseId;

  final int quantity;

  CartRequestModel({
    required this.userId,
    required this.courseId,
    required this.quantity,
  });

  factory CartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CartRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartRequestModelToJson(this);
}
