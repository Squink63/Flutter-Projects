

import 'package:the_library_app/data/vos/category_list_vo.dart';
import 'package:the_library_app/data/vos/book_overview_result_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';

abstract class LibraryDataAgent {

  Future<List<CategoryListVO>> getBookOverview();

  Future<List<BookVO>> getBooksByCategory(String categoryListName);
}