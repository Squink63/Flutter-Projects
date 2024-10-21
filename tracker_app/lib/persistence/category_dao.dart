

import 'package:api_app/data/vos/category_vo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryDao {
  static final CategoryDao _singleton = CategoryDao._internal();

  factory CategoryDao() {
    return _singleton;
  }

  CategoryDao._internal();

  void saveCategory(CategoryVO category) async {
    return getCategoryBox().put(category.categoryName, category);
  }

  List<CategoryVO> getCategories() {
    return getCategoryBox().values.toList();
  }

  void deleteCategory(int index) async {
    return getCategoryBox().deleteAt(index);
  }


  Box<CategoryVO> getCategoryBox() {
    return Hive.box<CategoryVO>("kBoxNameCategoryVO");
  }
}