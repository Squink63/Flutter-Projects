import 'package:flutter/material.dart';

import 'main.dart';

class CashInPage extends StatelessWidget {
  const CashInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("Cash In",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ItemView(icon: '${kImage}agent.jpeg', itemLabel: 'Agent/Merchant',),
              SizedBox(height: 20,),
              ItemView(icon: '${kImage}agent.jpeg', itemLabel: 'Agent/Merchant',),
              SizedBox(height: 20,),
              ItemView(icon: '${kImage}agent.jpeg', itemLabel: 'Agent/Merchant',),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
class ItemView extends StatelessWidget {
  final String icon;
  final String itemLabel;
  const ItemView({super.key, required this.icon, required this.itemLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(icon,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12,),
          Text(itemLabel,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
          Spacer(),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}

