

import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/timeslot_vo.dart';

part 'cinema_vo.g.dart';

@JsonSerializable()
class CinemaVO {

  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "cinema")
  String? cinema;

  @JsonKey(name: "timeslots")
  List<TimeSlotVO>? timeslots;

  CinemaVO(this.cinemaId, this.cinema, this.timeslots);

  factory CinemaVO.fromJson(Map<String, dynamic> json) => _$CinemaVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaVOToJson(this);
}