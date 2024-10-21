

import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionDao {
  static final TransactionDao _singleton = TransactionDao._internal();

  factory TransactionDao() {
    return _singleton;
  }

  TransactionDao._internal();

  void saveTransaction(TransactionVO transaction) async {
    String uniqueKey = 'myKey_${DateTime.now().millisecondsSinceEpoch}';
    return getTransactionBox().put(uniqueKey, transaction);
  }

  List<TransactionVO> getTransactions() {
    return getTransactionBox().values.toList();
  }

  void deleteTransaction(int index) async {
    return getTransactionBox().deleteAt(index);
  }


  Box<TransactionVO> getTransactionBox() {
    return Hive.box<TransactionVO>("kBoxNameTransactionVO");
  }
}