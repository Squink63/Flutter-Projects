import 'package:flutter/material.dart';
import 'package:test_one/a_bank_login_page.dart';
import 'package:test_one/calculator_page.dart';
import 'package:test_one/exchange_rate_page.dart';

class ABankPage extends StatelessWidget {
  const ABankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.all(60.0),
              child: Row(
                children: [
                  Image.asset("assets/images/a_bank_logo.png",
                    width: 100,
                    height: 100,
                  ),

                  Text("A bank",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 60
                    ),
                  )
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: SizedBox(
                width: 500,
                child: Wrap(
                  spacing: 50,
                  runSpacing: 50,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ABankLoginPage()));
                      },
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Column(
                          children: [
                            Container(
                              height: 15,
                            ),
                            Image.asset("assets/images/enter.png",
                              width: 70,
                              height: 70,
                              color: Colors.white,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 11.0, left: 10),
                              child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 200,
                      child: Column(
                        children: [
                          Image.asset("assets/images/contact.png",
                            width: 90,
                            height: 90,
                            color: Colors.white,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Contact",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExchangeRatePage()));
                      },
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Column(
                          children: [
                            Image.asset("assets/images/exchange.png",
                              width: 80,
                              height: 80,
                              color: Colors.white,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Exchange Rate",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculatorPage()));
                      },
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Column(
                          children: [
                            Image.asset("assets/images/calculator.png",
                              width: 80,
                              height: 80,
                              color: Colors.white,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Calculator",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Image.asset("assets/images/image.png",
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
            )

          ],
        ),
      ),
    );
  }
}
