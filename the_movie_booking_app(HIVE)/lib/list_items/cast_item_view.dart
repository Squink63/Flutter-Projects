import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

class CastItemView extends StatelessWidget {
  final CreditVO? credit;
  const CastItemView({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: credit?.getCastProfileImage() ?? "",
            errorWidget:(_, __, ___) =>
                Image.network(
               "https://i.pinimg.com/736x/c0/74/9b/c0749b7cc401421662ae901ec8f9f660.jpg",
            ),
            width: kMargin60,
            height: kMargin60,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(
          width: kMarginMedium2,
        )
      ],
    );
  }
}

