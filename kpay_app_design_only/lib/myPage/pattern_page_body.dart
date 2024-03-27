import 'package:flutter/material.dart';

class PatternPageBody extends StatefulWidget {
  const PatternPageBody({super.key});

  @override
  State<PatternPageBody> createState() => _PatternPageBodyState();
}

class _PatternPageBodyState extends State<PatternPageBody> {
  bool setPin = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text("Pattern",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18
            ),
          ),
          Spacer(),
          Switch(
              value: setPin,
              onChanged: (bool value){
                setState(() {
                  setPin = value;
                });
              } )
        ],
      ),
    );
  }
}
