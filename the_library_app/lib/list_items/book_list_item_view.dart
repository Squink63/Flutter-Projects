import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';
import 'package:the_library_app/utils/images.dart';

class BookListItemView extends StatelessWidget {
  final BookVO book;
  const BookListItemView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kMarginSmall),
            child: Image.network(
              book.bookImage ?? "",
              fit: BoxFit.fill,
              width: double.infinity,
              height: 170,
            ),
          ),

          SizedBox(
            height: kMarginSmall,
          ),

          Text(
            book.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: kSecondaryTextColor
            ),
          ),

          Text(
            book.author ?? "",
            style: TextStyle(
              color: kSecondaryTextColor
            ),
          ),

          Row(
            children: [
              Text(
                "4.8",
                style: TextStyle(
                    color: kSecondaryTextColor
                ),
              ),
              Icon(Icons.star,
                color: kSecondaryTextColor,
              )
            ],
          )

        ],
      ),
    );
  }
}
