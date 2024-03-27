import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text("Sound",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              ),
              Spacer(),
              Switch(value: false, onChanged: ArgumentError.value)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text("Vibrate",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              ),
              Spacer(),
              Switch(value: false, onChanged: ArgumentError.value)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text("About Save E-Receipt to phone album",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                ),
              ),
              Spacer(),
              Switch(value: false, onChanged: ArgumentError.value)
            ],
          ),
        )
      ],
    );
  }
}
