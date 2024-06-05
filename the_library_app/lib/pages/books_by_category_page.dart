import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/blocs/books_by_category_bloc.dart';
import 'package:the_library_app/data/models/LibraryModel.dart';
import 'package:the_library_app/data/vos/category_list_vo.dart';
import 'package:the_library_app/list_items/book_list_item_for_large_grid_view.dart';
import 'package:the_library_app/utils/dimens.dart';

import '../data/vos/book_vo.dart';
import '../utils/colors.dart';

class BooksByCategoryPage extends StatelessWidget {
  final CategoryListVO? category;
  const BooksByCategoryPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksByCategoryBloc(category),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          scrolledUnderElevation: 0,
          leading: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          leadingWidth: kMargin100,
          title: Text(
            category?.listName ?? "",
            style:
                TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
          ),
          centerTitle: true,
        ),
        body: Selector<BooksByCategoryBloc, List<BookVO>>(
            selector: (context, bloc) => bloc.booksByCategoryToShow,
            builder: (context, booksByCategoryToShow, child) {
              return (booksByCategoryToShow.isEmpty)
                  ? Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                  : GridView.builder(
                      padding: EdgeInsets.all(kMarginMedium3),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kMarginMedium3,
                          crossAxisSpacing: kMarginMedium2,
                          mainAxisExtent: 330),
                      itemBuilder: (context, index) {
                        return BookListItemForLargeGridView(
                          book: booksByCategoryToShow[index],
                        );
                      },
                      itemCount: booksByCategoryToShow.length,
                    );
            }),
      ),
    );
  }
}
