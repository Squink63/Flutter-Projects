

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';

class CarouselBookListItemView extends StatelessWidget {
  final BookVO book;
  const CarouselBookListItemView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kMarginMedium),
            child: Image.network(
              book.bookImage ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 270,
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(kMarginMedium)
              ),
              margin: EdgeInsets.all(kMarginMedium),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
