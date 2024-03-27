import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/cinemas_page.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/profile_page.dart';
import 'package:the_movie_booking_app/pages/ticket_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class MainPage extends StatefulWidget {
  final int index;
  const MainPage({super.key, required this.index,});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  List<Widget> screenWidgets = [];

  void initState() {
    super.initState();
    screenWidgets = [ HomePage(index: widget.index,), const CinemasPage(), TicketPage(), const ProfilePage()];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        unselectedItemColor: kBottomNavigationUnSelectedColor,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex){
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: _getBottomNavigationBarItems(),
      ),

      body: screenWidgets[currentIndex],
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      /// Movies
      BottomNavigationBarItem(
         icon: Image.asset(
           kMoviesIcon,
           width: kMarginLarge,
           height: kMarginLarge,
         ),
        activeIcon: Image.asset(
          kMoviesIcon,
          width: kMarginLarge,
          height: kMarginLarge,
          color: kPrimaryColor,
        ),
        label: kMoviesLabel
      ),

      /// Cinemas
      BottomNavigationBarItem(
          icon: Image.asset(
            kCinemaIcons,
            width: kMarginXLarge,
            height: kMarginXLarge,
          ),
          activeIcon: Image.asset(
            kCinemaIcons,
            width: kMarginXLarge,
            height: kMarginXLarge,
            color: kPrimaryColor,
          ),
          label: kCinemasLabel
      ),

      /// Ticket
      BottomNavigationBarItem(
          icon: Image.asset(
            kTicketIcon,
            width: kMarginXLarge,
            height: kMarginXLarge,
          ),
          activeIcon: Image.asset(
            kTicketIcon,
            width: kMarginXLarge,
            height: kMarginXLarge,
            color: kPrimaryColor,
          ),
          label: kTicketLabel
      ),

      /// Profile
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: kMarginXLarge,
          ),
          activeIcon: Icon(
            Icons.person,
            size: kMarginXLarge,
            color: kPrimaryColor,
          ),
          label: kProfileLabel
      ),
    ];
  }
}
