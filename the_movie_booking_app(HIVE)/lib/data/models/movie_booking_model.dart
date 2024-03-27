import 'package:the_movie_booking_app/data/vos/banner_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_vo.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';
import 'package:the_movie_booking_app/networks/data_agents/retrofit_data_agent_impl.dart';
import 'package:the_movie_booking_app/networks/data_agents/the_movie_booking_data_agent.dart';
import 'package:the_movie_booking_app/networks/responses/get_otp_response.dart';
import 'package:the_movie_booking_app/persistence/movie_dao.dart';
import 'package:the_movie_booking_app/persistence/user_dao.dart';

import '../../networks/responses/sign_in_with_phone_response.dart';
import '../../persistence/city_dao.dart';
import '../vos/booking_data_vo.dart';
import '../vos/check_out_vo.dart';
import '../vos/user_vo.dart';

class MovieBookingModel {
  static MovieBookingModel? _singleton;

  factory MovieBookingModel() {
    _singleton ??= MovieBookingModel._internal();
    return _singleton!;
  }

  MovieBookingModel._internal();

  /// Dao
  final MovieDao _movieDao = MovieDao();
  final UserDao _userDao = UserDao();
  final CityDao _cityDao = CityDao();

  /// Data Agent
  TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();

  Future<List<MovieVO>> getNowPlayingMovies() {
    return mDataAgent.getNowPlayingMovies(1.toString()).then((nowPlayingMovieList) {
      for (var movie in nowPlayingMovieList) {
        movie.type = kMovieTypeNowPlaying;
      }

      _movieDao.saveMovies(nowPlayingMovieList);

      return nowPlayingMovieList;
    });
  }

  Future<List<MovieVO>> getComingSoonMovies() {
    return mDataAgent.getComingSoonMovies(1.toString()).then((comingSoonMovieList) {
      for (var movie in comingSoonMovieList) {
        movie.type = kMovieTypeComingSoon;
      }

      _movieDao.saveMovies(comingSoonMovieList);

      return comingSoonMovieList;
    });
  }

  Future<MovieVO> getMovieDetails(String movieId) {
    return mDataAgent.getMovieDetails(movieId).then((movie) {
      _movieDao.saveSingleMovie(movie);

      return movie;
    });
  }

  Future<GetOtpResponse> getOtp(String phone) {
    return mDataAgent.getOtp(phone);
  }

  Future<SignInWithPhoneResponse> checkOtp(String phone, String otp) {
    return mDataAgent.checkOtp(phone, otp).then((response) {
      if (response.data != null) {
        _userDao.saveUserInfo(response.data);
      }
      return response;
    });
  }

  Future<List<CityVO>> getCities() {
    return mDataAgent.getCities().then((cities) {
      _cityDao.saveCities(cities);

      return cities;
    });
  }



  Future<List<BannerVO>> getBanners(){
    return mDataAgent.getBanners();
  }

  Future<List<CinemaVO>> getCinemaAndShowTimeByDate(String date, String token) {
    return mDataAgent.getCinemaAndShowTimeByDate(date, token);
  }

  Future<List<List<SeatVO>>> getSeatingPlanByShowTime(String cinemaDayTimeslotId, String bookingDate, String token) {
    return mDataAgent.getSeatingPlanByShowTime(cinemaDayTimeslotId, bookingDate, token);
  }

  Future<List<SnackCategoryVO>> getSnackCategory(String token) {
    return mDataAgent.getSnackCategory(token);
  }

  Future<List<SnackVO>> getSnacks(String categoryId, String token) {
    return mDataAgent.getSnacks(categoryId, token);
  }

  Future<CheckOutVO?> getCheckOut(String token, BookingDataVO bookingData) {
    return mDataAgent.getCheckOut(token, bookingData);
  }

  Future<List<PaymentVO>> getPayments(String token) {
    return mDataAgent.getPayments(token);
  }

  /// Get Now Playing Movies from Database
  List<MovieVO> getNowPlayingMoviesFromDatabase() {
    return _movieDao.getMoviesByType(kMovieTypeNowPlaying);
  }

  /// Get Coming Soon Movies from Database
  List<MovieVO> getComingSoonMoviesFromDatabase() {
    return _movieDao.getMoviesByType(kMovieTypeComingSoon);
  }

  /// Get Movie By Id From Database
  MovieVO? getMovieByIdFromDatabase(int movieId) {
    return _movieDao.getMovieById(movieId);
  }

  Future<List<CreditVO>> getCreditsByMovies(String movieId) {
    return mDataAgent.getCreditsByMovie(movieId);
  }

  /// Get User Info From Database
  UserVO? getUserInfoFromDatabase() {
    return _userDao.getUserInfo();
  }

  /// Get Cities From Database
  List<CityVO> getCitiesFromDatabase() {
    return _cityDao.getCities();
  }




  // Future<List<List<SeatVO>>> getSeatingPlanByShowTime(String cinemaDayTimeslotId, String bookingDate) {
  //   return mDataAgent.getSeatingPlanByShowTime(cinemaDayTimeslotId, bookingDate);
  // }
}