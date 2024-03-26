import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:momo_finance/pages/home_page.dart';
import 'package:momo_finance/pages/loan_info_page.dart';
import 'package:momo_finance/pages/profile_page.dart';
import 'package:momo_finance/utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var currentIndex = 1;

  var widgetsToShow = [
    ProfilePage(),
    HomePage(),
    MyLoanInfoPage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: widgetsToShow[currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.layers), label: "My Loan Info"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
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

String formattedCash(int? amount) {
  return NumberFormat("#,###").format(amount);
}
