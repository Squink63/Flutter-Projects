import 'package:api_app/pages/account_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class MyWalletsPage extends StatelessWidget {
  const MyWalletsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "My Wallets",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        
      ),

      body: Column(
        children: [
          AccountItemView(icon: Icons.wallet, color: Colors.blue, itemName: "My Wallets")
        ],
      ),
    );
  }
}