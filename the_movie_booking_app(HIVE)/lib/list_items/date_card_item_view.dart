import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking_app/data/vos/choose_date_vo.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/fonts.dart';

import '../utils/dimens.dart';
import '../utils/images.dart';

class DateCardItemView extends StatelessWidget {
  final ChooseDateVO date;
  const DateCardItemView({super.key, required this.date,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          Image.asset(
            kDateCardIcon,
            width: kDateCardWidth,
            height: kDateCardHeight,
            color: date.isSelected == true  ? kPrimaryColor : null,
          ),

          Positioned(
            top: kMargin5,
            right: kMarginLarge,
            child: Image.asset(kDateCardRectangle,
              width: kMargin22,
              height: 7,
            ),
          ),
          Positioned(
            right: kMarginMedium3,
            top: kMarginMedium2,
            child: SizedBox(
              width: 40,
              height: kDateCardHeight,
              child: Text(convertDateFormatForView(date.date),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: kTextRegular2x,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ]),
        const SizedBox(
          width: kMarginMedium3,
        )
      ],
    );
  }
}
