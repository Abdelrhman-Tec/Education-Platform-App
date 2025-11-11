// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRequestModel _$CartRequestModelFromJson(Map<String, dynamic> json) =>
    CartRequestModel(
      userId: (json['user_id'] as num).toInt(),
      courseId: (json['course_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartRequestModelToJson(CartRequestModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'quantity': instance.quantity,
    };
