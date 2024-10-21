import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage
({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {

  final TrackerModel _model = TrackerModel();
  List<TransactionVO> savingsToShow = [];

@override
  void initState() {
    List<TransactionVO> transactionsFromDatabase = _model.getTransactionsFromDatabase();
    setState(() {
      savingsToShow = transactionsFromDatabase.where((t) => t.type == "Savings").toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "Savings",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),

      body: (savingsToShow.isEmpty)
            ? Center(
              heightFactor: 30,
              child: Text(
                "No Saving",
                style: TextStyle(
                color: Color.fromARGB(255, 119, 119, 119)
              ),
              ),
            ) 
            : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: savingsToShow.length,
              itemBuilder: (context, index) {
                TransactionVO transaction = savingsToShow[index];
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
                          color: kPrimaryColor
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
                        ? "-\$${transaction.amount}"
                        : "\$${transaction.amount}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}