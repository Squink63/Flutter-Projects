

import 'package:json_annotation/json_annotation.dart';
import 'package:the_library_app/data/vos/book_results_vo.dart';

part 'book_list_response.g.dart';

@JsonSerializable()
class BookListResponse {

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyright;

  @JsonKey(name: "num_results")
  int? numResults;

  @JsonKey(name: "last_modified")
  String? lastModified;

  @JsonKey(name: "results")
  BookResultsVO? results;

  BookListResponse(this.status, this.copyright, this.numResults,
      this.lastModified, this.results);

  factory BookListResponse.fromJson(Map<String, dynamic> json) => _$BookListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookListResponseToJson(this);
}