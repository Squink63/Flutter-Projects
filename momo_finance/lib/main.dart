import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_finance/pages/splash_screen_page.dart';
import 'package:momo_finance/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: kPrimaryColor
          //color set to purple or set your own color
        )
    );

    return MaterialApp(
      title: 'Mo Mo Finance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



