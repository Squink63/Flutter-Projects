import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/city_vo.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  List<CityVO> citiesToShow = [];

  @override
  void initState() {
    super.initState();

    /// Cities From Database
    List<CityVO> citiesFromDatabase = _model.getCitiesFromDatabase();
    setState(() {
      citiesToShow = citiesFromDatabase;
    });

    /// Cities From Network
    _model.getCities().then((cities) {
      setState(() {
        citiesToShow = cities;
      });
    }).catchError((error) {
      print(error);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kMarginMedium2),
            child: Column(
              children: [
                const Text(
                  "Pick Region",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: kTextRegular2x,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: kPrimaryColor,
                          offset: Offset(2.0,2.0)
                        )
                      ]),
                ),

                const SizedBox(
                  height: kMarginXLarge,
                ),

                /// Location Search Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: kMargin50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [kNowPlayingAndComingSoonGradientEndColor, kNowPlayingAndComingSoonGradientStartColor],
                              stops: [0.3, 0.8]
                            ),
                            borderRadius: BorderRadius.circular(kMarginMedium)
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search your location",
                              hintStyle: TextStyle(
                                color: kBottomNavigationUnSelectedColor,
                              ),
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: kPrimaryColor
                            ),
                          ),
                        ),
                      ),

                      /// Spacer
                      const SizedBox(
                        width: kMargin22,
                      ),

                      /// Location Button
                      Container(
                        width: kMargin50,
                        height: kMargin50,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(kMarginMedium)
                        ),
                        child: const Icon(Icons.near_me),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: kMarginXLarge,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    kBuildingsIcon,
                    width: kMargin90,
                    height: kMargin50,
                  ),
                ),


                Container(
                  width: double.infinity,
                  height: kMargin40,
                  padding: const EdgeInsets.symmetric(horizontal: kMargin22 ,vertical: kMarginMedium),
                  color: kNowPlayingAndComingSoonGradientEndColor,
                  child: const Text(
                    "Cities",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2x,
                    ),
                  ),
                ),

                /// City Lists
                SizedBox(
                  height: 300,
                  child: ListView(
                    children: List.generate(
                        citiesToShow.length,
                        (index) => GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainPage(index: index,)), (route) => false);
                          },
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: kMargin60,
                                padding: const EdgeInsets.all(19),
                                child: Text(citiesToShow[index].name ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular2x,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),

                              const Divider(
                                color: kBottomNavigationUnSelectedColor,
                              )
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
