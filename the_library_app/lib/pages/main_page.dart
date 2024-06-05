import 'package:flutter/material.dart';
import 'package:the_library_app/pages/discover_page.dart';
import 'package:the_library_app/pages/home_page.dart';
import 'package:the_library_app/pages/library_page.dart';
import 'package:the_library_app/pages/search_book_page.dart';
import 'package:the_library_app/pages/wishlist_page.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';
import 'package:the_library_app/utils/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> screenWidgets = [
    HomePage(),
    LibraryPage(),
    WishlistPage(),
    DiscoverPage()
  ];

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
        backgroundColor: kBottomNavigationBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: _getBottomNavigationBarItems(),
      ),
      body: Stack(
          children: [
            screenWidgets[currentIndex],

            GestureDetector(
              onTap:() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchBookPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: kMargin18, vertical: kMargin50),
                padding: EdgeInsets.symmetric(horizontal: kMarginMedium),
                width: double.infinity,
                height: kMargin50,
                decoration: BoxDecoration(
                  color: kSearchBackgroundColor,
                  borderRadius: BorderRadius.circular(kMarginMedium)
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search,
                      size: kMargin30,
                      color: kBottomNavigationUnSelectedColor,
                    ),

                    /// Spacer
                    const SizedBox(
                      width: kMarginMedium,
                    ),

                    Text(
                        "Search play Books",
                         style: TextStyle(
                          color: kBottomNavigationUnSelectedColor,
                           fontSize: kTextRegular3x
                      ),
                    )

                  ],
                ),
              ),
            )
          ]),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      /// Home
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: kMarginLarge,
          ),
          activeIcon: Icon(
            Icons.home,
            size: kMarginLarge,
            color: kPrimaryColor,
          ),
          label: kHomeLabel),

      /// Library
      BottomNavigationBarItem(
          icon: Icon(
            Icons.library_books_outlined,
            size: kMarginLarge,
          ),
          activeIcon: Icon(
            Icons.library_books_outlined,
            size: kMarginLarge,
            color: kPrimaryColor,
          ),
          label: kLibraryLabel),

      /// Wishlist
      BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_add_rounded,
            size: kMarginLarge,
          ),
          activeIcon: Icon(
            Icons.bookmark_add_rounded,
            size: kMarginLarge,
            color: kPrimaryColor,
          ),
          label: kWishlistLabel),

      /// Discover
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
            size: kMarginXLarge,
          ),
          activeIcon: Icon(
            Icons.store,
            size: kMarginXLarge,
            color: kPrimaryColor,
          ),
          label: kDiscoverLabel),
    ];
  }
}
