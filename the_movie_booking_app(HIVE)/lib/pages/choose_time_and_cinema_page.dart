

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking_app/data/vos/choose_date_vo.dart';
import 'package:the_movie_booking_app/list_items/cinema_list_item_view.dart';
import 'package:the_movie_booking_app/list_items/date_card_item_view.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/pages/choose_seat_page.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/cinema_vo.dart';
import '../data/vos/movie_vo.dart';

class ChooseTimeAndCinemaPage extends StatelessWidget {
  final MovieVO? movie;
  const ChooseTimeAndCinemaPage({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kBackgroundColor,
        leading: const InkWell(
          child: Icon(
            Icons.chevron_left,
            size: kMarginXLarge,
            color: Colors.white,
          ),
        ),
        actions:[
          const Row(
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
              Text(
                "Yangon",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: kTextRegular2x),
              )
            ],
          ),
          const SizedBox(
            width: kMarginXLarge,
          ),
          const Icon(
            Icons.search,
            color: Colors.white,
            size: kMarginLarge,
          ),
          const SizedBox(
            width: kMarginMedium2,
          ),
          Image.asset(kFilterIcon,
            width: kMarginMedium3,
            height: kMarginMedium3,
          ),
          const SizedBox(
            width: kHomeScreenAppBarRightMargin,
          )
        ],
      ),
      body: ChooseTimeAndCinemaScreenBodyView(movie: movie),
    );
  }
}

class ChooseTimeAndCinemaScreenBodyView extends StatefulWidget {
  final MovieVO? movie;
  const ChooseTimeAndCinemaScreenBodyView({
    super.key, this.movie,
  });

  @override
  State<ChooseTimeAndCinemaScreenBodyView> createState() => _ChooseTimeAndCinemaScreenBodyViewState();
}

class _ChooseTimeAndCinemaScreenBodyViewState extends State<ChooseTimeAndCinemaScreenBodyView> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  String? token;

  /// Cinemas To Show
  List<CinemaVO> cinemasToShow = [];
  String date = "";

  int selectedIndex = 0;
  ChooseDateVO? bookingDate;


  @override
  void initState() {
    super.initState();

      token = _model.getUserInfoFromDatabase()?.token;
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat("yyyy-M-d").format(currentDate);

    getCinemasByDate(formattedDate);

  }

  void getCinemasByDate(String selectedDate) {
    _model.getCinemaAndShowTimeByDate(selectedDate, "$kParamBearer $token").then((cinemas) {
      setState(() {
        cinemasToShow = cinemas;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [

          /// Date Card
          SliverToBoxAdapter(
            child: SizedBox(
              height: kDateCardHeight,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  ChooseDateVO date = chooseDate[index];
                  date.isSelected = (selectedIndex == index);
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                        getCinemasByDate(date.date);
                      });
                    },
                    child: DateCardItemView(
                      date: date, ),
                  );
                },itemCount: chooseDate.length,),
            ),
          ),

          /// Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kMargin30,
            ),
          ),

          ///Movie Type
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( "$kParamBearer $token" ?? "")));
                print("$kParamBearer $token");
              },
                child: MovieTypeItemView()),
          ),

          /// Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kMargin30,
            ),
          ),

          /// Available Check
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              height: kAvailableLineHeight,
              color: kMovieDetailCensorRatingGradientStartColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\u25CF  Available",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: kTextRegular2x,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  Text("\u25CF  Filling Fast",
                    style: TextStyle(
                        color: kFillingFastColor,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w500
                    ),
                  ),

                  Text("\u25CF  Almost Full",
                    style: TextStyle(
                        color: kAlmostFullColor,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ),

          /// Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kMargin30,
            ),
          ),

          ///Cinema List View
          (cinemasToShow.isEmpty)
          ? const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
          )
          : SliverPadding(
            padding: const EdgeInsets.all(kMarginMedium),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  bookingDate = chooseDate[selectedIndex];
                  return CinemaListItemView(cinema: cinemasToShow[index], timeslotList: cinemasToShow[index].timeslots ?? [], movie: widget.movie, bookingDate: bookingDate?.date ?? "",);
                },childCount: cinemasToShow.length)),
          )

        ]
    );
  }
}


/// Movie Type List
class MovieTypeItemView extends StatelessWidget {
  MovieTypeItemView({super.key});
  final List<String> typeList = ["2D", "3D", "3D IMAX", "3D DBOX"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: typeList
      .map((type) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: kMarginSmall),
        decoration: BoxDecoration(
            color: kNowPlayingAndComingSoonGradientEndColor,
            borderRadius: BorderRadius.circular(kMarginSmall),
            border: Border.all(
                color: Colors.white
            )
        ),
        child: Text(
          type,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular2x
          ),
        ),
      ))
      .toList(),
    );
  }
}

// /// Cinema List View
// class CinemaListView extends StatelessWidget {
//   const CinemaListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (context, index){
//       return const CinemaListItemView(cinema: , timeslotList: [],);
//     },
//       itemCount: 5,
//     );
//   }
// }



