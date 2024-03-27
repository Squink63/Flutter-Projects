import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: const MyApp(),
    theme: ThemeData(primarySwatch: Colors.green),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 400.0,
                color: Colors.red,
              ),

              Container(
                height: 400.0,
                color: Colors.red,
              ),

              Positioned(
                top: -100,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle
                  ),
                  height: 200.0,
                  width: 200.0,
                ),
              ),

              Positioned(
                bottom: -100,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle
                  ),
                  height: 200.0,
                  width: 200.0,
                ),
              ),


            ],
        ),
      ),
    );
  }
}
