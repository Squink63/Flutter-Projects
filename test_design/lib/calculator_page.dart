import 'package:flutter/material.dart';
import 'package:test_one/emi_tab.dart';
import 'package:test_one/exchange_tab.dart';
import 'package:test_one/loan_tab.dart';
import 'package:test_one/saving_tab.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(4, 0, 95, 1.0),
          centerTitle: true,
          title: Text("Calculator",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Text("Saving",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),

              Tab(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Text("Loan",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),

              Tab(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Text("EMI",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),

              Tab(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Text("Exchange",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
          child: TabBarView(
            children: [
              SavingTab(),
              LoanTab(),
              EMITab(),
              ExchangeTab(),
            ],
          ),
        ),
      ),
    );
  }
}
