

import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<TransactionVO> transactionaToShow = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




final TrackerModel _model = TrackerModel();
String totalIncome = "0";
String totalExpanses = "0";
String balance = "0";
List<int>? expensesAmountList;
List<int>? incomeAmountList;


  @override
  void initState() {
    List<TransactionVO> transactionsFromDatabase = _model.getTransactionsFromDatabase();
    setState(() {

      // if(transactionaToShow.isEmpty) {
      //   transactionaToShow = transactionsFromDatabase;
      // }

      transactionaToShow = transactionsFromDatabase;


      

      

      
      

      
    });
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {

    expensesAmountList = transactionaToShow.where((t) => t.type == "Expenses").toList().map((t) => int.parse(t.amount)).toList();
    incomeAmountList = transactionaToShow.where((t) => t.type == "Income").toList().map((t) => int.parse(t.amount)).toList();

    if (expensesAmountList!.isEmpty) {
      totalExpanses = "0";
    } else {
      totalExpanses = expensesAmountList!.reduce((first, second) => first + second).toString();
    }

    if (incomeAmountList!.isEmpty) {
      totalIncome = "0";
    } else {
      totalIncome = incomeAmountList!.reduce((first, second) => first + second).toString();
    }

      
      

      balance = (int.parse(totalIncome) - int.parse(totalExpanses)).toString();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: InkWell(
          onTap: (){
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(balance)));
          },
          child: Icon(Icons.safety_check),
        ),
        centerTitle: true,
        title: Text(
          "My Wallet",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: kPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  TabItemView(
                    amount: (transactionaToShow.isEmpty) ? "0" : NumberFormat("#,###").format(int.parse(totalIncome)),
                     name: "INCOME"),
                  TabItemView(
                    amount: (transactionaToShow.isEmpty) ? "0" : NumberFormat("#,###").format(int.parse(totalExpanses)),
                     name: "EXPENSES"),
                  TabItemView(
                    amount: (transactionaToShow.isEmpty) ? "0" : NumberFormat("#,###").format(int.parse(balance)),
                     name: "BALANCE"),
                  
                  
              
                ],
              ),
            ),

            (transactionaToShow.isEmpty)
            ? Center(
              heightFactor: 30,
              child: Text(
                "No transaction",
                style: TextStyle(
                color: Color.fromARGB(255, 119, 119, 119)
              ),
              ),
            ) 
            : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactionaToShow.length,
              itemBuilder: (context, index) {
                TransactionVO transaction = transactionaToShow[index];
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 2),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        // padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (transaction.type == "Income") ? Colors.green : (transaction.type == "Expenses") ? Colors.pink  : kPrimaryColor
                        ),
                        child: Icon(
                          Icons.face
                        ),
                        
                      ),
                  
                      SizedBox(
                        width: 16,
                      ),
                  
                      Text(
                        transaction.category,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                  
                      Spacer(),
                  
                      Text(
                        (transaction.type == "Expenses")
                        ? "-${transaction.amount} Ks"
                        : "${transaction.amount} Ks",
                        style: TextStyle(
                          color: (transaction.type == "Income") ? Colors.green : (transaction.type == "Expenses") ? Colors.red  : kPrimaryColor,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              }),

        
          ],
        ),
      ),
    );
  }
}

class TabItemView extends StatelessWidget {
  final String amount;
  final String name;
  const TabItemView
({super.key, required this.amount, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${amount} KS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,fontWeight: FontWeight.w600
          ),
        ),

        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            //fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}

