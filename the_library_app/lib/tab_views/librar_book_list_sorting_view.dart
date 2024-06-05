import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/utils/enums.dart';
import 'package:the_library_app/utils/strings.dart';

import '../data/vos/book_vo.dart';
import '../list_items/book_list_item_for_large_grid_view.dart';
import '../list_items/book_list_item_for_list_view.dart';
import '../list_items/book_list_item_for_small_grid_view.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';

class LibraryBookListSortingView extends StatefulWidget {
  const LibraryBookListSortingView({super.key});

  @override
  State<LibraryBookListSortingView> createState() =>
      _LibraryBookListSortingViewState();
}

class _LibraryBookListSortingViewState extends State<LibraryBookListSortingView> {

  BookSorting? sorting = BookSorting.Recent;
  BookView? viewSorting = BookView.List;
  List<BookVO> bookList = recentBookList.toList();

  void _sortBook(){

    switch (sorting) {
      case BookSorting.Recent:
        bookList = recentBookList.toList();
      case BookSorting.Title:
        bookList.sort((a,b) =>
            a.title!.compareTo(b.title!));
      case BookSorting.Author:
         bookList.sort((a,b) =>
            a.author!.compareTo(b.author!));
      default: bookList = recentBookList.toList();

    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginLarge),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopSectionView(
              onTapSortOption: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                        heightFactor: 0.6,
                        child: BookSortingBottomSheet(
                          sorting: sorting!,
                          onChangedSorting: (value) {
                            setState(() {
                              sorting = value;
                              _sortBook();
                            });
                            Navigator.pop(context);
                          },
                        ),
                      );
                    });
              },
              onTapIcon: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                        heightFactor: 0.6,
                        child: BookViewBottomSheet(
                            viewSorting: viewSorting!,
                            onChangedView: (value){
                              setState(() {
                                viewSorting = value;
                              });
                              Navigator.pop(context);
                            }),
                      );
                    });
              },
              sorting: sorting,
            ),
            SizedBox(
              height: kMarginMedium3,
            ),
            YourBookListView(
              viewSorting: viewSorting!,
              bookList: bookList,
              onPressBookItem: (book) {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    builder: (BuildContext context) {
                      return BookItemOptionBottomSheet(
                        book: book,
                        onTapOption: (book ) {
                          setState(() {
                            bookList.remove(book);
                          });
                          Navigator.pop(context);
                        },
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

/// Your books Top Section View
class TopSectionView extends StatelessWidget {
  final Function onTapSortOption;
  final Function onTapIcon;
  final BookSorting? sorting;
  const TopSectionView({
      super.key,
      required this.onTapIcon,
      required this.onTapSortOption,
      required this.sorting});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onTapSortOption();
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ListTile(
              leading: Icon(
                Icons.sort,
                color: Colors.grey,
              ),
              title: Text(
                "Sort by: ${sorting?.name}",
                style: TextStyle(color: kSecondaryTextColor),
              ),
            ),
          ),
        ),
        Spacer(),
        InkWell(
            onTap: () {
              onTapIcon();
            },
            child: Icon(
              Icons.list,
              color: Colors.grey,
            )),
        SizedBox(
          width: kMarginMedium3,
        )
      ],
    );
  }
}

/// Your books List View
class YourBookListView extends StatelessWidget {
  final BookView viewSorting;
  final List<BookVO> bookList;
  final Function(BookVO) onPressBookItem;
  const YourBookListView({super.key, required this.viewSorting, required this.bookList, required this.onPressBookItem,});

  @override
  Widget build(BuildContext context) {
    switch (viewSorting) {
      case BookView.List:
        return LibraryBookListView(bookList: bookList, onPressBookItem: onPressBookItem,);
      case BookView.LargeGrid:
        return LibraryBookListLargeGridView(bookList: bookList, onPressBookItem: onPressBookItem,);
      case BookView.SmallGrid:
        return LibraryBookListSmallGridView(bookList: bookList, onPressBookItem: onPressBookItem,);
      default:
        return LibraryBookListView(bookList: bookList, onPressBookItem: onPressBookItem,);
    }
  }
}

/// Large Grid View
class LibraryBookListLargeGridView extends StatelessWidget {
  final List<BookVO> bookList;
  final Function(BookVO) onPressBookItem;
  const LibraryBookListLargeGridView({super.key, required this.bookList, required this.onPressBookItem});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(kMarginMedium3),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: kMarginMedium3,
          crossAxisSpacing: kMarginMedium2,
          mainAxisExtent: 330),
      itemBuilder: (context, index) {
        var book = bookList[index];
        return InkWell(
          onLongPress: (){
            onPressBookItem(book);
          },
          child: BookListItemForLargeGridView(
            book: book,
          ),
        );
      },
      itemCount: bookList.length,
    );
  }
}

/// Small Grid View
class LibraryBookListSmallGridView extends StatelessWidget {
  final List<BookVO> bookList;
  final Function(BookVO) onPressBookItem;
  const LibraryBookListSmallGridView({super.key, required this.bookList, required this.onPressBookItem});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: kMarginMedium3),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: kMarginMedium3,
          crossAxisSpacing: kMarginMedium2,
          mainAxisExtent: 200),
      itemBuilder: (context, index) {
        var book = bookList[index];
        return InkWell(
          onLongPress: (){
            onPressBookItem(book);
          },
          child: BookListItemForSmallGridView(
            book: book,
          ),
        );
      },
      itemCount: bookList.length,
    );
  }
}

/// List View
class LibraryBookListView extends StatelessWidget {
  final List<BookVO> bookList;
  final Function(BookVO) onPressBookItem;
  const LibraryBookListView({super.key, required this.bookList, required this.onPressBookItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: kMarginMedium3, ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var book = bookList[index];
        return InkWell(
          onLongPress: (){
            onPressBookItem(book);
          },
          child: Column(
            children: [

              SizedBox(
                height: kMarginMedium,
              ),

              BookListItemForListView(
                book: book,
                isForList: true,
              ),
              SizedBox(
                height: kMarginMedium,
              )
            ],
          ),
        );
      },
      itemCount: bookList.length,
    );
  }
}

/// Bottom Sheet
class BookSortingBottomSheet extends StatelessWidget {
  final BookSorting sorting;
  final ValueChanged<BookSorting?> onChangedSorting;
  const BookSortingBottomSheet({super.key, required this.sorting, required this.onChangedSorting});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMarginMedium3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sort by",
            style: TextStyle(
                color: Colors.white,
                fontSize: kTextRegular3x
            ),
          ),

          SizedBox(
            height: kMarginMedium,
          ),

          Divider(),

          SizedBox(
            height: kMarginMedium,
          ),

          RadioListTile<BookSorting>(
            title: Text(
              kRecentLabel,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: kPrimaryColor,
            value: BookSorting.Recent,
            groupValue: sorting,
            onChanged: onChangedSorting,
          ),

          RadioListTile(
            title: Text(
              kTitleLabel,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: kPrimaryColor,
            value: BookSorting.Title,
            groupValue: sorting,
            onChanged: onChangedSorting,
          ),

          RadioListTile(
            title: Text(
              kAuthorLabel,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            activeColor: kPrimaryColor,
            value: BookSorting.Author,
            groupValue: sorting,
            onChanged: onChangedSorting,
          ),

        ],
      ),
    );
  }
}

/// Book View Bottom Sheet
class BookViewBottomSheet extends StatelessWidget {
  final BookView viewSorting;
  final ValueChanged<BookView?> onChangedView;
  const BookViewBottomSheet(
      {super.key, required this.viewSorting, required this.onChangedView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMarginMedium3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "View as",
            style: TextStyle(color: Colors.white, fontSize: kTextRegular3x),
          ),
          SizedBox(
            height: kMarginMedium,
          ),
          Divider(),
          SizedBox(
            height: kMarginMedium,
          ),
          RadioListTile<BookView>(
            title: Text(
              kListLabel,
              style: TextStyle(color: Colors.white),
            ),
            activeColor: kPrimaryColor,
            value: BookView.List,
            groupValue: viewSorting,
            onChanged: onChangedView,
          ),
          RadioListTile<BookView>(
            title: Text(
              kLargeGridLabel,
              style: TextStyle(color: Colors.white),
            ),
            activeColor: kPrimaryColor,
            value: BookView.LargeGrid,
            groupValue: viewSorting,
            onChanged: onChangedView,
          ),
          RadioListTile<BookView>(
            title: Text(
              kSmallGridLabel,
              style: TextStyle(color: Colors.white),
            ),
            activeColor: kPrimaryColor,
            value: BookView.SmallGrid,
            groupValue: viewSorting,
            onChanged: onChangedView,
          ),
        ],
      ),
    );
  }
}

/// Book Item Bottom Sheet
class BookItemOptionBottomSheet extends StatelessWidget {
  final BookVO book;
  final Function(BookVO) onTapOption;
  const BookItemOptionBottomSheet({super.key, required this.book, required this.onTapOption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(kMarginMedium3),
          child: BookListItemForListView(book: book, isForList: false,),
        ),

        Divider(
          color: Colors.grey,
          height: 0.2,
        ),

        /// Remove download
        ListTile(
          leading: Icon(Icons.remove_circle_outline,),
          title: Text(
            "Remove download",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),


        /// Delete from your library
        ListTile(
          leading: Icon(Icons.delete,),
          title: Text(
            "Delete from your library",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          onTap: (){
            onTapOption(book);
          },
        ),


        /// Add to shelves...
        ListTile(
          leading: Icon(Icons.add,),
          title: Text(
            "Add to shelves...",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),


        /// Remove from shelves...
        Visibility(
          child: ListTile(
            leading: Icon(Icons.delete,),
            title: Text(
              "Remove from shelves...",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),


        /// Mark as read
        ListTile(
          leading: Icon(Icons.check,),
          title: Text(
            "Mark as read",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),

        SizedBox(
          height: kMarginMedium,
        ),
      ],
    );
  }
}



