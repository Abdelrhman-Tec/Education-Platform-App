import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  final String message;
  final String token;
  final User user;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
