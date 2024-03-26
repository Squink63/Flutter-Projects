import 'package:flutter/material.dart';

import '../item_view/loan_item_view.dart';
import '../utils/colors.dart';

class PreviousLoanPage extends StatelessWidget {
  const PreviousLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
        title: Text("Previous Loan",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LoanItemView(loanLabel: "Contact 1"),

            SizedBox(height: 12,),

            LoanItemView(loanLabel: "Contact 2"),

            SizedBox(height: 12,),

            LoanItemView(loanLabel: "Contact 3"),
          ],
        ),
      ),
    );
  }
}
