// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListVO _$CategoryListVOFromJson(Map<String, dynamic> json) =>
    CategoryListVO(
      (json['list_id'] as num?)?.toInt(),
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['updated'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryListVOToJson(CategoryListVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'updated': instance.updated,
      'books': instance.books,
    };
