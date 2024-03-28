import 'package:flutter/material.dart';
import 'package:test_one/pages/kapy_my_page.dart';
import 'package:test_one/pages/kpay_home_page.dart';
import 'package:test_one/pages/kpay_life_page.dart';
import 'package:test_one/pages/kpay_message_page.dart';
import '../utils/constants.dart';
void main() {
  runApp(const KPayMainPage());
}

class KPayMainPage extends StatefulWidget {
  const KPayMainPage({super.key});

  @override
  State<KPayMainPage> createState() => _KPayMainPageState();
}

class _KPayMainPageState extends State<KPayMainPage> {

  var currentIndex = 0;

  var widgetsToShow = [
    const KPayHomePage(),
    const KPayLifePage(),
    const KPayMessagePage(),
    const KPayMyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: TabBarTheme(

        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kPrimaryKPayColor,
        body: SafeArea(child: widgetsToShow[currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Life"),
            BottomNavigationBarItem(
                icon: Badge(label: Text("99+"),child: Icon(Icons.wallet)), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My"),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: kPrimaryKPayColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (selectedIndex) {
            setState(() {
              currentIndex = selectedIndex;
            });
          },
        ),
      ),
    );
  }
}
