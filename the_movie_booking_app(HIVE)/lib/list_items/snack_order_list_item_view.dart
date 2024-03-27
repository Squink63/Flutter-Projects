import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/vos/snack_vo.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';

class SnackOrderListItemView extends StatelessWidget {
  final SnackVO selectedSnack;
  final Function(SnackVO) onTapAddQuantity;
  final Function(SnackVO) onTapReduceQuantity;
  const SnackOrderListItemView({super.key, required this.selectedSnack, required this.onTapAddQuantity, required this.onTapReduceQuantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(selectedSnack.name ?? "",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
        ),

        SizedBox(width: 55,),

        AddOrRemoveQuantityListView(
          selectedSnack: selectedSnack,
          onTapAddQuantity: (selectedSnack ) {
            onTapAddQuantity(selectedSnack);
          },
          onTapReduceQuantity: (selectedSnack ) {
            onTapReduceQuantity(selectedSnack);
        },),

        Spacer(),

        Text("${selectedSnack.price! * selectedSnack.quantity}KS",
          style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w700
          ),
        ),
      ],
    );
  }
}

/// Add or Remove Quantity List Item View
class AddOrRemoveQuantityListView extends StatelessWidget {
  final SnackVO selectedSnack;
  final Function(SnackVO) onTapAddQuantity;
  final Function(SnackVO) onTapReduceQuantity;
  const AddOrRemoveQuantityListView({
    super.key, required this.selectedSnack, required this.onTapAddQuantity, required this.onTapReduceQuantity,
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
            onTap: (){
              onTapAddQuantity(selectedSnack);
            },
            child: Container(
              width: kMargin22,
              height: kMargin22,
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
          Text(selectedSnack.quantity.toString(),
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600
            ),
          ),

          /// Remove
          GestureDetector(
            onTap: (){
              onTapReduceQuantity(selectedSnack);
            },
            child: Container(
              width: kMargin22,
              height: kMargin22,
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
