import 'package:flutter/material.dart';
import 'package:test_one/item_view/message_item.dart';

class ShareAppPageBody extends StatelessWidget {
  const ShareAppPageBody({super.key});

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
              Text("Message",
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
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text("Social Network",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  showCustomBottomSheet(context);
                },
                child: Icon(Icons.chevron_right,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );

  }
}
