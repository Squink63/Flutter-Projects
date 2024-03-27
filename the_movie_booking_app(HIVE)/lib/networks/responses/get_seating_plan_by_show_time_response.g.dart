// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_seating_plan_by_show_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSeatingPlanByShowTimeResponse<T>
    _$GetSeatingPlanByShowTimeResponseFromJson<T>(Map<String, dynamic> json) =>
        GetSeatingPlanByShowTimeResponse<T>(
          json['code'] as int?,
          json['message'] as String?,
          (json['data'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => SeatVO.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList(),
        );

Map<String, dynamic> _$GetSeatingPlanByShowTimeResponseToJson<T>(
        GetSeatingPlanByShowTimeResponse<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
