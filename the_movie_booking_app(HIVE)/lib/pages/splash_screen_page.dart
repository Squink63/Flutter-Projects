
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/choose_seat_page.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';
import 'package:the_movie_booking_app/pages/location_page.dart';
import 'package:the_movie_booking_app/pages/login_page.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
        (){
        _model.getUserInfoFromDatabase() == null
         ?Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false)
        : Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainPage(index: 1,)), (route) => false);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(kAppLogo,
              width: 124,
                height: 150,
              ),

              const SizedBox(
                height: kMarginMedium2,
              ),

              RichText(
                textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "C ",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kTextRegular3x,
                          fontWeight: FontWeight.w700
                        ),
                      ),

                      TextSpan(
                        text: "cinema",
                        style: TextStyle(
                          color: kBottomNavigationUnSelectedColor,
                          fontSize: kTextRegular2x
                        )
                      ),

                    ]
              ))
            ],
          ),
        ),
      ),
    );
  }
}
