import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_finance/pages/on_boarding_page.dart';
import 'package:momo_finance/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OnBoardingPage()), (route) => false);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
          child: Image.asset("assets/images/logo_big.png",
            scale: 2,
          ),
        ),
      ),
    );
  }
}








