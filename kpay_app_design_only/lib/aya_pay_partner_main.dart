import 'package:flutter/material.dart';
import 'package:test_one/aya_pay_agent_home.dart';
import 'package:test_one/aya_pay_partner_dashboard_page.dart';

import 'aya_pay_partner_home_page.dart';

class AYAPayPartnerMainPage extends StatefulWidget {
  const AYAPayPartnerMainPage({super.key});

  @override
  State<AYAPayPartnerMainPage> createState() => _AYAPayPartnerMainPageState();
}

class _AYAPayPartnerMainPageState extends State<AYAPayPartnerMainPage> {

  var currentIndex = 0;

  var widgetsToShow = [
    const AYAPayPartnerHomePage(),
    const AYAPayPartnerDashboardPage(),
    const Center(child: Text("")),
    const Center(child: Text("Wallet")),
    const Center(child: Text("Settings"))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Color.fromRGBO(148, 46, 43, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Icon(Icons.crop,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: widgetsToShow[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),

          BottomNavigationBarItem(
              icon: Image.asset("assets/images/tea-leaf.png",
                width: 5,
                height: 5,
              ), label: ""),

          BottomNavigationBarItem(
              icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromRGBO(148, 46, 43, 1.0),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
      ),
    );
  }
}
