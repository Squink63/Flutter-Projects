import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';
import '../list_items/cast_item_view.dart';

class MovieDetailPage extends StatefulWidget {

   final bool isNowShowing;
   /// Will Receive from Previous Screen
   final String? movieId;

   const MovieDetailPage({super.key, required this.isNowShowing, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  @override
  void initState() {
    super.initState();

    /// Get Movie Details from Database
    MovieVO? movieDetailsFromDatabase = _model.getMovieByIdFromDatabase(int.parse(widget.movieId ?? "0"));
    setState(() {
      movieDetails = movieDetailsFromDatabase;
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(widget.movieId ?? "").then((movie) {
      setState(() {
        movieDetails = movie;
      });
    });

    _model.getCreditsByMovies(widget.movieId ?? "").then((credits) {
      setState(() {
        creditList = credits;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            /// Body
             SingleChildScrollView(
              child: Column(
                children: [
                  /// Movie Large Image, Small Image and Info
                  MovieLargeImageSmallImageAndInfoView(movie: movieDetails,),

                  /// Spacer
                  const SizedBox(
                    height: kMargin30,
                  ),

                  /// Censor Rating, Release Date and Duration
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
                    child: CensorRatingReleaseDateAndDurationView(movie: movieDetails,),
                  ),

                  /// Spacer
                  const SizedBox(
                    height: kMargin30,
                  ),

                  /// Releasing Date View
                  Visibility(
                    visible: !widget.isNowShowing,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                      child: ReleasingDateView(),
                    ),
                  ),

                  const SizedBox(
                    height: kMargin30,
                  ),

                  /// Story Line View
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
                    child: StoryLineView(movie: movieDetails,),
                  ),

                  const SizedBox(
                    height: kMargin30,
                  ),

                  /// Cast View
                  Visibility(
                    visible: !(creditList?.isEmpty ?? true),
                      child: CastView(
                        creditList: creditList ?? [],)
                  ),

                  const SizedBox(
                    height: 148,
                  ),
                ],
              ),
            ),

            /// App Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium, vertical: kMarginMedium),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: kMargin34,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: kMarginLarge,
                  ),
                ],
              ),
            ),

            /// Bottom Gradient and Booking Button
            Visibility(
              visible: widget.isNowShowing,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: kMovieDetailsBottomContainerHeight,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, kBackgroundColor
                      ]
                    )
                  ),
                  child: Center(
                    child: BookingButton(movie: movieDetails,),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Booking Button
class BookingButton extends StatelessWidget {
  final MovieVO? movie;
  const BookingButton({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: kBookingButtonHeight,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseTimeAndCinemaPage(movie: movie,)));
        },
        child: Stack(
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(kBookingButtonEnd),
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.47,
                height: kBookingButtonHeight,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: const Center(
                  child: Text(
                    kBookingLabel,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(kBookingButtonEnd),
            ),

          ],
        ),
      ),
    );
  }
}


/// Cast View
class CastView extends StatelessWidget {
  final List<CreditVO> creditList;
  const CastView({super.key, required this.creditList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Cast Label
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
          child: Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular
            ),
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium3,
        ),

        SizedBox(
          height: kMargin60,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return CastItemView(credit: creditList[index]);
              },
          itemCount: creditList.length,),
        )
      ],
    );
  }
}

/// Story Line View
class StoryLineView extends StatelessWidget {
  final MovieVO? movie;
  const StoryLineView({
    super.key, required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie?.overview ?? "",
          style: const TextStyle(
              color: Colors.white,
              fontSize: kTextRegular,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),
        const Text(
          "In 1999, the Janjira nuclear plant was mysteriously destroyed with most hands lost including supervisor Joe Brody's colleague and wife, Sandra. Years later, Joe's son, Ford, a US Navy ordnance disposal officer, must go to Japan to help his estranged father who obsessively searches for the truth of the incident. In doing so, father and son discover the disaster's secret cause on the wreck's very grounds. This enables them to witness the reawakening of a terrible threat to all of Humanity, which is made all the worse with a second secret revival elsewhere.",
          style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

/// Censor Rating, Release Date and Duration
class CensorRatingReleaseDateAndDurationView extends StatelessWidget {
  final MovieVO? movie;
  const CensorRatingReleaseDateAndDurationView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CensorRatingReleaseDateAndDurationItemView(
          label: "Censor Rating",
          value: "U/A",
        ),
        CensorRatingReleaseDateAndDurationItemView(
          label: "Release Date",
          value: movie?.getReleaseDateFormatted() ?? "",
        ),
        CensorRatingReleaseDateAndDurationItemView(
          label: "Duration",
          value: movie?.getRunTimeFormatted() ?? "",
        ),
      ],
    );
  }
}

/// Releasing Date View
class ReleasingDateView extends StatelessWidget {
  const ReleasingDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kMarginCardMedium2, vertical: kMarginMedium3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMarginMedium),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [kNowPlayingAndComingSoonGradientEndColor, kNowPlayingAndComingSoonSelectedTextColor]
        )
      ),
      child: Row(
        children: [
          /// Releasing Texts and Notification Button
          const ReleasingTextAndNotificationButton(),

          Expanded(
            child: Image.asset(kReleaseIcon,
            alignment: Alignment.centerRight,
            width: 100,
            height: 110,),
          )
        ],
      ),
    );
  }
}

/// Releasing Texts and Notification Button
class ReleasingTextAndNotificationButton extends StatelessWidget {
  const ReleasingTextAndNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Releasing in 5 days",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2x,
            fontWeight: FontWeight.w600
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium,
        ),

        const Text("Get notify as soon as movie\nbooking opens up in your city!",
          style: TextStyle(
              color: kSecondaryTextColor,
              fontSize: kTextSmall,
              fontWeight: FontWeight.w600
          ),
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium,
        ),

        /// Set Notification Button
        Image.asset(kSetNotificationButton,
          width: MediaQuery.of(context).size.width * 0.4,
        )

      ],
    );
  }
}



class CensorRatingReleaseDateAndDurationItemView extends StatelessWidget {
  final String label;
  final String value;

  const CensorRatingReleaseDateAndDurationItemView(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginCardMedium2),
          gradient: const LinearGradient(colors: [
            kMovieDetailCensorRatingGradientStartColor,
            kMovieDetailCensorRatingGradientEndColor
          ])),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: kTextSmall),
          ),
          const SizedBox(
            height: kMarginMedium,
          ),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: kTextRegular),
          )
        ],
      ),
    );
  }
}

/// Movie Large Image, Small Image and Info
class MovieLargeImageSmallImageAndInfoView extends StatelessWidget {
  final MovieVO? movie;
  const MovieLargeImageSmallImageAndInfoView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMovieDetailTopSectionHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Large Image and Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Large Image
              CachedNetworkImage(
                imageUrl: movie?.getBackdropPathWithBaseUrl() ?? "",
                errorWidget:(_, __, ___) => Image.network(
                  "https://critics.io/img/movies/poster-placeholder.png",
                  color: kBackgroundColor,
                ),
                width: double.infinity,
                height: kMovieDetailTopImageHeight,
                fit: BoxFit.cover,
              ),

              const SizedBox(
                height: kMarginMedium2,
              ),

              /// Movie Info
              MovieInfoAndGenresView(movie: movie,),
            ],
          ),

          /// Small image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kMarginMedium2, bottom: kMarginMedium2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kMarginSmall),
                child: CachedNetworkImage(
                  imageUrl: movie?.getPosterPathWithBaseUrl() ?? "",
                  errorWidget:(_, __, ___) => Image.network(
                    "https://critics.io/img/movies/poster-placeholder.png",
                    color: kBackgroundColor,
                  ),
                  width: kMovieDetailSmallImageWidth,
                  height: kMovieDetailSmallImageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// Movie Info and Genres
class MovieInfoAndGenresView extends StatelessWidget {
  final MovieVO? movie;
  MovieInfoAndGenresView({super.key, required this.movie});

  final List<String> genreList = ["Action", "Adventure", "Drama", "Animation"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child: Padding(
        padding: const EdgeInsets.only(left: kMarginMedium2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Movie Name And Rating
            MovieNameAndRatingView(movie: movie,),

            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Types
            const Text(
              "2D, 3D, 3D IMAX, 3D DBOX",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: kTextRegular),
            ),

            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Genres
            Wrap(
                spacing: kMarginMedium,
                runSpacing: kMarginMedium,
                children: movie?.genres
                    ?.take(5)
                    .map((genre) => genre.name ?? "")
                    .map((genre) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium,
                              vertical: kMarginSmall),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.circular(kMarginCardMedium2)),
                          child: Text(
                            genre,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: kTextSmall,
                            ),
                          ),
                        ))
                    .toList() ??
                []
            )

          ],
        ),
      ),
    );
  }
}

/// Movie Name And Rating
class MovieNameAndRatingView extends StatelessWidget {
  final MovieVO? movie;
  const MovieNameAndRatingView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Movie Name
        Expanded(
          child: Text(
            movie?.title ?? "",
            maxLines: 2,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: kTextRegular18),
          ),
        ),

        const SizedBox(
          width: kMarginMedium,
        ),

        Image.asset(
          kImdbImage,
          width: kIMDBWidth,
          height: kIMDBHeight,
        ),

        Text(
          movie?.getRatingTwoDecimal() ?? "",
          style: const TextStyle(
              color: Colors.white,
              fontSize: kTextRegular2x,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),

        const SizedBox(
          width: kMarginCardMedium2,
        ),
      ],
    );
  }
}
