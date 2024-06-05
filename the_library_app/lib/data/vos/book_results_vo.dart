

import 'package:json_annotation/json_annotation.dart';

import 'book_vo.dart';
part 'book_results_vo.g.dart';

@JsonSerializable()
class BookResultsVO {

  @JsonKey(name: "list_name")
  String? listName;

  @JsonKey(name: "list_name_encoded")
  String? listNameEncoded;

  @JsonKey(name: "bestsellers_date")
  String? bestSellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  String? publishedDateDescription;

  @JsonKey(name: "next_published_date")
  String? nextPublishedDate;

  @JsonKey(name: "previous_published_date")
  String? previousPublishedDate;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "normal_list_ends_at")
  int? normalListEndsAt;

  @JsonKey(name: "updated")
  String? updated;

  @JsonKey(name: "books")
  List<BookVO>? books;

  @JsonKey(name: "corrections")
  List<String>? corrections;

  BookResultsVO(
      this.listName,
      this.listNameEncoded,
      this.bestSellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.nextPublishedDate,
      this.previousPublishedDate,
      this.displayName,
      this.normalListEndsAt,
      this.updated,
      this.books,
      this.corrections
      );

  factory BookResultsVO.fromJson(Map<String, dynamic> json) => _$BookResultsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookResultsVOToJson(this);
}