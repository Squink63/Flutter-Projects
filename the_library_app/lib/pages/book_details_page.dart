
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';

import '../list_items/review_list_item_view.dart';
import '../utils/strings.dart';

class BookDetailsPage extends StatelessWidget {
  final BookVO? bookDetails;
  const BookDetailsPage({super.key, this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Row(
          children: [
            SizedBox(width: 16,),
            InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
        leadingWidth: 40,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white
          ),
        ),

        centerTitle: false,
        actions: [
          Icon(
            Icons.ios_share_outlined,
            color: Colors.white,
          ),
          SizedBox(width: kMarginMedium2,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Book Image and Info View
            BookImageAndInfoView(book: bookDetails),

            Divider(
              thickness: 0.3,
              color: Colors.grey,
            ),

            /// Buttons View
            ButtonsView(),

            ListTile(
              leading: Icon(
                Icons.info_outline
              ),
              title: Text(
                kBookCanBEReadLabel,
                style: TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: kTextSmall
                ),
              ),
            ),

            Divider(
              thickness: 0.3,
              color: Colors.grey,
            ),

            /// About Ebook
            LabelView(label: kAboutEbookLabel),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: Text(
                bookDetails?.description ?? "",
                style: TextStyle(
                  color: kSecondaryTextColor,
                ),
              ),
            ),

            /// Rating and Reviews
            LabelView(label: kRatingLabel),

            RatingsView(),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.57,
              child: ListTile(
                trailing: Icon(
                    Icons.info_outline
                ),
                title: Text(
                  kAboutRatingAndPreview,
                  style: TextStyle(
                      color: kSecondaryTextColor,
                      fontSize: kTextSmall
                  ),
                ),
              ),
            ),

            ReviewList(),

            SizedBox(height: kMarginLarge,)
          ],
        ),
      ),
    );
  }
}

/// Book Image and Info View
class BookImageAndInfoView extends StatelessWidget {
  final BookVO? book;
  const BookImageAndInfoView({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMarginLarge),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kMarginSmall),
            child: Image.network(
              book?.bookImage ?? "",
              fit: BoxFit.fill,
              width: 120,
              height: 190,
            ),
          ),

          SizedBox(width: kMarginLarge,),

          BookInfoView(book: book),

        ],
      ),
    );
  }
}

/// Book Info View
class BookInfoView extends StatelessWidget {
  final BookVO? book;
  const BookInfoView({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title
          Text(
            book?.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular22,
              fontWeight: FontWeight.w600
            ),
          ),

          SizedBox(
            height: kMarginMedium,
          ),

          /// Author
          Text(
            book?.author ?? "",
            style: TextStyle(
              color: kSecondaryTextColor,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w500

            ),
          ),

          SizedBox(
            height: kMarginSmall,
          ),

          Text(
            "Ebook • 229 pages",
            style: TextStyle(
                color: kSecondaryTextColor,
                fontSize: kTextRegular2x,


            ),
          ),

        ],
      ),
    );
  }
}

/// Buttons View
class ButtonsView extends StatelessWidget {
  const ButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.37,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: kBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kMarginSmall),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 0.7
                  )
                )
              ),
              child: Text(
                "Read Sample",
                style: TextStyle(
                  color: kPrimaryColor
                ),
              ),
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton.icon(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kMarginSmall),

                  )
              ),
              icon: Icon(
                Icons.bookmark_add,
                color: Colors.black,
              ),
              label: Text(
                "Add to wishlist",
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

///Label View
class LabelView extends StatelessWidget {
  final String label;
  const LabelView({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginLarge, vertical: kMarginMedium2),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: kTextRegular3x,
              color: Colors.white
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}

/// Ratings
class RatingsView extends StatelessWidget {
  const RatingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          RateBookView(),
          RatingProgressView()

        ],
      ),
    );
  }
}

/// Rate Book View
class RateBookView extends StatefulWidget {
  const RateBookView({super.key});

  @override
  State<RateBookView> createState() => _RateBookViewState();
}

class _RateBookViewState extends State<RateBookView> {
  int myCount = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          myCount.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: kRatingCountTextSize,
            color: Colors.white
          ),
        ),

        FivePointedStar(
          onChange: (count) {
            setState(() {
              myCount = count;
            });
          },
          color: Colors.white24,
          selectedColor: kPrimaryColor,
        ),
        Text(
          "11 ratings",
          style: TextStyle(
            color: kSecondaryTextColor,
            fontSize: kTextXSmall
          ),
        )
      ],
    );
  }
}

/// Rating Progress View
class RatingProgressView extends StatelessWidget {
  const RatingProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PercentIndicatorView(leadingStar: '5', percent: 0.5,),
        SizedBox(
          height: kMarginSmall,
        ),
        PercentIndicatorView(leadingStar: '4', percent: 0.1),
        SizedBox(
          height: kMarginSmall,
        ),
        PercentIndicatorView(leadingStar: '3', percent: 0.2),
        SizedBox(
          height: kMarginSmall,
        ),
        PercentIndicatorView(leadingStar: '2', percent: 0.0),
        SizedBox(
          height: kMarginSmall,
        ),
        PercentIndicatorView(leadingStar: '1', percent: 0.4)
      ],
    );
  }
}

/// Percent Indicator View
class PercentIndicatorView extends StatelessWidget {
  final String leadingStar;
  final double percent;
  const PercentIndicatorView({super.key, required this.leadingStar, required this.percent});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width * 0.45,
      lineHeight: 10.0,
      barRadius: Radius.circular(5),
      percent: percent,
      leading: Text(
        leadingStar,
        style: TextStyle(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.white12,
      progressColor: kPrimaryColor,

    );
  }
}

/// Review List
class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(kMarginLarge),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Column(
          children: [
            ReviewListItemView(),

            SizedBox(height: kMarginMedium3,)
          ],
        );
      },
      itemCount: 5,
    );
  }
}











