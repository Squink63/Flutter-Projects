

import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

import '../data/vos/user_vo.dart';

class UserDao {

  static final UserDao _singleton = UserDao._internal();

  factory UserDao() {
    return _singleton;
  }

  UserDao._internal();

  void saveUserInfo(dynamic user) async {
    return getUserInfoBox().put(user.id ?? 0, user);
 }
 
 UserVO? getUserInfo() {
    return getUserInfoBox().values.isNotEmpty
    ? getUserInfoBox().getAt(0)
    : null;
 }

Box<UserVO> getUserInfoBox() {
  return Hive.box<UserVO>(kBoxNameUserVO);
}
}