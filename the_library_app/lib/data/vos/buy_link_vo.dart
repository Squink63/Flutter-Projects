
import 'package:json_annotation/json_annotation.dart';

part 'buy_link_vo.g.dart';

@JsonSerializable()
class BuyLinkVO {

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "url")
  String? url;

  BuyLinkVO(this.name, this.url);

  factory BuyLinkVO.fromJson(Map<String, dynamic> json) => _$BuyLinkVOFromJson(json);

  Map<String, dynamic> toJson() => _$BuyLinkVOToJson(this);
}