import 'package:api_app/pages/about_page.dart';
import 'package:api_app/pages/categories_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:api_app/pages/my_wallets_page.dart';
import 'package:api_app/pages/settings_page.dart';
import 'package:api_app/pages/support_page.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Column(
          children: [
            Icon(
              Icons.person_2_rounded,
              size: 80,
              ),
            Text(
              "Deckard",
              style: TextStyle(
                color: Colors.white,

              ),
            )
          ],
        ),
        centerTitle: true,
        toolbarHeight: 150,

      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          
          InkWell(
            onTap: (){
              navigateToNext(context, MyWalletsPage());
            },
            child: AccountItemView(icon: Icons.wallet, color: Colors.blue, itemName: "My Wallets")
            ),

          SizedBox(height: 10,),

          InkWell(
            onTap: (){
              navigateToNext(context, CategoriesPage());
            },
            child: AccountItemView(icon: Icons.menu, color: const Color.fromARGB(255, 120, 199, 122), itemName: "Categories")
            ),

          InkWell(
            onTap: () =>navigateToNext(context, SettingsPage()),
            child: AccountItemView(icon: Icons.wallet, color: Colors.purple, itemName: "Settings")),

          InkWell(
            onTap: () => navigateToNext(context, SupportPage()),
            child: AccountItemView(icon: Icons.currency_bitcoin, color: Colors.cyan, itemName: "Support")),

          InkWell(
            onTap: () => navigateToNext(context, AboutPage()),
            child: AccountItemView(icon: Icons.info, color: Colors.grey, itemName: "My About")),

        ],
      ),
    );
  }
}

class AccountItemView extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String itemName;
  const AccountItemView({super.key, required this.icon, required this.color, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            // padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color
            ),
            child: Icon(
              icon
            ),
            
          ),
      
          SizedBox(
            width: 16,
          ),
      
          Text(
            itemName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
          ),
      
          Spacer(),
      
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}

void navigateToNext(BuildContext context, Widget pageTo) {
    Navigator.of(context).push( MaterialPageRoute(
      builder: (context) {
        return pageTo;
      }
      ));
}