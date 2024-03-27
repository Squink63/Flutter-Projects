import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/collection_vo.dart';
import 'package:the_movie_booking_app/data/vos/genre_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/data/vos/production_company_vo.dart';
import 'package:the_movie_booking_app/data/vos/production_country_vo.dart';
import 'package:the_movie_booking_app/data/vos/spoken_language_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/networks/data_agents/dio_data_agent_impl.dart';
import 'package:the_movie_booking_app/networks/data_agents/http_data_agent_impl.dart';
import 'package:the_movie_booking_app/networks/data_agents/the_movie_booking_data_agent.dart';
import 'package:the_movie_booking_app/pages/choose_seat_page.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';
import 'package:the_movie_booking_app/pages/cinema_details_page.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/pages/payment_page.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';

import 'package:the_movie_booking_app/pages/splash_screen_page.dart';
import 'package:the_movie_booking_app/pages/test.dart';
import 'package:the_movie_booking_app/pages/ticket_check_out_page.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/fonts.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());
  Hive.registerAdapter(UserVOAdapter());
  Hive.registerAdapter(CityVOAdapter());

  await Hive.openBox<MovieVO>(kBoxNameMovieVO);
  await Hive.openBox<UserVO>(kBoxNameUserVO);
  await Hive.openBox<CityVO>(kBoxNameCityVO);

  runApp(const MovieBookingApp());
}

class MovieBookingApp extends StatelessWidget {
  const MovieBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: kPrimaryColor
        ),
        fontFamily: kInter

      ),
      home:  SplashScreenPage(),
    );
  }
}


