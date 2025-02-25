import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'production_country_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdProductionCountryVO, adapterName: kAdapterNameProductionCountryVO)
class ProductionCountryVO {
  @JsonKey(name: "iso_3166-1")
  @HiveField(0)
  String? iso31661;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  ProductionCountryVO({this.iso31661, this.name});

  factory ProductionCountryVO.fromJson(Map<String, dynamic> json) => _$ProductionCountryVOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryVOToJson(this);
}