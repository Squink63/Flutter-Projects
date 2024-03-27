import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/main.dart';
import 'package:test_one/message_item.dart';

class KPayMessagePage extends StatelessWidget {
  const KPayMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
        appBar: AppBar(
          backgroundColor: kPrimaryKPayColor,
          title: Container(
            width: double.infinity,
            height: 50,
            color: kPrimaryKPayColor,
            child: Center(
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: TabBar(
                indicatorColor: Colors.blue,
                indicatorWeight: 1,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
                tabs: [
                  Tab(
                    text: "Updates",
                  ),
                  Tab(
                    text: "Connect",
                  ),
                ],

              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
              children: [
                UpdatesTabView(),
                ConnectTabView()
              ]
          ),
        ),
      ),
    );
  }
}

class UpdatesTabView extends StatelessWidget {
  const UpdatesTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 8,),
              MessageItem(index: index,),
            ],
          );
        });
  }
}

class ConnectTabView extends StatelessWidget {
  const ConnectTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
        itemBuilder: (context,index) {
          return Column(
            children: [
              ConnectItemView(index: index),

              SizedBox(height: 10,)
            ],
          );
        });
  }
}

class ConnectItemView extends StatelessWidget {
  final int index;
  ConnectItemView({super.key, required this.index});

  final List<String> connectLabel = ["Official Accounts", "Transaction Message", "Notice"];
  final List<IconData> icon = [Icons.book_sharp, Icons.mark_chat_read, Icons.notifications];
  final List<Color> color = [kPrimaryKPayColor, Colors.blueAccent, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          Badge(
            label: Text("99+"),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color[index]
              ),
              child: Icon(icon[index],
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 12,),
          Text(connectLabel[index],
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
          Spacer(),
          Visibility(
            visible: index < 1,
            child: Icon(Icons.chevron_right,
              size: 30,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}


