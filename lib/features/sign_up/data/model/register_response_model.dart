import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable(createToJson: false)
class RegisterResponseModel {
  RegisterResponseModel({required this.message, required this.user});

  final String? message;
  final User? user;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
