

import 'package:api_app/pages/account_page.dart';
import 'package:api_app/pages/add_new_transaction_page.dart';
import 'package:api_app/pages/home_page.dart';
import 'package:api_app/pages/reports_page.dart';
import 'package:api_app/pages/saving_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> screenWidgets = [];

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);
    screenWidgets = [ HomePage(), SavingsPage(), SizedBox.shrink(), ReportsPage(), AccountPage()];
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: screenWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Color.fromRGBO(55, 118, 231, 1.0),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedItemColor: Color.fromRGBO(185, 185, 185, 1.0),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex){
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Transactions"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: "Savings"
          ),

          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: ""
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: "Reports"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account"
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 10,),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNewTransactionPage()));
          },
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 4, color: Colors.white),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
        ),
      ),
     )
    );
  }
}

Color kPrimaryColor = const Color.fromRGBO(55, 118, 231, 1.0);