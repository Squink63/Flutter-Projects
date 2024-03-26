import 'package:flutter/material.dart';
import 'package:momo_finance/pages/main_page.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo_big.png",
                  scale: 3,
                ),
              ),

              SizedBox(height: 16,),

              Text("Please enter your SMS code",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: 10,),

              Text("Phone Number 09******44",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,

                ),
              ),

              SizedBox(height: 16,),

              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4))),
              ),

              SizedBox(height: 16,),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),

                  ),
                  child: Text("Next",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
