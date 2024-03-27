

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_movie_booking_app/data/vos/banner_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/error_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_vo.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/networks/booking_api.dart';
import 'package:the_movie_booking_app/networks/data_agents/the_movie_booking_data_agent.dart';
import 'package:the_movie_booking_app/networks/responses/city_list_response.dart';
import 'package:the_movie_booking_app/networks/responses/get_otp_response.dart';
import 'package:the_movie_booking_app/networks/responses/sign_in_with_phone_response.dart';
import 'package:the_movie_booking_app/networks/the_movie_booking_api.dart';

import '../../data/vos/booking_data_vo.dart';
import '../../data/vos/check_out_vo.dart';
import '../../data/vos/seat_vo.dart';
import '../../exception/custom_exception.dart';

class RetrofitDataAgentImpl extends TheMovieBookingDataAgent {

  late TheMovieBookingApi mApi;

  late BookingApi mBookingApi;

  static RetrofitDataAgentImpl? _singleton;

  factory RetrofitDataAgentImpl() {
    _singleton ??= RetrofitDataAgentImpl._internal();
    return _singleton!;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieBookingApi(dio);
    mBookingApi = BookingApi(dio);
  }

  @override
  Future<List<MovieVO>> getComingSoonMovies(String page) {
    return mApi
        .getComingSoonMovies(kApiKey, kLanguageENUS, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(String page) {
    return mApi
        .getNowPlayingMovies(kApiKey, kLanguageENUS, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<MovieVO> getMovieDetails(String movieId) {
    return mApi
        .getMovieDetails(movieId, kApiKey, kLanguageENUS)
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    return mApi.getCreditsByMovie(movieId, kApiKey, kLanguageENUS, 1.toString())
        .asStream()
        .map((response) => response?.cast ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<GetOtpResponse> getOtp(String phone) {
    return mBookingApi
        .getOtp(phone)
        .asStream()
        .map((response) => response)
        .first;

  }

  @override
  Future<SignInWithPhoneResponse> checkOtp(String phone, String otp) {
    return mBookingApi
        .checkOtp(phone, otp)
        .asStream()
        .map((response) {
          response.data?.token = response.token ?? "";
          response.data?.phone = phone;
          return response;
    })
        .first;
  }

  @override
  Future<List<CityVO>> getCities() {
    return mBookingApi
        .getCities()
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  @override
  Future<List<BannerVO>> getBanners(){
    return mBookingApi
        .getBanners()
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  @override
  Future<List<CinemaVO>> getCinemaAndShowTimeByDate(String date, String token) {
    return mBookingApi
        .getCinemaAndShowTimeByDate(date, token)
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  @override
  Future<List<SnackCategoryVO>> getSnackCategory(String token) {
    return mBookingApi
        .getSnackCategory(token)
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  @override
  Future<List<SnackVO>> getSnacks(String categoryId, String token) {
    return mBookingApi
        .getSnacks(categoryId, token)
        .asStream()
        .map((event) => event?.data ?? [])
        .first;

  }

  @override
  Future<CheckOutVO?> getCheckOut(String token, BookingDataVO bookingData) {
    return mBookingApi
        .getCheckOut(token, bookingData)
        .asStream()
        .map((response) => response?.data)
        .first;

  }

  @override
  Future<List<PaymentVO>> getPayments(String token) {
    return mBookingApi
        .getPayments(token)
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  @override
  Future<List<List<SeatVO>>> getSeatingPlanByShowTime(String cinemaDayTimeslotId, String bookingDate, String token) {
    return mBookingApi
        .getSeatingPlanByShowTime(cinemaDayTimeslotId, bookingDate, token)
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  CustomException _createException(dynamic error) {
    ErrorVO errorVO;
    if (error is DioException) {
      errorVO = _parseDioError(error);
    } else {
      errorVO = ErrorVO(statusCode: 0, statusMessage: "Unexpected error", success: false);
    }
    return CustomException(errorVO);
  }

  ErrorVO _parseDioError(DioException error) {
    try{
      if (error.response != null && error.response?.data != null) {
        var data = error.response?.data;

        /// Json String to Map<String, dynamic>
        if (data is String) {
          data = jsonDecode(data);
        }

        /// Map<String, dynamic> to ErrorVO
        return ErrorVO.fromJson(data);
      } else {
        return ErrorVO(statusCode: 0, statusMessage: "No response data", success: false);
      }
    } catch (e) {
      // Return a default ErrorVO in case of parsing errors
      return ErrorVO(statusCode: 0, statusMessage: "Invalid DioException Format: $e", success: false);
    }
  }









}