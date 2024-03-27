import 'package:flutter/material.dart';
import 'package:test_one/cash_in_page.dart';
import 'package:test_one/kpay_exchange_rate_page.dart';

import 'cash_out_page.dart';
import 'main.dart';

class MyBalancePage extends StatelessWidget {
  const MyBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("My Balance",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 70),
                decoration: BoxDecoration(
                  color: kPrimaryKPayColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => KPayExchangeRatePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: [
                        Image.asset("${kImage}us_flag.jpg",
                          scale: 150,
                        ),
                        SizedBox(width: 6,),
                        Text("1 USD = ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                          ),
                        ),

                        SizedBox(width: 8,),

                        Image.asset("${kImage}mm_flag.jpg",
                          scale: 150,
                        ),
                        SizedBox(width: 6,),
                        Text("2094 MMK ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.play_arrow,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Wallet Balance (Ks)",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),

                      SizedBox(height: 12,),

                      Text("10000.00",
                        style: TextStyle(
                            fontSize: 26,
                          color: Colors.black
                        ),
                      ),

                      SizedBox(height: 12,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CashInPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryKPayColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              child: Text("Cash In",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CashOutPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white24,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                              child: Text("Cash Out",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
