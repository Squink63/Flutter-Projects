
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';

class ReviewListItemView extends StatelessWidget {
  const ReviewListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://assets.weforum.org/article/image/0ZUBmNNVLRCfn3NdU55nQ00UF64m2ObtcDS0grx02fA.jpg",
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
        ),

        SizedBox(width: kMarginMedium3,),

        NameRatingAndCommentView()
      ],
    );
  }
}

/// NameRatingAndCommentView
class NameRatingAndCommentView extends StatelessWidget {
  const NameRatingAndCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "aschenbachpellegri",
          style: TextStyle(
            color: Colors.white
          ),
        ),

        Row(
          children: [
            FivePointedStar(
              size: Size(kMarginMedium2, kMarginMedium2),
              defaultSelectedCount: 5,
              selectedColor: kPrimaryColor,
            ),
            SizedBox(width: kMarginMedium2,),
            Text("30/03/2023",
              style: TextStyle(
                color: kSecondaryTextColor
              ),
            )
          ],
        ),

        SizedBox(
          height: kMargin10,
        ),

        Text(
          "Good",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ],
    );
  }
}

