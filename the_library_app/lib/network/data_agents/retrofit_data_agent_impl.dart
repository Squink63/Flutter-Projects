

import 'package:dio/dio.dart';
import 'package:the_library_app/data/vos/category_list_vo.dart';
import 'package:the_library_app/data/vos/book_overview_result_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/network/api_constants.dart';
import 'package:the_library_app/network/data_agents/library_data_agent.dart';
import 'package:the_library_app/network/library_api.dart';

class RetrofitDataAgentImpl extends LibraryDataAgent {

  late LibraryApi mApi;

  static RetrofitDataAgentImpl? _singleton;

  factory RetrofitDataAgentImpl() {
    _singleton ??= RetrofitDataAgentImpl._internal();
    return _singleton!;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = LibraryApi(dio);
  }

  @override
  Future<List<CategoryListVO>> getBookOverview() {
    return mApi
        .getBookOverview(kApiKey)
        .asStream()
        .map((response) => response?.results?.lists ?? [])
        .first;
  }

  @override
  Future<List<BookVO>> getBooksByCategory(String bookListName) {
    return mApi
        .getBooksByCategory(bookListName, kApiKey)
        .asStream()
        .map((response) => response?.results?.books ?? [])
        .first;
  }


}