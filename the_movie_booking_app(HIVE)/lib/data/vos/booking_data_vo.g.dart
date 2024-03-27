// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDataVO _$BookingDataVOFromJson(Map<String, dynamic> json) =>
    BookingDataVO(
      cinemaDayTimeslotId: json['cinema_day_timeslot_id'] as int?,
      seatNumber: json['seat_number'] as String?,
      bookingDate: json['booking_date'] as String?,
      movieId: json['movie_id'] as int?,
      paymentTypeId: json['payment_type_id'] as int?,
      snacks: (json['snacks'] as List<dynamic>?)
          ?.map((e) => SnackVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingDataVOToJson(BookingDataVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'seat_number': instance.seatNumber,
      'booking_date': instance.bookingDate,
      'movie_id': instance.movieId,
      'payment_type_id': instance.paymentTypeId,
      'snacks': instance.snacks,
    };
