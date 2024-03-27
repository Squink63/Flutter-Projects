import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EMITab extends StatelessWidget {
  const EMITab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

          SizedBox(
            height: 16,
          ),

          Text("Interest Rate",
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
                hintText: "0-100%",
                hintStyle: TextStyle(
                    color: Colors.black12
                )
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Text("Period",
            style: TextStyle(
              color: Colors.white,
            ),
          ),


          SizedBox(
            height: 8,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 170,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Year",
                      hintStyle: TextStyle(
                          color: Colors.black12
                      )
                  ),
                ),
              ),

              SizedBox(
                width: 170,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Month",
                      hintStyle: TextStyle(
                          color: Colors.black12
                      )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
