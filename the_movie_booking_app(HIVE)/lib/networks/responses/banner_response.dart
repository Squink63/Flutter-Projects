

import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/banner_vo.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<BannerVO>? data;

  BannerResponse(this.code, this.message, this.data);

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}