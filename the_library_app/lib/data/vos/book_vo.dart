

import 'package:json_annotation/json_annotation.dart';
import 'package:the_library_app/data/vos/isbn_vo.dart';

import 'buy_link_vo.dart';

part 'book_vo.g.dart';

@JsonSerializable()
class BookVO {

  @JsonKey(name: "rank")
  int? rank;

  @JsonKey(name: "rank_last_week")
  int? rankLastWeek;

  @JsonKey(name: "weeks_on_list")
  int? weeksOnList;

  @JsonKey(name: "asterisk")
  int? asterisk;

  @JsonKey(name: "dagger")
  int? dagger;

  @JsonKey(name: "primary_isbn10")
  String? primaryIsBn10;

  @JsonKey(name: "primary_isbn13")
  String? primaryIsBn13;

  @JsonKey(name: "publisher")
  String? publisher;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "contributor")
  String? contributor;

  @JsonKey(name: "contributor_note")
  String? contributorNote;

  @JsonKey(name: "book_image")
  String? bookImage;

  @JsonKey(name: "book_image_width")
  int? bookImageWidth;

  @JsonKey(name: "book_image_height")
  int? bookImageHeight;

  @JsonKey(name: "amazon_product_url")
  String? amazonProductUrl;

  @JsonKey(name: "age_group")
  String? ageGroup;

  @JsonKey(name: "book_review_link")
  String? bookReviewLink;

  @JsonKey(name: "first_chapter_link")
  String? firstChapterLink;

  @JsonKey(name: "sunday_review_link")
  String? sundayReviewLink;

  @JsonKey(name: "article_chapter_link")
  String? articleChapterLink;

  @JsonKey(name: "isbns")
  List<IsBnVO>? isBns;

  @JsonKey(name: "buy_links")
  List<BuyLinkVO>? buyLinks;

  @JsonKey(name: "book_uri")
  String? bookUri;

  BookVO(
      this.rank,
      this.rankLastWeek,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.primaryIsBn10,
      this.primaryIsBn13,
      this.publisher,
      this.description,
      this.price,
      this.title,
      this.author,
      this.contributor,
      this.contributorNote,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.amazonProductUrl,
      this.ageGroup,
      this.bookReviewLink,
      this.firstChapterLink,
      this.sundayReviewLink,
      this.articleChapterLink,
      this.isBns,
      this.buyLinks,
      this.bookUri);

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}

Set<BookVO> recentBookList = {};

BookVO? rb;