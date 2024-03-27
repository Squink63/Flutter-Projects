import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class SnackListItemView extends StatelessWidget {
  final SnackVO snack;
  final Function(SnackVO) onTapAddButton;
  final Function(SnackVO) onTapAddQuantity;
  final Function(SnackVO) onTapReduceQuantity;
  const SnackListItemView({super.key, required this.snack, required this.onTapAddButton, required this.onTapAddQuantity, required this.onTapReduceQuantity,});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: kMarginCardMedium2, horizontal: kMargin10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginMedium),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kNowPlayingAndComingSoonGradientEndColor,
                kNowPlayingAndComingSoonGradientStartColor
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Snack Icon
          Center(
            child: Image.network(
              snack.image ?? "",
              width: kSnackIconSize,
              height: kSnackIconSize,
            ),
          ),

          /// Spacer
          SizedBox(
            height: kMarginMedium3,
          ),

          /// Snack name and Price
          Text(
            snack.name ?? "",
            style: TextStyle(
                color: Colors.white,
                fontSize: kTextSmall,
                fontWeight: FontWeight.w600),
          ),

          /// Spacer
          SizedBox(
            height: kMargin5,
          ),

          Text(
            "${snack.price.toString()}KS" ?? "",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: kTextSmall,
                fontWeight: FontWeight.w600),
          ),

          /// Spacer
          SizedBox(
            height: kMargin10,
          ),

          /// Add Button
          Center(
              child: Stack(
                children: [
                  /// Add or Remove Quantity View
                  Align(
                    alignment: Alignment.centerRight,
                    child: AddOrRemoveQuantityView(
                      addedSnack: snack,
                      onTapAddQuantity: (addedSnack){onTapAddQuantity(addedSnack);},
                      onTapReduceQuantity: (addedSnack){onTapReduceQuantity(addedSnack);}),
                  ),

                  /// Add Button View
                  AddButtonView(
                    isVisible: snack.quantity == 0,
                    tapAddButton: (){
                      onTapAddButton(snack);
                    },)
                ],
              ))
        ],
      ),
    );
  }
}

/// Add Button View
class AddButtonView extends StatelessWidget {
  final bool isVisible;
  final Function tapAddButton;
  const AddButtonView({super.key, required this.isVisible, required this.tapAddButton});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        width: double.infinity,
        height: kAddButtonHeight,
        child: ElevatedButton(
          onPressed: () {
            tapAddButton();
          },
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          child: Text(
            kAddLabel,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

/// Add or Remove Quantity View
class AddOrRemoveQuantityView extends StatelessWidget {
  final SnackVO addedSnack;
  final Function(SnackVO) onTapAddQuantity;
  final Function(SnackVO) onTapReduceQuantity;
  const AddOrRemoveQuantityView({
    super.key, required this.onTapAddQuantity, required this.onTapReduceQuantity, required this.addedSnack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// Add
          GestureDetector(
            onTap:() {onTapAddQuantity(addedSnack);},
            child: Container(
              width: kMarginLarge,
              height: kMarginLarge,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.add,
                size: kMarginMedium2,
              ),
            ),
          ),

          /// Amount
          Text(addedSnack.quantity.toString(),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: kTextRegular2x,
            fontWeight: FontWeight.w600
          ),
          ),

          /// Remove
          GestureDetector(
            onTap:() {onTapReduceQuantity(addedSnack);},
            child: Container(
              width: kMarginLarge,
              height: kMarginLarge,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.remove,
                size: kMarginMedium2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


