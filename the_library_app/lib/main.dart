import 'package:flutter/material.dart';
import 'package:the_library_app/pages/book_details_page.dart';
import 'package:the_library_app/pages/books_by_category_page.dart';
import 'package:the_library_app/pages/main_page.dart';
import 'package:the_library_app/pages/splash_screen_page.dart';
import 'package:the_library_app/pages/test_page.dart';
import 'package:the_library_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
          foregroundColor: kBackgroundColor
        )
      ),

      home: MainPage(),
    );
  }
}

