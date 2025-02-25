

import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';

part 'sign_in_with_phone_response.g.dart';

@JsonSerializable()
class SignInWithPhoneResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  UserVO? data;

  @JsonKey(name: "token")
  String? token;

  SignInWithPhoneResponse(this.code, this.message, this.data, this.token);

  factory SignInWithPhoneResponse.fromJson(Map<String, dynamic> json) => _$SignInWithPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInWithPhoneResponseToJson(this);
}