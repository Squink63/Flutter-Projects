import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
      body: Container(
        color: Colors.red,
        height: 600.0,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 20.0,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Hello1")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello2")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello3")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello4")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello5")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello6")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello7")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello8")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello9")),
            ElevatedButton(onPressed: () {}, child: const Text("Hell010")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello")),
            ElevatedButton(onPressed: () {}, child: const Text("Hello")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello")),
          ],
        ),
      ),
    );
  }
}
