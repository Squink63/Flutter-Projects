import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("My Application"),
        leading: const FlutterLogo(),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Setting"),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                ));
              },
              icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
        ],
        toolbarHeight: 150.0,
        elevation: 30.0,
        shadowColor: Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(30.0))),
      ),
      body: Container(
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
        height: 600.0,
        // transform: Matrix4.identity()..rotateZ(0.3),
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.green, width: 6.0),
            gradient: const LinearGradient(
                colors: [Colors.red, Colors.green, Colors.yellow, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30.0)),
        child: Center(
            child: Column(
          children: [
            Text(
              "Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World",
              maxLines: 3,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  letterSpacing: 5,
                  wordSpacing: 6,
                  decoration: TextDecoration.combine([
                    TextDecoration.underline,
                    TextDecoration.overline,
                  ]),
                  decorationColor: Colors.green,
                  decorationThickness: 5,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Yorkie"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellow,
                child: Image.asset("assets/images/news.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Anatomy_of_a_Sunset-2.jpg/800px-Anatomy_of_a_Sunset-2.jpg",
                loadingBuilder: (_, widget, progress) {
                  if (progress == null) return widget;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Click");
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
