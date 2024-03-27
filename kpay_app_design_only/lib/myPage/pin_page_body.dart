import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/myPage/change_pin_page.dart';

import 'forget_pin_page.dart';

class PinPageBody extends StatelessWidget {
  const PinPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChangePinPage()));
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text("Change PIN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgetPinPage()));
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text("Forget PIN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
