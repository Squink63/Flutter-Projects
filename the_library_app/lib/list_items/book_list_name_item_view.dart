
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/data/vos/category_list_vo.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';

import '../data/vos/book_overview_result_vo.dart';

class BookListNameItemView extends StatelessWidget {
  final CategoryListVO category;
  const BookListNameItemView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          category.listName ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2x
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios,
          size: kMarginMedium3,
          color: kPrimaryColor,
        )
      ],
    );
  }
}
