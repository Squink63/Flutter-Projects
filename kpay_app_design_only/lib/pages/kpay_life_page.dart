import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../item_view/LifeItemView.dart';


class KPayLifePage extends StatelessWidget {
  const KPayLifePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("Life",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16,
          vertical: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Enter Keyword to Search"
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Items(listItemLabelIndex: index,),
                        SizedBox(
                          height: 8
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
