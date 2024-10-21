
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_vo.g.dart';

@HiveType(typeId: 1, adapterName: "TransactionVOAdapter")
class TransactionVO {

  @HiveField(0)
  String category;

  @HiveField(1)
  String note;

  @HiveField(2)
  String date;

  @HiveField(3)
  String amount;

  @HiveField(4)
  String type;

  TransactionVO({required this.category, required this.note, required this.date, required this.amount, required this.type});
}