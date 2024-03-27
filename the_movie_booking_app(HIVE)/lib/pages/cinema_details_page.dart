import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/cinema_list_item_view.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

class CinemaDetailsPage extends StatelessWidget {
  const CinemaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Icon(
          Icons.chevron_left,
          size: kMargin30,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "Cinema Details",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular22),
        ),
        actions: [
          Image.asset(
            kStarIcon,
            width: kMargin22,
            height: kMargin22,
          ),
          SizedBox(
            width: kMarginMedium2,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(kCinemaBannerImage,
              ),

              /// Spacer
              SizedBox(
                height: kMarginLarge,
              ),

              /// Cinema Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                child: Text(
                  "JCGV Junction City",
                  style: TextStyle(color: Colors.white, fontSize: kTextRegular2x, fontWeight: FontWeight.w600),
                ),
              ),

              /// Spacer
              SizedBox(
                height: kMarginMedium2,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                child: CinemaLocationAndIconView(),
              ),

              /// Spacer
              SizedBox(
                height: kMargin40,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                child: Text(
                  "Facilities",
                  style: TextStyle(color: Colors.white, fontSize: kTextRegular2x, fontWeight: FontWeight.w600),
                ),
              ),

              /// Spacer
              SizedBox(
                height: kMargin40,
              ),
              /// Facilities List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                child: FacilitiesListView(),
              ),

              /// Spacer
              SizedBox(
                height: kMargin40,
              ),

              /// Safety
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                child: Text(
                  "Safety",
                  style: TextStyle(color: Colors.white, fontSize: kTextRegular2x, fontWeight: FontWeight.w600),
                ),
              ),

              /// Spacer
              SizedBox(
                height: kMargin40,
              ),

              /// Safety List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMargin22),
                child: SafetyView()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CinemaLocationAndIconView extends StatelessWidget {
  const CinemaLocationAndIconView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Q5H3+JPP,Corner of, Bogyoke\nLann,Yangon",
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2x,
            fontWeight: FontWeight.w600,
          ),
        ),

        Spacer(),

        Icon(Icons.near_me,
          size: kMargin30,
          color: kPrimaryColor,
        )
      ],
    );
  }
}

/// Facilities
class FacilitiesListView extends StatelessWidget {
  const FacilitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kMarginMedium2,
      spacing: kMarginMedium2,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                kParkingIcon,
                color: kPrimaryColor,
                width: kMarginMedium2,
                height: kMarginMedium2
            ),
            SizedBox(
              width: kMarginMedium,
            ),
            Text("Parking",
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                kFoodIcon,
                color: kPrimaryColor,
                width: kMarginMedium2,
                height: kMarginMedium2
            ),
            SizedBox(
              width: kMarginMedium,
            ),
            Text("Online Food",
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                kWheelChairIcon,
                color: kPrimaryColor,
                width: kMarginMedium2,
                height: kMarginMedium2
            ),
            SizedBox(
              width: kMarginMedium,
            ),
            Text("Wheel Chair",
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                kTicketCancellationICon,
                color: kPrimaryColor,
                width: kMarginMedium2,
                height: kMarginMedium2
            ),
            SizedBox(
              width: kMarginMedium,
            ),
            Text("Ticket Cancellation",
              style: TextStyle(
                  color: kPrimaryColor
              ),
            ),
          ],
        ),

      ],
    );
  }
}

/// Safety
class SafetyView extends StatelessWidget {
  SafetyView({super.key});

  final List<String> safetyList = ["Thermal Scanning","Contactless Security Check", "Santization Before Every Show", "Disposable 3D glass", "Contactless Food Service", "Package Food", "Deep Cleaning of rest room"];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: kMargin5,
      runSpacing: kMargin10,
      children: safetyList.map((safety) => Container(
        padding: EdgeInsets.symmetric(horizontal: kMargin10, vertical: kMargin2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginSmall),
          color: kPrimaryColor
        ),
          child: Text(
            safety,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
          ),
      )
      ).toList(),
    );
  }
}


