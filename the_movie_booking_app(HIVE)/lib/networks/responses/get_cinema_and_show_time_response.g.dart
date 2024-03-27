// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_and_show_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaAndShowTimeResponse _$GetCinemaAndShowTimeResponseFromJson(
        Map<String, dynamic> json) =>
    GetCinemaAndShowTimeResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaAndShowTimeResponseToJson(
        GetCinemaAndShowTimeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
