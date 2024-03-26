import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        toolbarHeight: 100,
        title: Text("Contact",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
