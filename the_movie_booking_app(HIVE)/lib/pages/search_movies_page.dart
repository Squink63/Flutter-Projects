import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/pages/movie_detail_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';
import '../list_items/movie_list_item_view.dart';

class SearchMoviesPage extends StatelessWidget {
  final String selectedText;
  const SearchMoviesPage({super.key, required this.selectedText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMargin22,vertical: kMarginMedium3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// App Bar with Search View
                const AppBarWithSearchView(),

                /// Spacer
                const SizedBox(
                  height: kMarginLarge,
                ),
                /// Search Type View
                SearchTypeView(selectedText: selectedText,),

                /// Search Movie Grid View
                SizedBox(
                  height: 1000,
                  child: SearchMovieGridView(selectedText: selectedText,))

              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Search Type View
class SearchTypeView extends StatelessWidget {
  final String selectedText;
  const SearchTypeView({
    super.key, required this.selectedText,
  });

  @override
  Widget build(BuildContext context) {
    /// Genres, Format, Month
    return Wrap(
      spacing: kMarginMedium2,
      runSpacing: kMarginMedium,
      children: [
        Container(
          width: kMargin100,
          padding: const EdgeInsets.symmetric(horizontal: kMargin10, vertical: kMargin5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kMargin10)
          ),
          child: const Row(
            children: [
              Text("Genres"),
              SizedBox(
                width: kMarginMedium,
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
        Container(
          width: kMargin100,
          padding: const EdgeInsets.symmetric(horizontal: kMargin10, vertical: kMargin5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kMargin10)
          ),
          child: const Row(
            children: [
              Text("Format"),
              SizedBox(
                width: kMarginMedium,
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
        Visibility(
          visible: selectedText == kComingSoonLabel,
          child: Container(
            width: kMargin100,
            padding: const EdgeInsets.symmetric(horizontal: kMargin10, vertical: kMargin5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kMargin10)
            ),
            child: const Row(
              children: [
                Text("Month"),
                SizedBox(
                  width: kMarginMedium,
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        )
      ],
    );
  }
}

/// App Bar Search View
class AppBarWithSearchView extends StatelessWidget {
  const AppBarWithSearchView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left,
            color: Colors.white,
            size: kMargin40,
          ),
        ),

        const Icon(Icons.search,
          color: Colors.white,
          size: kMargin30,
        ),

        /// Spacer
        const SizedBox(
          width: kMarginMedium,
        ),

        const SizedBox(
          width: 200,
          height: 30,
          child: TextField(
            textInputAction: TextInputAction.search,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: kSecondaryTextColor
              ),
              hintText: "search the movie",
              border: InputBorder.none
            ),
          ),
        ),

        const Spacer(),

        Image.asset(kFilterIcon,
          color: kPrimaryColor,
          width: kMarginMedium3,
          height: kMarginMedium3,
        )
      ],
    );
  }
}

/// Search Movie Grid View
class SearchMovieGridView extends StatelessWidget {
  final String selectedText;
  const SearchMovieGridView({super.key, required this.selectedText});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: kMargin30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: kMovieListItemHeight,
            mainAxisSpacing: kMarginMedium3,
            crossAxisSpacing: kMarginMedium3
        ),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailPage(isNowShowing: selectedText == kNowShowingLabel, movieId: '',)));
            },
            child: Container()
            // MovieListItemView(
            //   isComingSoonSelected: selectedText == kComingSoonLabel, movie: MovieVO,),
          );
        },
      itemCount: 2,
    );
  }
}



