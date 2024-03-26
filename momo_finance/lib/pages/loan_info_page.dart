import 'package:flutter/material.dart';
import 'package:momo_finance/item_view/loan_item_view.dart';
import 'package:momo_finance/pages/previous_loan_page.dart';
import 'package:momo_finance/utils/colors.dart';

class MyLoanInfoPage extends StatelessWidget {
  const MyLoanInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        toolbarHeight: 100,
        title: Text("My Loan Info",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LoanItemView(loanLabel: "Current Loan"),

            SizedBox(height: 12,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreviousLoanPage()));
              },
                child: LoanItemView(loanLabel: "Previous Loan"))
          ],
        ),
      ),
    );
  }
}
