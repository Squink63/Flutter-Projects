import 'package:flutter/material.dart';
import 'package:momo_finance/pages/loan_item_page.dart';
import 'package:momo_finance/utils/strings.dart';

import '../utils/colors.dart';

class ApplyLoanPage extends StatelessWidget {
  const ApplyLoanPage({super.key});

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
        title: Text("Apply Loan",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 250
          ),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoanItemPage()));
              },
                child: ApplyLoanItem());
          },
        itemCount: 6,
      ),
    );
  }
}

class ApplyLoanItem extends StatelessWidget {
  const ApplyLoanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("${kImage}/phone.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("MobilePhone",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                  SizedBox(height: 10,),

                  Text("Top up loan",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

