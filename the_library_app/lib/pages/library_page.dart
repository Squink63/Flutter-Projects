import 'package:flutter/material.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/tab_views/your_shelves_tab_view.dart';
import 'package:the_library_app/utils/dimens.dart';

import '../list_items/book_list_item_for_large_grid_view.dart';
import '../list_items/book_list_item_for_list_view.dart';
import '../list_items/book_list_item_for_small_grid_view.dart';
import '../tab_views/librar_book_list_sorting_view.dart';
import '../utils/colors.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: kMargin70,
          backgroundColor: kBackgroundColor,
          bottom: TabBar(
            indicatorColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: kPrimaryColor,
            unselectedLabelColor: kSecondaryTextColor,
            dividerColor: kSecondaryTextColor,
            dividerHeight: 0.5,
            labelStyle: TextStyle(
              fontSize: kTextRegular2x,
            ),
            tabs: [
              Tab(
                text: "Your books",
              ),
              Tab(
                text: "Your shelves",
              )
            ],

          ),
        ),
        body: TabBarView(
          children: [
            LibraryBookListSortingView(),
            YourShelvesTabView()
          ],
        )
      ),
    );
  }
}





