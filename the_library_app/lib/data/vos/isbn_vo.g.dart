// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isbn_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsBnVO _$IsBnVOFromJson(Map<String, dynamic> json) => IsBnVO(
      json['isbn10'] as String?,
      json['isbn13'] as String?,
    );

Map<String, dynamic> _$IsBnVOToJson(IsBnVO instance) => <String, dynamic>{
      'isbn10': instance.isBn10,
      'isbn13': instance.isBn13,
    };
