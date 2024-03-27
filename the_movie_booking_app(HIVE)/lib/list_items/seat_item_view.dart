import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/vos/seat_vo.dart';

class SeatItemView extends StatelessWidget {
  final SeatVO seat;
  final Function(SeatVO) onTapSeat;
  const SeatItemView({super.key, required this.seat, required this.onTapSeat,});



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: seat.type == "taken",
          child: Image.asset(
            kChairTakenIcon,
            width: kMargin30,
            height: kMargin30,
            color: null,
          ),
        ),

        Visibility(
          visible: seat.type == "available",
          child: GestureDetector(
            onTap: (){
              onTapSeat(seat);
            },
            child: Image.asset(
              kChairTakenIcon,
              width: kMargin30,
              height: kMargin30,
              color: seat.isSelected ? kPrimaryColor : Colors.white,
            ),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Visibility(
            visible: seat.type == "text",
            child: Text(
              seat.symbol ?? "",
              style: const TextStyle(
                  fontSize: kTextSmall,
                  color: kNowPlayingAndComingSoonUnselectedTextColor),
            ),
          ),
        )
      ],
    );
  }
}
