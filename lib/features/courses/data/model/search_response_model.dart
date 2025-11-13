import 'package:json_annotation/json_annotation.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
    SearchResponseModel({
        required this.status,
        required this.data,
    });

    final bool? status;
    final List<Datum>? data;

    factory SearchResponseModel.fromJson(Map<String, dynamic> json) => _$SearchResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);

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
        required this.category,
        required this.instructor,
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
    final DateTime? createdAt;

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    final Category? category;
    final Instructor? instructor;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);

}

@JsonSerializable()
class Category {
    Category({
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

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);

}

@JsonSerializable()
class Instructor {
    Instructor({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;

    @JsonKey(name: 'first_name') 
    final String? firstName;

    @JsonKey(name: 'last_name') 
    final String? lastName;
    final String? email;
    final String? role;

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;

    factory Instructor.fromJson(Map<String, dynamic> json) => _$InstructorFromJson(json);

    Map<String, dynamic> toJson() => _$InstructorToJson(this);

}
