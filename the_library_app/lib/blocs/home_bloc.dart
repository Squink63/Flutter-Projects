

import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../data/models/LibraryModel.dart';
import '../data/vos/category_list_vo.dart';

class HomeBloc extends ChangeNotifier {

  /// Model
  final LibraryModel _model = LibraryModel();

  List<CategoryListVO> categoryListsToShow = [];

  HomeBloc() {

    _model.getBookOverview().then((lists) {
      categoryListsToShow = lists;
      notifyListeners();
    });


  }
}