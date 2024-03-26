import 'package:flutter/material.dart';
import 'package:momo_finance/pages/home_page.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:momo_finance/utils/strings.dart';

class ProfilePageOption1 extends StatelessWidget {
  const ProfilePageOption1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 150, top: 110),
            child: Image.asset("$kImage/profile_image.png",
              width: 100,
              height: 100,
            ),
          ),

          Text("                      Welcome, Khine!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
      bottomSheet: FractionallySizedBox(
        heightFactor: 0.6,
        child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [

            SizedBox(height: 20,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.contacts, label: "Registered Information")
            ),

            SizedBox(height: 10,),
            Divider(),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.file_copy_sharp, label: "Loan Aggrement")
            ),

            SizedBox(height: 10,),
            Divider(),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.wallet, label: "Repayment")
            ),

            SizedBox(height: 10,),
            Divider(),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.book, label: "Reward/Points")
            ),

            SizedBox(height: 10,),
            Divider(),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.stars, label: "Marketing Projet")
            ),

            SizedBox(height: 10,),
            Divider(),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.next_week, label: "About MO MO Finance")
            ),

            SizedBox(height: 10,),
            Divider(),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Item(icon: Icons.settings, label: "Setting")
            ),

            SizedBox(height: 10,),
            Divider(),
          ],
        ),
                  ),
      ),
    );
  }
}
