// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVO _$BookVOFromJson(Map<String, dynamic> json) => BookVO(
      (json['rank'] as num?)?.toInt(),
      (json['rank_last_week'] as num?)?.toInt(),
      (json['weeks_on_list'] as num?)?.toInt(),
      (json['asterisk'] as num?)?.toInt(),
      (json['dagger'] as num?)?.toInt(),
      json['primary_isbn10'] as String?,
      json['primary_isbn13'] as String?,
      json['publisher'] as String?,
      json['description'] as String?,
      json['price'] as String?,
      json['title'] as String?,
      json['author'] as String?,
      json['contributor'] as String?,
      json['contributor_note'] as String?,
      json['book_image'] as String?,
      (json['book_image_width'] as num?)?.toInt(),
      (json['book_image_height'] as num?)?.toInt(),
      json['amazon_product_url'] as String?,
      json['age_group'] as String?,
      json['book_review_link'] as String?,
      json['first_chapter_link'] as String?,
      json['sunday_review_link'] as String?,
      json['article_chapter_link'] as String?,
      (json['isbns'] as List<dynamic>?)
          ?.map((e) => IsBnVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['buy_links'] as List<dynamic>?)
          ?.map((e) => BuyLinkVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['book_uri'] as String?,
    );

Map<String, dynamic> _$BookVOToJson(BookVO instance) => <String, dynamic>{
      'rank': instance.rank,
      'rank_last_week': instance.rankLastWeek,
      'weeks_on_list': instance.weeksOnList,
      'asterisk': instance.asterisk,
      'dagger': instance.dagger,
      'primary_isbn10': instance.primaryIsBn10,
      'primary_isbn13': instance.primaryIsBn13,
      'publisher': instance.publisher,
      'description': instance.description,
      'price': instance.price,
      'title': instance.title,
      'author': instance.author,
      'contributor': instance.contributor,
      'contributor_note': instance.contributorNote,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookImageWidth,
      'book_image_height': instance.bookImageHeight,
      'amazon_product_url': instance.amazonProductUrl,
      'age_group': instance.ageGroup,
      'book_review_link': instance.bookReviewLink,
      'first_chapter_link': instance.firstChapterLink,
      'sunday_review_link': instance.sundayReviewLink,
      'article_chapter_link': instance.articleChapterLink,
      'isbns': instance.isBns,
      'buy_links': instance.buyLinks,
      'book_uri': instance.bookUri,
    };
