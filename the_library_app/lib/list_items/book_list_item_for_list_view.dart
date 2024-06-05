

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/utils/dimens.dart';
import 'package:the_library_app/utils/images.dart';

import '../data/vos/book_vo.dart';
import '../utils/colors.dart';

class BookListItemForListView extends StatelessWidget {
  final BookVO book;
  final bool isForList;
  const BookListItemForListView({super.key, required this.book, required this.isForList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kMarginMedium2,left: kMarginSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kMarginSmall),
            child: Image.network(
              book.bookImage ?? "",
              fit: BoxFit.fill,

              width: 55,
              height: 80,
            ),
          ),

          SizedBox(
            width: kMarginMedium2,
          ),

          Expanded(child: BookInfoView(book: book, isForList: isForList,)),

          Spacer(),

          Visibility(
            visible: isForList,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: kMarginMedium3,
            ),
          )
        ],
      ),
    );
  }
}

class BookInfoView extends StatelessWidget {
  final BookVO book;
  final bool isForList;
  const BookInfoView({super.key, required this.book, required this.isForList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          book.title ?? "" ,
          maxLines: 1,
          overflow:  isForList
          ? TextOverflow.ellipsis
          : TextOverflow.clip,
          style: TextStyle(
              color: Colors.white,
            fontSize: isForList == true
              ? kTextRegular2x
              : kTextRegular3x
          ),
        ),

        SizedBox(
          height: kMarginSmall,
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

