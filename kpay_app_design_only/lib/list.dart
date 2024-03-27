import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.green),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  final List<Contact> _list = List.generate(100, (index) {
    return Contact(name: "Name $index", phone: "Phone $index", address: "Address $index");
  });
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: _list.length,
          itemBuilder: (BuildContext context,int index){
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(_list[index].name),
                  subtitle: Text(_list[index].phone),
                  trailing: Text(_list[index].address),
                ),
              );
          })
    );
  }
}

class Contact{

  final String name;
  final String phone;
  final String address;

  Contact({required this.name, required this.phone, required this.address});

}
