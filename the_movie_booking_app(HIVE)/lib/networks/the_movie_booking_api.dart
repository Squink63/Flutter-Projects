import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/networks/responses/get_credits_by_movie_response.dart';
import 'package:the_movie_booking_app/networks/responses/movie_list_response.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: kMovieBaseUrl)
abstract class TheMovieBookingApi {
  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(kEndPointGetNowPlaying)
  Future<MovieListResponse?> getNowPlayingMovies(
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page,
      );

  @GET(kEndpointGetUpcoming)
  Future<MovieListResponse?> getComingSoonMovies(
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page,
      );

  @GET("$kEndpointMovieDetails/{movie_id}")
  Future<MovieVO> getMovieDetails(
      @Path("movie_id") String movieId,
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      );

  @GET("$kEndpointGetCreditsByMovie/{movie_id}/credits")
  Future<GetCreditsByMovieResponse?> getCreditsByMovie(
      @Path("movie_id") String movieId,
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page,
      );

}