import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Text at the bottom of the page'),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.photo),
                        title: Text('Gallery'),
                        onTap: () {
                          // Handle gallery action
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text('Camera'),
                        onTap: () {
                          // Handle camera action
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Show Bottom Sheet'),
          ),
        ],
      ),
    );
  }
}