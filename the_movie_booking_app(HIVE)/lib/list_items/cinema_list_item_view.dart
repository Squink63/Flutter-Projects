import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/timeslot_vo.dart';
import 'package:the_movie_booking_app/list_items/cinema_time_list_item_view.dart';
import 'package:the_movie_booking_app/pages/choose_seat_page.dart';
import 'package:the_movie_booking_app/pages/cinema_details_page.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/vos/cinema_vo.dart';
import '../data/vos/movie_vo.dart';

class CinemaListItemView extends StatefulWidget {
  final CinemaVO cinema;
  final List<TimeSlotVO> timeslotList;
  final MovieVO? movie;
  final String bookingDate;
  const CinemaListItemView({super.key, required this.cinema, required this.timeslotList, this.movie, required this.bookingDate,});

  @override
  State<CinemaListItemView> createState() => _CinemaListItemViewState();
}

class _CinemaListItemViewState extends State<CinemaListItemView> {

  bool isExpanded = false;

  void expandTimeList() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        expandTimeList();
      },
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: kMarginMedium2,
                ),
                Text(
                  widget.cinema.cinema ?? "",
                  style: TextStyle(color: Colors.white, fontSize: kTextRegular2x, fontWeight: FontWeight.w600),
                ),

                Spacer(),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CinemaDetailsPage()));
                  },
                  child: const Text(
                    "See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: kTextRegular2x,
                      decoration: TextDecoration.underline,
                      decorationColor: kPrimaryColor
                    ),
                  ),
                ),

                /// Spacer
                SizedBox(
                  width: kMarginMedium3,
                ),
              ],
            ),

            /// Spacer
            SizedBox(
              height: kMargin6,
            ),

            /// Parking,Food,Wheelchair
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginMedium3),
              child: ParkingFoodWheelChairView(),
            ),

            /// Cinema Time View
            Visibility(
              visible: isExpanded,
              child: CinemaTimeView(timeslotList: widget.timeslotList, movie: widget.movie, bookingDate: widget.bookingDate, cinema: widget.cinema,),
            ),

            /// Spacer
            SizedBox(
              height: kMarginMedium2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
              child: Visibility(
                visible: isExpanded,
                child: Row(
                  children: [
                  Image.asset(kInfoCircleIcon,
                  width: kMarginMedium2,
                  height: kMarginMedium2
                  ),

                  SizedBox(
                    width: kMarginMedium,
                  ),
                  Text("Long press on show timing to seat class!",
                        style: TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: kTextRegular
                        ),
                      ),
                  ],
                )
              ),
            ),

            Visibility(
              visible: isExpanded,
              child: SizedBox(
                height: kMarginMedium3,
              ),
            ),

            const Divider(
              color: Colors.white,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}

/// Parking,Food,Wheelchair
class ParkingFoodWheelChairView extends StatelessWidget {
  const ParkingFoodWheelChairView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Image.asset(kParkingIcon,
          width: kMarginMedium2,
          height: kMarginMedium2,
        ),

        /// Spacer
        SizedBox(
          width: kMargin6,
        ),

        const Text("Parking",
          style: TextStyle(
            color: kSecondaryTextColor
          ),
        ),

        ///Spacer
        const SizedBox(
          width: kMarginLarge,
        ),

        Image.asset(kFoodIcon,
          width: kMarginMedium2,
          height: kMarginMedium2,
        ),

        /// Spacer
        SizedBox(
          width: kMargin6,
        ),

        const Text("Food",
          style: TextStyle(
              color: kSecondaryTextColor
          ),
        ),

        ///Spacer
        const SizedBox(
          width: kMarginLarge,
        ),

        Image.asset(kWheelChairIcon,
          width: kMarginMedium2,
          height: kMarginMedium2,
        ),

        /// Spacer
        SizedBox(
          width: kMargin6,
        ),

        const Text("Wheel Chair",
          style: TextStyle(
              color: kSecondaryTextColor
          ),
        ),

      ],
    );
  }
}

/// Cinema Time View
class CinemaTimeView extends StatelessWidget {
  final List<TimeSlotVO> timeslotList;
  final MovieVO? movie;
  final String bookingDate;
  final CinemaVO? cinema;
  const CinemaTimeView({super.key, required this.timeslotList, this.movie, required this.bookingDate, this.cinema});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: kMarginMedium2, horizontal: kMarginMedium2),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: kMarginMedium3,
          crossAxisSpacing: kMarginMedium3
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onLongPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseSeatPage(movie: movie, timeslot: timeslotList[index], bookingDate: bookingDate, cinema: cinema,)));
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(bookingDate)));
              },
              child: CinemaTimeListItemView(timeslot: timeslotList[index],));
        }, itemCount: timeslotList.length,);
  }
}
