// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoryResponse _$SnackCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    SnackCategoryResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SnackCategoryVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SnackCategoryResponseToJson(
        SnackCategoryResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
