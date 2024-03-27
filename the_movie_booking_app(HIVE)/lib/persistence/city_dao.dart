


import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

import '../data/vos/city_vo.dart';

class CityDao {

  static final CityDao _singleton = CityDao._internal();

  factory CityDao() {
    return _singleton;
  }

  CityDao._internal();

  void saveCities(List<CityVO> cities) async {
    Map<int, CityVO> cityMap =  { for (var city in cities) (city.id ?? 0): city };
    await getCityBox().putAll(cityMap);
  }



  List<CityVO> getCities() {
    return getCityBox().values.toList();
  }



  Box<CityVO> getCityBox() {
    return Hive.box<CityVO>(kBoxNameCityVO);
  }
}