

import 'package:json_annotation/json_annotation.dart';

import 'book_vo.dart';

part 'category_list_vo.g.dart';

@JsonSerializable()
class CategoryListVO {

  @JsonKey(name:'list_id')
  int? listId;

  @JsonKey(name:'list_name')
  String? listName;

  @JsonKey(name:'list_name_encoded')
  String? listNameEncoded;

  @JsonKey(name:'updated')
  String? updated;

  @JsonKey(name:'books')
  List<BookVO>? books;

  CategoryListVO(this.listId, this.listName, this.listNameEncoded, this.updated,
      this.books);

  factory CategoryListVO.fromJson(Map<String, dynamic> json) => _$CategoryListVOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListVOToJson(this);
}