import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeTab extends StatelessWidget {
  const ExchangeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("From Currency",
            style: TextStyle(
              color: Colors.white,
            ),
          ),


          SizedBox(
            height: 8,
          ),

          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              suffixIcon: Icon(Icons.currency_bitcoin)
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Text("To Currency",
            style: TextStyle(
              color: Colors.white,
            ),
          ),


          SizedBox(
            height: 8,
          ),

          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: "MMK",
                hintStyle: TextStyle(
                    color: Colors.black
                )
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Text("Amount",
            style: TextStyle(
              color: Colors.white,
            ),
          ),


          SizedBox(
            height: 8,
          ),

          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

