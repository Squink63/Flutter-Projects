import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ChangePhonePageBody extends StatelessWidget {
  const ChangePhonePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Your current KBZPay phone number is:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),

        SizedBox(
          height: 16,
        ),

        Text("****488448",
          style: TextStyle(
              color: Colors.black,
              fontSize: 29
          ),
        ),

        SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryKPayColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            child: Text("Change",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 29
              ),
            ),
          ),
        ),
      ],
    );
  }
}
