

import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';

part 'booking_data_vo.g.dart';

@JsonSerializable()
class BookingDataVO {

  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "seat_number")
  String? seatNumber;

  @JsonKey(name: "booking_date")
  String? bookingDate;

  @JsonKey(name: "movie_id")
  int? movieId;

  @JsonKey(name: "payment_type_id")
  int? paymentTypeId;

  @JsonKey(name: "snacks")
  List<SnackVO>? snacks;

  BookingDataVO({
    this.cinemaDayTimeslotId,
    this.seatNumber,
    this.bookingDate,
    this.movieId,
    this.paymentTypeId,
    this.snacks,
  });

  factory BookingDataVO.fromJson(Map<String, dynamic> json) => _$BookingDataVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDataVOToJson(this);
}