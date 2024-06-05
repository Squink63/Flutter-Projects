// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_overview_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookOverviewResultVO _$BookOverviewResultVOFromJson(
        Map<String, dynamic> json) =>
    BookOverviewResultVO(
      json['bestsellers_date'] as String?,
      json['published_date'] as String?,
      json['published_date_description'] as String?,
      json['previous_published_date'] as String?,
      json['next_published_date'] as String?,
      (json['lists'] as List<dynamic>?)
          ?.map((e) => CategoryListVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookOverviewResultVOToJson(
        BookOverviewResultVO instance) =>
    <String, dynamic>{
      'bestsellers_date': instance.bestSellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'previous_published_date': instance.previousPublishedDate,
      'next_published_date': instance.newestPublishedDate,
      'lists': instance.lists,
    };
