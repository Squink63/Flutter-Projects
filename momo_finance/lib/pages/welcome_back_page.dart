import 'package:flutter/material.dart';
import 'package:momo_finance/pages/home_page_option_1.dart';
import 'package:momo_finance/pages/home_page_option_2.dart';
import 'package:momo_finance/pages/home_page_option_3.dart';
import 'package:momo_finance/pages/main_page.dart';
import 'package:momo_finance/utils/colors.dart';

class WelcomeBackPage extends StatelessWidget {
  const WelcomeBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 132,),
                Text("Welcome\nback",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
                SizedBox(height: 12,),

                Text("Sign to continue",
                  style: TextStyle(

                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  width: double.infinity,
                  height: 50,
                  color: kPrimaryColor,
                  child: Row(
                    children: [
                      SizedBox(width: 26,),
                      Icon(Icons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(width: 36,),
                      Text("Continue with Facebook",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
                ),

                SizedBox(height: 10,),

                Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 26,),
                        Icon(Icons.g_mobiledata,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 36,),
                        Text("Continue with Google",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ],
                    )
                ),

                SizedBox(height: 20,),

                Center(
                  child: Text("or",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 26,),

                        Text("Continue with Email",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),

                        Spacer(),

                        Icon(Icons.mail,
                          color: Colors.black,
                        ),

                        SizedBox(width: 16,),

                      ],
                    )
                ),

                SizedBox(height: 20,),

                Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 26,),

                        Text("Password",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),

                        Spacer(),

                        Icon(Icons.lock,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16,),
                      ],
                    )
                ),

                SizedBox(height: 20,),

                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageOption1()));
                    },
                    onDoubleTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageOption2()));
                    },
                    onLongPress: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageOption3()));
                    },
                    child: Container(
                      color: kPrimaryColor,
                      padding: EdgeInsets.all(18),
                      child: Text("Continue with Email",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
