

import 'package:flutter/material.dart';
import 'package:the_library_app/utils/colors.dart';

import '../utils/dimens.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                maxLength: 50,
                autofocus: true,
                cursorColor: kPrimaryColor,
                cursorHeight: kMargin40,
                onSubmitted: (text){
                  if (text.isNotEmpty){
                    setState(() {
                      value = text;
                    });
                  }
                },
                style: TextStyle(
                    fontSize: kTextRegular22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)
                    ),
                    hintText: "Shelf name",
                    hintStyle: TextStyle(
                        fontSize: kTextRegular3x,
                        color: kSecondaryTextColor
                    ),
                    helperStyle: TextStyle(
                        fontSize: kTextRegular2x,
                        color: kSecondaryTextColor
                    )
                ),

              ),

              SizedBox(height: 60,),

              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
