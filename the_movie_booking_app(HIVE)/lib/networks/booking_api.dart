

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_booking_app/data/vos/booking_data_vo.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/networks/responses/banner_response.dart';
import 'package:the_movie_booking_app/networks/responses/check_out_response.dart';
import 'package:the_movie_booking_app/networks/responses/city_list_response.dart';
import 'package:the_movie_booking_app/networks/responses/get_cinema_and_show_time_response.dart';
import 'package:the_movie_booking_app/networks/responses/get_payment_response.dart';
import 'package:the_movie_booking_app/networks/responses/get_seating_plan_by_show_time_response.dart';
import 'package:the_movie_booking_app/networks/responses/get_snacks_response.dart';
import 'package:the_movie_booking_app/networks/responses/sign_in_with_phone_response.dart';
import 'package:the_movie_booking_app/networks/responses/snack_category_response.dart';

import 'responses/get_otp_response.dart';

part 'booking_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class BookingApi {
  factory BookingApi(Dio dio) = _BookingApi;

  @FormUrlEncoded()
  @POST(kEndPointGetOtp)
  Future<GetOtpResponse> getOtp(
      @Field(kParamPhone) String phone
      );

  @FormUrlEncoded()
  @POST(kEndPointCheckOtp)
  Future<SignInWithPhoneResponse> checkOtp(
      @Field(kParamPhone) String phone,
      @Field(kParamOtp) String otp,
      );

  @GET(kEndPointGetCities)
  Future<CityListResponse?> getCities();


  @GET(kEndPointGetBanners)
  Future<BannerResponse?> getBanners();

  @GET(kEndPointGetCinemaAndShowTimeByDate)
  Future<GetCinemaAndShowTimeResponse?> getCinemaAndShowTimeByDate(
      @Query(kParamDate) String date,
      @Header(kHeaderAuthorization) String token,
      );

  @GET(kEndPointGetSnackCategory)
  Future<SnackCategoryResponse?> getSnackCategory(
      @Header(kHeaderAuthorization) String token,
      );

  @GET(kEndPointGetSnacks)
  Future<GetSnackResponse?> getSnacks(
      @Query(kParamCategoryId) String categoryId,
      @Header(kHeaderAuthorization) String token,
      );

  @GET(kEndPointGetPayment)
  Future<GetPaymentResponse?> getPayments(
      @Header(kHeaderAuthorization) String token,
      );

  @GET(kEndPointGetSeatingPlanByShowTime)
  Future<GetSeatingPlanByShowTimeResponse?> getSeatingPlanByShowTime(
      @Query(kParamCinemaDayTimeslotId) String cinemaDayTimeslotId,
      @Query(kParamBookingDate) String bookingDate,
      @Header(kHeaderAuthorization) String token,
      );

  @POST(kEndPointCheckOut)
  Future<CheckOutResponse?> getCheckOut(
      @Header(kHeaderAuthorization) String token,
      @Body() BookingDataVO bookingData
      );


}