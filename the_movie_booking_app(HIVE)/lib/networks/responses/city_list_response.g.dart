// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListResponse _$CityListResponseFromJson(Map<String, dynamic> json) =>
    CityListResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CityVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityListResponseToJson(CityListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
