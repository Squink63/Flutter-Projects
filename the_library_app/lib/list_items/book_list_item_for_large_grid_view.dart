
import 'package:flutter/cupertino.dart';

import '../data/vos/book_vo.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';

class BookListItemForLargeGridView extends StatelessWidget {
  final BookVO book;
  const BookListItemForLargeGridView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kMarginSmall),
          child: Image.network(
            book.bookImage ?? "",
            fit: BoxFit.fill,
            width: double.infinity,
            height: 280,
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: kSecondaryTextColor
          ),
        ),
      ],
    );
  }
}
