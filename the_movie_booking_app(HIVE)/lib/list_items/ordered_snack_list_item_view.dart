import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/vos/snack_vo.dart';

class OrderedSnackListItemView extends StatelessWidget {
  final SnackVO selectedSnack;
  final Function(SnackVO) onTapRemoveSnackButton;
  const OrderedSnackListItemView({super.key, required this.selectedSnack, required this.onTapRemoveSnackButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Spacer
        SizedBox(
          width: kMargin10,
        ),
        GestureDetector(
          onTap: (){
            onTapRemoveSnackButton(selectedSnack);
          },
          child: Image.asset(
            kCancelFoodIcon,
            width: kMarginMedium3,
            height: kMarginMedium3,
          ),
        ),
        /// Spacer
        SizedBox(
          width: kMargin10,
        ),
        Text(
          "${selectedSnack.name} (Qt. ${selectedSnack.quantity})",
          style: TextStyle(
              color: kSecondaryTextColor, fontWeight: FontWeight.w700),
        ),
        Spacer(),
        Text(
          "${selectedSnack.price! * selectedSnack.quantity}Ks",
          style: TextStyle(
              color: kSecondaryTextColor, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
