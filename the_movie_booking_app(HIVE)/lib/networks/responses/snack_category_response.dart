

import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/snack_category_vo.dart';

part 'snack_category_response.g.dart';

@JsonSerializable()
class SnackCategoryResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SnackCategoryVO>? data;

  SnackCategoryResponse(this.code, this.message, this.data);

  factory SnackCategoryResponse.fromJson(Map<String, dynamic> json) => _$SnackCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SnackCategoryResponseToJson(this);
}