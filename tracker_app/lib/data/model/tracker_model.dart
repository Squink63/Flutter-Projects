

import 'package:api_app/data/vos/category_vo.dart';
import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:api_app/pages/new_category_page.dart';
import 'package:api_app/persistence/category_dao.dart';
import 'package:api_app/persistence/transaction_dao.dart';

class TrackerModel {
  static TrackerModel? _singleton;

  factory TrackerModel() {
    _singleton??= TrackerModel._internal();
    return _singleton!;
  }

  TrackerModel._internal();

  final CategoryDao _categoryDao = CategoryDao();
  final TransactionDao _transactionDao = TransactionDao();


  void saveCategoryToDatabase(CategoryVO category) {
    return _categoryDao.saveCategory(category);
  }

  void deleteCategory(int index) {
    return _categoryDao.deleteCategory(index);
  }

  List<CategoryVO> getCategoriesFromDatabase() {
    return _categoryDao.getCategories();
  }
  
  void saveTransactionToDatabase(TransactionVO transaction) {
    return _transactionDao.saveTransaction(transaction);
  }

  void deleteTransaction(int index) {
    return _transactionDao.deleteTransaction(index);
  }

  List<TransactionVO> getTransactionsFromDatabase() {
    return _transactionDao.getTransactions();
  }


}