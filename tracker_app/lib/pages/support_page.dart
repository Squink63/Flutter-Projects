
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = double.infinity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "Support",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        
      ),

      body: Column(
        
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            height: 400,
            child: Image.network(
              "https://static.vecteezy.com/system/resources/previews/013/722/213/non_2x/sample-qr-code-icon-png.png",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}