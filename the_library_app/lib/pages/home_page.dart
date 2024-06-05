import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library_app/blocs/home_bloc.dart';
import 'package:the_library_app/data/models/LibraryModel.dart';
import 'package:the_library_app/data/vos/category_list_vo.dart';
import 'package:the_library_app/list_items/book_list_item_view.dart';
import 'package:the_library_app/list_items/book_list_name_item_view.dart';
import 'package:the_library_app/list_items/carousel_book_list_item_view.dart';
import 'package:the_library_app/pages/book_details_page.dart';
import 'package:the_library_app/pages/books_by_category_page.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';
import '../data/vos/book_vo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                ),
              ),
              SliverToBoxAdapter(
                  child:
                      Visibility(
                          visible: recentBookList.isNotEmpty,
                          child: CarouselBookListView()
                      )
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: kMarginMedium3,
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  indicatorColor: kPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: kPrimaryColor,
                  dividerColor: kSecondaryTextColor,
                  dividerHeight: 0.5,
                  tabs: [
                    Tab(
                      text: "Ebooks",
                    ),
                    Tab(
                      text: "AudioBooks",
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: kMarginMedium2,
                ),
              ),
              Selector<HomeBloc, List<CategoryListVO>>(
                selector: (context, bloc) => bloc.categoryListsToShow,
                builder: (context, categoryListsToShow, child) {
                  return (categoryListsToShow.isEmpty)
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      : SliverPadding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kMarginMedium3),
                          sliver: SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              var list = categoryListsToShow[index];
                              return BookListView(
                                category: list,
                                bookLists: list.books ?? [],
                              );
                            }, childCount: categoryListsToShow.length),
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookListView extends StatelessWidget {
  final CategoryListVO category;
  final List<BookVO> bookLists;
  const BookListView(
      {super.key, required this.category, required this.bookLists});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BooksByCategoryPage(category: category)));
          },
          child: BookListNameItemView(
            category: category,
          ),
        ),
        SizedBox(
          height: kMarginMedium2,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var book = bookLists[index];
              return Row(
                children: [
                  GestureDetector(
                    child: BookListItemView(
                      book: book,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookDetailsPage(
                                bookDetails: book,
                              )));
                      recentBookList.add(book);
                    },
                  ),
                  SizedBox(
                    width: kMarginMedium2,
                  )
                ],
              );
            },
            itemCount: bookLists.length,
          ),
        )
      ],
    );
  }
}

class CarouselBookListView extends StatelessWidget {
  const CarouselBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: recentBookList
            .map((item) => CarouselBookListItemView(book: item))
            .toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: 1.4,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.45,
        ));
  }
}
