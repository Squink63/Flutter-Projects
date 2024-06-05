
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';
import 'package:the_library_app/utils/images.dart';

import '../data/vos/shelf_vo.dart';

class ShelfListItemView extends StatelessWidget {
  final ShelfVO shelf;
  const ShelfListItemView({super.key, required this.shelf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium3),
      child: Row(
        children: [
          BookImageInShelfView(),

          SizedBox(
            width: kMarginXLarge,
          ),

          ShelfInfoView(shelf: shelf),

          Spacer(),

          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
/// Book Image
class BookImageInShelfView extends StatelessWidget {
  const BookImageInShelfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: kMargin10,
          top: kMargin10,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(kMarginMedium)),
            child: Image.asset(
              kBlankImage,
              fit: BoxFit.cover,
              color: kBlankColor,
              width: kMargin70,
              height: kMargin60,
            ),
          ),
        ),

        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(kMarginMedium)),
          child: Image.asset(
            kBlankImage,
            fit: BoxFit.cover,
            color: kBlankColor,
            width: kMargin70,
            height: kMargin70,
          ),
        ),


      ],
    );
  }
}

/// Shelf Info View
class ShelfInfoView extends StatelessWidget {
  final ShelfVO shelf;
  const ShelfInfoView({super.key, required this.shelf});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shelf.shelfName ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular18
          ),
        ),

        SizedBox(
          height: kMarginMedium,
        ),

        Text(
          "0 books",
          style: TextStyle(
              color: kSecondaryTextColor,

          ),
        ),
      ],
    );
  }
}


