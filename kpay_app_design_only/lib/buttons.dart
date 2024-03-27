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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              print("Text button clicking");
            },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.red,
                  elevation: 8.0
                ),
                child: const Text("Text Button")),

            ElevatedButton(onPressed: (){
              print("Elevated button clicking");
            },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ),
                child: const Text("Elevated Button")),

            OutlinedButton(onPressed: (){
              print("Outlined button clicking");
            },
                style: OutlinedButton.styleFrom(
                  primary: Colors.red
                ),
                child: const Text("Outlined Button")),

            const SizedBox(
              height: 30.0,
            ),

            TextButton(onPressed: () {},
                autofocus: true,
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith((states)  {
                    if(states.contains(MaterialState.hovered)) {
                      return Colors.yellow;
                    } else if(states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    else if(states.contains(MaterialState.pressed)) {
                      return Colors.orange;
                    }

                  })
                ),
                child: const Text("Text button")),

            ElevatedButton.icon(onPressed: (){},
                icon: const Icon(Icons.access_alarm_outlined),
              label: const Text("Alarm"),),

            TextButton.icon(onPressed: (){},
                icon: const Icon(Icons.message),
                label: const Text("Message"))
          ],
        ),
      ),
    );
  }
}
