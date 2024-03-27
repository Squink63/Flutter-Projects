import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/main.dart';

class ChooseLanguagePageBody extends StatefulWidget {
  const ChooseLanguagePageBody({super.key});

  @override
  State<ChooseLanguagePageBody> createState() => _ChooseLanguagePageBodyState();
}

class _ChooseLanguagePageBodyState extends State<ChooseLanguagePageBody> {
  bool isSelectedE = false;
  bool isSelectedM = false;
  bool isSelectedC = false;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelectedE = true;
                isSelectedM = false;
                isSelectedC = false;
              });
            },
            child: Row(
              children: [
                Text("English",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: isSelectedE,
                  child: Icon(Icons.check,
                    color: kPrimaryKPayColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              setState(() {
                isSelectedM = true;
                isSelectedE = false;
                isSelectedC = false;
              });
            },
            child: Row(
              children: [
                Text("မြန်မာ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: isSelectedM,
                  child: Icon(Icons.check,
                    color: kPrimaryKPayColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              setState(() {
                isSelectedC = true;
                isSelectedE = false;
                isSelectedM = false;
              });
            },
            child: Row(
              children: [
                Text("中文",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: isSelectedC,
                  child: Icon(Icons.check,
                    color: kPrimaryKPayColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
