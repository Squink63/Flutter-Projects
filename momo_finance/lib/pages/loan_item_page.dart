import 'package:flutter/material.dart';
import 'package:momo_finance/pages/apply_now_page.dart';

import '../item_view/loan_item_view.dart';
import '../utils/colors.dart';
import 'apply_loan_page.dart';

class LoanItemPage extends StatelessWidget {
  const LoanItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
        title: Text("Mobile Phone",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LoanItemView(loanLabel: "Required Documents"),

            SizedBox(height: 12,),

            LoanItemView(loanLabel: "Process to Apply"),

            SizedBox(height: 12,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApplyNowPage()));
              },
                child: LoanItemView(loanLabel: "Apply Now")),
          ],
        ),
      ),
    );
  }
}
