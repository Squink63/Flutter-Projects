

import 'package:api_app/pages/account_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        
      ),

      body: Column(
        children: [
          SizedBox(height: 10,),
          
          InkWell(
            onTap: (){
              // navigateToNext(context, pageTo)
            },
            child: AccountItemView(icon: Icons.language, color: Colors.blue, itemName: "Language")
            ),

          SizedBox(height: 10,),

          InkWell(
            onTap: (){
              // navigateToNext(context, CategoriesPage());
            },
            child: AccountItemView(icon: Icons.format_paint_rounded, color: const Color.fromARGB(255, 120, 199, 122), itemName: "Themes")
            ),

          AccountItemView(icon: Icons.reviews, color: Colors.purple, itemName: "Write review"),

          AccountItemView(icon: Icons.share, color: Colors.cyan, itemName: "Share this app"),

          AccountItemView(icon: Icons.bar_chart_sharp, color: Colors.grey, itemName: "Privacy Policy"),

        ],
      ),
    );
  }
}