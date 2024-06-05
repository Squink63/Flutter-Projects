

import 'package:flutter/material.dart';
import 'package:the_library_app/tab_views/librar_book_list_sorting_view.dart';
import 'package:the_library_app/utils/colors.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';

class ShelfDetailsPage extends StatelessWidget {
  const ShelfDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        scrolledUnderElevation: 0,
        leading: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
              ),
            ),
            Text(
              "Library",
              style: TextStyle(
                  color: kPrimaryColor,
                fontSize: kTextRegular2x
              ),

            ),
          ],
        ),
        leadingWidth: kMargin100,
        actions: [
          Icon(
            Icons.more_horiz_outlined,
            color: kPrimaryColor,
            size: kMargin30,
          ),

          SizedBox(width: kMarginMedium2,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kMargin22, top: kMarginXLarge),
              child: Text(
                "GG",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular3x
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: kMargin22,top: kMarginSmall,bottom: kMarginLarge),
              child: Text(
                "0 books",
                style: TextStyle(
                    color: kSecondaryTextColor,

                ),
              ),
            ),


            Divider(
              color: kBlankColor,
              height: 0.2,
            ),

            LibraryBookListSortingView()
          ],
        ),
      ),
    );
  }
}
