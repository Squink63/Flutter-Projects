

import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

import '../data/vos/movie_vo.dart';

class MovieDao {

  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal();

  void saveMovies(List<MovieVO> movies) async {
  Map<int, MovieVO> movieMap =  { for (var movie in movies) (movie.id ?? 0): movie };
  await getMovieBox().putAll(movieMap);
  }
  
  void saveSingleMovie(MovieVO movie) async {
    return getMovieBox().put(movie.id, movie);
  }

  List<MovieVO> getMoviesByType(String type) {
    return getMovieBox().values.where((movie) => movie.type == type).toList();
  }

  MovieVO? getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }


  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(kBoxNameMovieVO);
  }
}