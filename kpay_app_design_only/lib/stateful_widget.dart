import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

}

class StateFulWidgetScreen extends StatefulWidget {
  const StateFulWidgetScreen({super.key});

  @override
  State<StateFulWidgetScreen> createState() => _StateFulWidgetScreenState();
}

class _StateFulWidgetScreenState extends State<StateFulWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    String information = "";
    TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: name,
            ),
            TextField(
              controller: age,
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                information = "Name is ${name.text} Age is ${age.text}";
              });
            },
                child: const Text("Save")),
             Text("Information is $information",
            style: const TextStyle(
              fontSize: 30
            ),)
          ],

        ),
      ),
    );
  }
}
