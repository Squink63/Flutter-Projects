

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';
import 'package:the_library_app/network/api_constants.dart';
import 'package:the_library_app/network/responses/book_overview_response.dart';
import 'package:the_library_app/network/responses/book_list_response.dart';

part 'library_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class LibraryApi {
  factory LibraryApi(Dio dio) = _LibraryApi;

  @GET(kBookOverviewEndpoint)
  Future<BookOverviewResponse?> getBookOverview(
      @Query(kParamApiKey) String apiKey
      );

  @GET("/lists/{list_name}")
  Future<BookListResponse?> getBooksByCategory(
      @Path("list_name") String categoryListName,
      @Query(kParamApiKey) String apiKey
      );
}