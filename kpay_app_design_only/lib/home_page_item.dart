import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/main.dart';

class HomePageItem extends StatelessWidget {
  final String homePageItemLabel;
  final String homePageItemIcon;
  const HomePageItem({super.key, required this.homePageItemLabel, required this.homePageItemIcon});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: kPrimaryKPayColor,
            shape: BoxShape.circle
          ),
          child: Image.asset(homePageItemIcon,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(
          height: 8,
        ),

        Text(homePageItemLabel,
          style: TextStyle(
            color: Colors.black
          ),
        )
      ],
    );
  }
}
