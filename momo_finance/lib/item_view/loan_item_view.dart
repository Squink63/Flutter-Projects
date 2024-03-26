import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_finance/pages/home_page.dart';

class LoanItemView extends StatelessWidget {
  final String loanLabel;
  const LoanItemView({super.key, required this.loanLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12,),

      ),
      child: Item(icon: Icons.file_copy_sharp, label: loanLabel,),
    );
  }
}
