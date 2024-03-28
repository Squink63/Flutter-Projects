import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AboutKBZPayPageBody extends StatelessWidget {
  const AboutKBZPayPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Image.asset("assets/images/kpay_logo.png",
          width: 100,
          height: 100,
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          width: double.infinity,
          height: 80,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryKPayColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            child: Text("Check fo update",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 29
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text("Terms of Service",
          style: TextStyle(
              color: kPrimaryKPayColor,
              fontSize: 22
          ),
        ),
      ],
    );
  }
}
