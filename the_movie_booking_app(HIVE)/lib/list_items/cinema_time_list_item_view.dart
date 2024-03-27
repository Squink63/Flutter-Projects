import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../data/vos/timeslot_vo.dart';

class CinemaTimeListItemView extends StatelessWidget {
  final TimeSlotVO timeslot;
  const CinemaTimeListItemView({super.key, required this.timeslot});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kMarginSmall),
      width: kCinemaTimeItemWidth,
      height: kCinemaTimeItemHeight,
      decoration: BoxDecoration(
        color: kAvailableTimeBackground,
        borderRadius: BorderRadius.circular(kMarginSmall),
        border: Border.all(
          color: kPrimaryColor
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(timeslot.startTime ?? "",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
          Text("3D",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              fontSize: kTextSmall
            ),
          ),
          Text("Screen 1",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),
          Text("21 Available",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}

