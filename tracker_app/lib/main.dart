import 'package:api_app/data/vos/category_vo.dart';
import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:api_app/note_page.dart';
import 'package:api_app/pages/home_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open a box
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryVOAdapter());
  Hive.registerAdapter(TransactionVOAdapter());

  await Hive.openBox<CategoryVO>("kBoxNameCategoryVO");
  await Hive.openBox<TransactionVO>("kBoxNameTransactionVO");
  await Hive.openBox('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}






