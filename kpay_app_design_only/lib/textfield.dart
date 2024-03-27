
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Name",
                suffixIcon: Icon(Icons.person),
              ),
              controller: name,
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Password",
                suffixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "Phone",
                suffixIcon: Icon(Icons.phone),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              controller: address,
              minLines: 5,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(

                ),
                labelText: "Address",
                hintText: "Address",
                suffixIcon: Icon(Icons.location_city),
                helperText: "Please Enter"
              ),
            ),

            ElevatedButton(onPressed: (){
              setState(() {

              });
            },
                child: Text("Save")),
            Text("Name is ${name.text} Password is ${password.text} Phone is ${phone.text} Address is ${address.text}")
          ],
        ),
      ),
    );
  }
}
