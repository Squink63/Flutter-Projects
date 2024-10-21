

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'category_vo.g.dart';

@HiveType(typeId: 0, adapterName: "CategoryVOAdapter")
class CategoryVO {

  @HiveField(0)
  String categoryName;

  @HiveField(1)
  String categoryType;

  CategoryVO({required this.categoryName, required this.categoryType});
}