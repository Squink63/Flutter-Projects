

import 'package:flutter/cupertino.dart';

import '../data/models/LibraryModel.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/category_list_vo.dart';

class BooksByCategoryBloc extends ChangeNotifier {

  /// Model
  final LibraryModel _model = LibraryModel();

  List<BookVO> booksByCategoryToShow = [];

  BooksByCategoryBloc(CategoryListVO? category) {

    _model.getBooksByCategory(category?.listNameEncoded ?? "").then((books) {
      booksByCategoryToShow = books;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}