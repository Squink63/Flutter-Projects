import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_finance/pages/apply_loan_page.dart';
import 'package:momo_finance/pages/loan_calculator_page.dart';
import 'package:momo_finance/pages/main_page.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:momo_finance/utils/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageOption2 extends StatefulWidget {
  const HomePageOption2({super.key});

  @override
  State<HomePageOption2> createState() => _HomePageOption2State();
}

class _HomePageOption2State extends State<HomePageOption2> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.white
          //color set to purple or set your own color
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              /// app bar
              child: Row(
                children: [
                  Spacer(),
                  Image.asset("assets/images/logo_big.png",
                    scale: 5,
                  ),

                  Spacer(),
                  Icon(Icons.notifications_outlined,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.play_circle_rounded, color: Colors.white,),

                        SizedBox(height: 8,),

                        Text("Apply Loan",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.currency_bitcoin, color: Colors.white,),

                        SizedBox(height: 8,),

                        Text("Loan\nCalculator",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.book, color: Colors.white,),

                        SizedBox(height: 8,),

                        Text("Rewards/\nPoints",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 36,vertical: 16),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Icon(Icons.question_answer, color: Colors.white,),

                  SizedBox(height: 8,),

                  Text("FAQ",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



