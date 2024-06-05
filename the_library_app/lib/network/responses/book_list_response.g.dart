// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListResponse _$BookListResponseFromJson(Map<String, dynamic> json) =>
    BookListResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      (json['num_results'] as num?)?.toInt(),
      json['last_modified'] as String?,
      json['results'] == null
          ? null
          : BookResultsVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookListResponseToJson(BookListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
