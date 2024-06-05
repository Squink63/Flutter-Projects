// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_results_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResultsVO _$BookResultsVOFromJson(Map<String, dynamic> json) =>
    BookResultsVO(
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['bestsellers_date'] as String?,
      json['published_date'] as String?,
      json['published_date_description'] as String?,
      json['next_published_date'] as String?,
      json['previous_published_date'] as String?,
      json['display_name'] as String?,
      (json['normal_list_ends_at'] as num?)?.toInt(),
      json['updated'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['corrections'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookResultsVOToJson(BookResultsVO instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'bestsellers_date': instance.bestSellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'next_published_date': instance.nextPublishedDate,
      'previous_published_date': instance.previousPublishedDate,
      'display_name': instance.displayName,
      'normal_list_ends_at': instance.normalListEndsAt,
      'updated': instance.updated,
      'books': instance.books,
      'corrections': instance.corrections,
    };
