

import 'package:the_library_app/data/vos/category_list_vo.dart';
import 'package:the_library_app/data/vos/book_overview_result_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/network/data_agents/library_data_agent.dart';
import 'package:the_library_app/network/data_agents/retrofit_data_agent_impl.dart';

class LibraryModel {

  static LibraryModel? _singleton;

  factory LibraryModel() {
    _singleton ??= LibraryModel._internal();
    return _singleton!;
  }

  LibraryModel._internal();

  /// Data Agent
  LibraryDataAgent mDataAgent = RetrofitDataAgentImpl();

  Future<List<CategoryListVO>> getBookOverview() {
    return mDataAgent.getBookOverview();
  }

  Future<List<BookVO>> getBooksByCategory(String categoryListName) {
    return mDataAgent.getBooksByCategory(categoryListName);
  }
}