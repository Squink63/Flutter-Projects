import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "About",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        
      ),
    );
  }
}