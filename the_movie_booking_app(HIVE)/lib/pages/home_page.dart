import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_movie_booking_app/data/models/movie_booking_model.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/list_items/movie_list_item_view.dart';
import 'package:the_movie_booking_app/pages/movie_detail_page.dart';
import 'package:the_movie_booking_app/pages/search_movies_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../data/vos/banner_vo.dart';
import '../data/vos/movie_vo.dart';

class HomePage extends StatefulWidget {
  final int index;
  HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();
  String selectedText = kNowShowingLabel;
  CityVO? city;

  @override
  void initState() {
    super.initState();
    List<CityVO> citiesFromDatabase = _model.getCitiesFromDatabase();
    setState(() {
      city = citiesFromDatabase[widget.index];
    });


  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kBackgroundColor,
        title: Row(
          children: [
            SizedBox(
              width: kMarginMedium2,
            ),
            Icon(
              Icons.near_me,
              color: Colors.white,
              size: kMarginLarge,
            ),
            SizedBox(
              width: kMarginMedium,
            ),
            Text(city?.name ?? "",
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular2x
            ),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchMoviesPage(selectedText: selectedText,)));
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: kMarginLarge,
            ),
          ),
          SizedBox(
            width: kMarginLarge,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: kMarginLarge,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Image.asset(kScanIcon,
            width: kMarginLarge,
            height: kMarginLarge,
          ),
          SizedBox(
            width: kHomeScreenAppBarRightMargin,
          )
        ],
      ),
      body: HomeScreenBodyView()
    );
  }
}

/// Home Screen Body View
class HomeScreenBodyView extends StatefulWidget {
  const HomeScreenBodyView({super.key});

  @override
  State<HomeScreenBodyView> createState() => _HomeScreenBodyViewState();
}

class _HomeScreenBodyViewState extends State<HomeScreenBodyView> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Now Showing or Coming Soon
  String selectedText = kNowShowingLabel;

  /// Now Playing Movies
  List<MovieVO> nowPlayingMovies = [];

  /// Coming Soon Movies
  List<MovieVO> comingSoonMovies = [];

  /// Movies to Show
  List<MovieVO> moviesToShow = [];

  /// Banners to Show
  List<BannerVO> bannersToShow = [];

  String? token = "";

  @override
  void initState() {
    super.initState();

    /// Now Playing Movies from Database
    List<MovieVO> nowPlayingMoviesFromDatabase = _model.getNowPlayingMoviesFromDatabase();
    setState(() {
      nowPlayingMovies = nowPlayingMoviesFromDatabase;
      moviesToShow = nowPlayingMoviesFromDatabase;
    });

    /// Coming Soon Movies from Database
    List<MovieVO> comingSoonMoviesFromDatabase = _model.getComingSoonMoviesFromDatabase();
    setState(() {
      comingSoonMovies = comingSoonMoviesFromDatabase;
      moviesToShow = comingSoonMoviesFromDatabase;
    });

    /// Now Playing Movies from Network
    _model.getNowPlayingMovies().then((nowPlayingMovies) {
      setState(() {
        this.nowPlayingMovies = nowPlayingMovies;
        moviesToShow = nowPlayingMovies;
      });
    }).catchError((error){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(error.toString()),
          ));
    });

    /// Coming Soon Movies from Network
    _model.getComingSoonMovies().then((comingSoonMovies) {
      this.comingSoonMovies = comingSoonMovies;
    });

    _model.getBanners().then((banners) {
      setState(() {
        bannersToShow = banners;
      });
    });

    token = _model.getUserInfoFromDatabase()?.token ?? "";

  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        /// Banner
        SliverToBoxAdapter(
          child: BannerSectionView(bannerList: bannersToShow,),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,
          ),
        ),

        /// Now Playing and Coming Soon Tab bar
        SliverToBoxAdapter(
          child: NowShowingAndComingSoonTabBar(
            selectedText: selectedText,
            onTapNowShowingOrComingSoon: (text) {

              setState(() {
                /// Set Now Playing or Coming Soon
                selectedText = text;

                /// Set Movies
                if (text == kNowShowingLabel) {
                  moviesToShow = nowPlayingMovies;
                } else {
                  moviesToShow = comingSoonMovies;
                }
              });
            },

          ),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,
          ),
        ),

        /// Movie List GridView
        (moviesToShow.isEmpty)
        ? const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          )
        )
        : SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index)
              {return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetailPage(isNowShowing: selectedText == kNowShowingLabel,
                        movieId: moviesToShow[index].id?.toString() ?? "",)));
                },
                child: MovieListItemView(
                  isComingSoonSelected: selectedText == kComingSoonLabel,
                  movie: moviesToShow[index],)
              );
              },
                childCount: moviesToShow.length
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: kMovieListItemHeight,
                mainAxisSpacing: kMarginMedium3,
                crossAxisSpacing: kMarginMedium3
              )
          ),
        )


      ],
    );
  }
}

/// Banner
class BannerSectionView extends StatelessWidget {
  final List<BannerVO> bannerList;
  BannerSectionView({super.key, required this.bannerList});

  final PageController _bannerPageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Banner Page View
        SizedBox(
          height: kBannerHeight,
          child: PageView.builder(
            controller: _bannerPageController,
              itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: kMarginMedium),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kMarginMedium),
                child: Image.asset(
                  kBannerImage,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: bannerList.length,
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium2,
        ),

        /// Dot Indicator
        SmoothPageIndicator(
          controller: _bannerPageController,
          count: bannerList.length,
          effect: const SlideEffect(
            dotColor: kInactiveDotsColor,
            activeDotColor: kPrimaryColor,
            dotWidth: kMarginMedium,
            dotHeight: kMarginMedium,
          ),
          onDotClicked: (index) {
            _bannerPageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          },
         )
      ],
    );
  }
}

/// Now Showing and Coming Soon Tab bar
class NowShowingAndComingSoonTabBar extends StatelessWidget {

  final String selectedText;
  final Function(String) onTapNowShowingOrComingSoon;
  const NowShowingAndComingSoonTabBar({super.key, required this.selectedText, required this.onTapNowShowingOrComingSoon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kNowPlayingAndComingSoonTabBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMargin5),
          gradient: const RadialGradient(
              colors: [kNowPlayingAndComingSoonGradientStartColor,
                kNowPlayingAndComingSoonGradientEndColor
              ],
              radius: 8.5,
              center: Alignment(0, -0.02)
          )
      ),

      child: Row(

        /// Now showing Button
        children: [
          Expanded(
              child: NowShowingOrComingSoonButtonView(
                label: kNowShowingLabel,
                isSelected: selectedText == kNowShowingLabel,
                onTapButton: (){
                  onTapNowShowingOrComingSoon(kNowShowingLabel);
                },
              )
          ),

          /// Coming Soon button
          Expanded(
              child: NowShowingOrComingSoonButtonView(
                label: kComingSoonLabel,
                isSelected: selectedText == kComingSoonLabel,
                onTapButton: (){
                  onTapNowShowingOrComingSoon(kComingSoonLabel);
                },
              )
          )
        ],
      ),
    );
  }

}


/// Now Showing or Coming Soon Button
class NowShowingOrComingSoonButtonView extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onTapButton;

  const NowShowingOrComingSoonButtonView( {super.key, required this.isSelected, required this.label, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTapButton();
      },
      child: Container(
        margin: const EdgeInsets.all(kMarginMedium),
        decoration: BoxDecoration(
          color: (isSelected) ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(kMarginSmall)
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (isSelected) ? kNowPlayingAndComingSoonSelectedTextColor : kNowPlayingAndComingSoonUnselectedTextColor,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}






