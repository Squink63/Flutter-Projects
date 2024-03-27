

import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/check_out_vo.dart';

part 'check_out_response.g.dart';

@JsonSerializable()
class CheckOutResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  CheckOutVO? data;

  CheckOutResponse(this.code, this.message, this.data);

  factory CheckOutResponse.fromJson(Map<String, dynamic> json) => _$CheckOutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutResponseToJson(this);
}