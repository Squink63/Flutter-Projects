
import 'package:json_annotation/json_annotation.dart';

part 'isbn_vo.g.dart';

@JsonSerializable()
class IsBnVO {

  @JsonKey(name: "isbn10")
  String? isBn10;

  @JsonKey(name: "isbn13")
  String? isBn13;

  IsBnVO(this.isBn10, this.isBn13);

  factory IsBnVO.fromJson(Map<String, dynamic> json) => _$IsBnVOFromJson(json);

  Map<String, dynamic> toJson() => _$IsBnVOToJson(this);
}