import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final String token;
  final User? user;

  const LoginResponseModel({
    required this.message,
    required this.token,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final String? email;
  final String? role;

  @JsonKey(name: 'profile_image')
  final dynamic profileImage;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
