

import 'package:the_movie_booking_app/data/vos/banner_vo.dart';
import 'package:the_movie_booking_app/data/vos/booking_data_vo.dart';
import 'package:the_movie_booking_app/data/vos/check_out_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_vo.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';
import 'package:the_movie_booking_app/networks/responses/check_out_response.dart';
import 'package:the_movie_booking_app/networks/responses/get_otp_response.dart';

import '../../data/vos/seat_vo.dart';
import '../responses/city_list_response.dart';
import '../responses/sign_in_with_phone_response.dart';

abstract class TheMovieBookingDataAgent{
  Future<List<MovieVO>> getNowPlayingMovies(String page);
  Future<List<MovieVO>> getComingSoonMovies(String page);
  Future<MovieVO> getMovieDetails(String movieId);
  Future<List<CreditVO>> getCreditsByMovie(String movieId);

  Future<GetOtpResponse> getOtp(String phone);
  Future<SignInWithPhoneResponse> checkOtp(String phone, String otp);
  Future<List<CityVO>> getCities();
  Future<List<BannerVO>> getBanners();
  Future<List<CinemaVO>> getCinemaAndShowTimeByDate(String date, String token);
  Future<List<List<SeatVO>>> getSeatingPlanByShowTime(String cinemaDayTimeslotId, String bookingDate, String token);
  Future<List<SnackCategoryVO>> getSnackCategory(String token);
  Future<List<SnackVO>> getSnacks(String categoryId, String token);
  Future<CheckOutVO?> getCheckOut(String token, BookingDataVO bookingData);
  Future<List<PaymentVO>> getPayments(String token);

}