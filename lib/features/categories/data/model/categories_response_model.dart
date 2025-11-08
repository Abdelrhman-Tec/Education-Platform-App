import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesResponseModel {
    CategoriesResponseModel({
        required this.status,
        required this.data,
    });

    final bool? status;
    final List<Datum>? data;

    factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$CategoriesResponseModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.image,
        required this.color,
        required this.backgroundColor,
    });

    final int? id;
    final String? name;
    final String? image;
    final String? color;

    @JsonKey(name: 'background_color') 
    final String? backgroundColor;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

}
