


import 'package:json_annotation/json_annotation.dart';
import 'package:the_library_app/data/vos/category_list_vo.dart';

part 'book_overview_result_vo.g.dart';

@JsonSerializable()
class BookOverviewResultVO {
  @JsonKey(name: "bestsellers_date")
  String? bestSellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  String? publishedDateDescription;

  @JsonKey(name: "previous_published_date")
  String? previousPublishedDate;

  @JsonKey(name: "next_published_date")
  String? newestPublishedDate;

  @JsonKey(name: "lists")
  List<CategoryListVO>? lists;


  BookOverviewResultVO(
      this.bestSellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.newestPublishedDate,
      this.lists);

  factory BookOverviewResultVO.fromJson(Map<String, dynamic> json) => _$BookOverviewResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookOverviewResultVOToJson(this);

}