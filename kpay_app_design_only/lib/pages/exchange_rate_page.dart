

import 'dart:ffi';

import 'package:flutter/material.dart';

class ExchangeRatePage extends StatelessWidget {
  const ExchangeRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 0, 95, 1.0),
        centerTitle: true,
        title: Text("Exchange Rate",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.6],
                colors: [
                  Color.fromRGBO(4, 0, 95, 1.0),
                  Color.fromRGBO(85, 0, 127, 1.0)
                ]
            )
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
              child: Row(
                children: [
                  Image.asset("assets/images/a_bank_logo.png",
                    width: 50,
                    height: 50,
                  ),

                  Text("A bank",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30
                    ),
                  )
                ],
              ),
            ),

            Container(
              color: Color.fromRGBO(36, 3, 98, 1.0),
              child: Row(
                children: [

                  SizedBox(
                    width: 30,
                  ),
                  Text("Last Update on\n15-Jan-2024",
                    style: TextStyle(
                      color: Colors.yellow
                    ),
                  ),

                  Spacer(),

                  Text("We Buy",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 16
                    ),
                  ),

                  SizedBox(
                    width: 40,
                  ),

                  Text("We Sell",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 16
                    ),
                  ),

                  SizedBox(
                    width: 42,
                  )
                ],
              ),
            ),

            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  Item(index: index,),

                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
              itemCount: 6,
            )
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final int index;
  const Item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Image.asset(
            "assets/images/us_flag.png",
            width: 80,
            height: 50,
          ),

          Text("USD",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),

          Spacer(),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white
              ),
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text("2103.0",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
          ),

          SizedBox(
            width: 40,
          ),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white
                ),
                borderRadius: BorderRadius.circular(4)
            ),
            child: Text("2106.0",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
          ),
        ],
      ),
    );
  }
}

