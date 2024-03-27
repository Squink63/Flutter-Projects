

import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';

part 'get_cinema_and_show_time_response.g.dart';

@JsonSerializable()
class GetCinemaAndShowTimeResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaVO>? data;

  GetCinemaAndShowTimeResponse(this.code, this.message, this.data);

  factory GetCinemaAndShowTimeResponse.fromJson(Map<String, dynamic> json) => _$GetCinemaAndShowTimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCinemaAndShowTimeResponseToJson(this);
}