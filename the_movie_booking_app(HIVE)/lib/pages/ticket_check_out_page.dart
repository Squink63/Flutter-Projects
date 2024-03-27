import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/booking_data_vo.dart';
import 'package:the_movie_booking_app/data/vos/check_out_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';
import 'package:the_movie_booking_app/list_items/ordered_snack_list_item_view.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/pages/payment_page.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/cinema_vo.dart';
import '../data/vos/movie_vo.dart';
import '../data/vos/seat_vo.dart';
import '../data/vos/timeslot_vo.dart';

class TicketCheckOutPage extends StatelessWidget {
  final bool isCheckout;
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  const TicketCheckOutPage(
      {super.key,
      required this.isCheckout,
      this.movie,
      required this.seatCount,
      required this.seatPrice,
      this.timeslot,
      required this.bookingDate,
      this.cinema,
      required this.selectedSeatList,
      required this.selectedSnackList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.chevron_left)),
        centerTitle: true,
        title: Text(
          isCheckout ? "Checkout" : "Ticket Details",
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular2x),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kMargin22),
        child: Column(
          children: [
            /// Ticket Receipt View
            TicketReceiptView(
              isCheckout: isCheckout,
              movie: movie,
              seatCount: seatCount,
              seatPrice: seatPrice,
              timeslot: timeslot,
              bookingDate: bookingDate,
              cinema: cinema,
              selectedSeatList: selectedSeatList,
              selectedSnackList: selectedSnackList,
            ),

            /// Spacer
            const SizedBox(
              height: 36,
            ),

            /// Button View
            ButtonView(
              isCheckout: isCheckout,
              movie: movie,
              seatCount: seatCount,
              seatPrice: seatPrice,
              bookingDate: bookingDate,
              timeslot: timeslot,
              cinema: cinema,
              selectedSeatList: selectedSeatList,
              selectedSnackList: selectedSnackList,
            ),

            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}

/// Booking Button View
class ButtonView extends StatelessWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  const ButtonView({
    super.key,
    required this.isCheckout,
    this.movie,
    required this.seatCount,
    required this.seatPrice,
    this.timeslot,
    required this.bookingDate,
    this.cinema,
    required this.selectedSeatList,
    required this.selectedSnackList,
  });

  final bool isCheckout;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Refund
        Visibility(
          visible: !isCheckout,
          child: const Column(
            children: [
              Text(
                "Refund Amount",
                style: TextStyle(color: Colors.white, fontSize: kTextRegular2x),
              ),
              SizedBox(
                height: kMargin6,
              ),
              Text(
                "15000Ks",
                style: TextStyle(
                    color: kTicketCancelPolicyColor,
                    fontSize: kTextRegular3x,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),

        Visibility(visible: !isCheckout, child: const Spacer()),

        Visibility(
          visible: isCheckout,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
        ),

        /// Button View
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: kBookingButtonHeight,
          child: InkWell(
            onTap: () {
              isCheckout
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentPage(
                            movie: movie,
                            seatCount: seatCount,
                            seatPrice: seatPrice,
                            bookingDate: bookingDate,
                            timeslot: timeslot,
                            cinema: cinema,
                            selectedSeatList: selectedSeatList,
                            selectedSnackList: selectedSnackList,
                          )))
                  : Navigator.of(context).pop();
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    kBookingButtonEnd,
                    color: isCheckout ? null : kTicketCancelPolicyColor,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    kBookingButtonEnd,
                    color: isCheckout ? null : kTicketCancelPolicyColor,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: kBookingButtonHeight,
                    decoration: BoxDecoration(
                      color:
                          isCheckout ? kPrimaryColor : kTicketCancelPolicyColor,
                    ),
                    child: Center(
                      child: Text(
                        isCheckout ? "Continue" : "Cancel Booking",
                        style: TextStyle(
                            color: isCheckout ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Ticket Receipt View
class TicketReceiptView extends StatefulWidget {
  final bool isCheckout;
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  const TicketReceiptView({
    super.key,
    required this.isCheckout,
    required this.seatCount,
    required this.seatPrice,
    this.movie,
    this.timeslot,
    required this.bookingDate,
    this.cinema,
    required this.selectedSeatList,
    required this.selectedSnackList,
  });

  @override
  State<TicketReceiptView> createState() => _TicketReceiptViewState();
}

class _TicketReceiptViewState extends State<TicketReceiptView> {
  double rotateIconAngle = 0.0;
  bool isVisible = true;

  List<String?> getSeatTypes() {
    return widget.selectedSeatList.map((seat) => seat.seatName).toList();
  }

  int getSnackTotalPrice() {
    return widget.selectedSnackList
        .map((snack) => snack.price! * snack.quantity)
        .toList()
        .reduce((first, second) => first + second);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kMarginMedium3),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginMedium),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kTicketReceiptGradientStartColor,
                kTicketReceiptGradientCenterColor,
                kTicketReceiptGradientStartColor
              ],
              stops: [
                0.0,
                0.46,
                1.0
              ])),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Movie Name and Type
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: MovieNameAndTypeView(
                movie: widget.movie,
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMargin10,
            ),

            /// Cinema Name and Screen View
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: RichText(
                  text: TextSpan(children: [
                /// Cinema Name
                TextSpan(
                    text: widget.cinema?.cinema ?? "",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w400)),

                /// Screen
                TextSpan(
                    text: "(SCREEN 2)",
                    style: TextStyle(
                        color: kSecondaryTextColor,
                        fontWeight: FontWeight.w400)),
              ])),
            ),

            /// Spacer
            const SizedBox(
              height: kMargin30,
            ),

            /// Date, Time and Place View
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: DateTimeAndPlaceView(
                timeslot: widget.timeslot,
                bookingDate: widget.bookingDate,
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium3,
            ),

            /// M-Ticket Count
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: MTicketView(
                seatCount: widget.seatCount,
                seatPrice: widget.seatPrice,
                selectedSeatList: widget.selectedSeatList,
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMargin10,
            ),

            /// Ticket type and Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: Row(
                children: [
                  /// Ticket Type
                  Text(
                    getSeatTypes().join(", "),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),

                  /// Price
                  Text(
                    "${widget.seatPrice}Ks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium2,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: Divider(
                color: kSecondaryTextColor,
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium3,
            ),

            /// Food,Beverage and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: Row(
                children: [
                  ///Food,Beverage
                  Image.asset(
                    kFoodIcon,
                    color: Colors.white,
                    width: kMargin22,
                    height: kMarginMedium3,
                  ),

                  /// Spacer
                  const SizedBox(
                    width: kMargin6,
                  ),
                  const Text(
                    "Food and Beverage",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700),
                  ),

                  /// Spacer
                  const SizedBox(
                    width: kMargin6,
                  ),

                  Transform.rotate(
                    angle: rotateIconAngle,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          rotateIconAngle += 180 * pi / 180;
                          isVisible = !isVisible;
                        });
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const Spacer(),

                  ///Snack Total Price
                  Text(
                    "${getSnackTotalPrice()}Ks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMarginLarge,
            ),

            ///Food,Beverage And Price List View
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: Visibility(
                visible: isVisible,
                child: FoodBeverageAndPriceListView(
                  selectedSnackList: widget.selectedSnackList,
                  onTapRemoveSnackButton: (selectedSnack) {
                    setState(() {
                      widget.selectedSnackList.remove(selectedSnack);
                    });
                  },
                ),
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMargin18,
            ),

            /// Section View
            const SectionView(),

            /// Spacer
            const SizedBox(
              height: kMargin18,
            ),

            /// Convenience Fee View
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: ConvenienceFeeView(),
            ),

            /// Spacer
            const SizedBox(
              height: kMarginMedium3,
            ),

            /// Ticket Cancellation Policy Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              child:
                  TicketCancellationPolicyButton(isCheckout: widget.isCheckout),
            ),

            /// Spacer
            const SizedBox(
              height: kMargin30,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: Divider(
                color: kSecondaryTextColor,
              ),
            ),

            /// Spacer
            const SizedBox(
              height: kMargin30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              child: TotalCostView(totalSeatPrice: widget.seatPrice, totalSnackPrice: getSnackTotalPrice(),),
            )
          ],
        ),
      ]),
    );
  }
}

/// M Ticket
class MTicketView extends StatelessWidget {
  final int seatCount;
  final int seatPrice;
  final List<SeatVO> selectedSeatList;
  const MTicketView({
    super.key,
    required this.seatCount,
    required this.seatPrice,
    required this.selectedSeatList,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "M-Ticket(",
            style: TextStyle(
                color: kSecondaryTextColor, fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: "$seatCount",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: ")",
            style: TextStyle(
                color: kSecondaryTextColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

/// Movie Name and Type View
class MovieNameAndTypeView extends StatelessWidget {
  final MovieVO? movie;
  const MovieNameAndTypeView({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      /// Name
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Text(movie?.title ?? "",
          overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontSize: kTextRegular18,
                fontWeight: FontWeight.w700)),
      ),

      /// Type
      Text("(3D) (U/A)",
          style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w400)),
    ]);
  }
}

/// Convenience Fee View
class ConvenienceFeeView extends StatelessWidget {
  const ConvenienceFeeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Convenience Fee",
          style: TextStyle(color: Colors.white, fontSize: kTextRegular2x),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          size: kMarginMedium3,
          color: Colors.white,
        ),
        Spacer(),
        Text(
          "500Ks",
          style: TextStyle(color: Colors.white, fontSize: kTextRegular2x),
        )
      ],
    );
  }
}

/// Date, Time and Place View
class DateTimeAndPlaceView extends StatelessWidget {
  final TimeSlotVO? timeslot;
  final String bookingDate;
  const DateTimeAndPlaceView(
      {super.key, this.timeslot, required this.bookingDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Date
        DateTimeAndPlaceItemView(icon: kDateIcon, data: bookingDate),

        /// Time
        DateTimeAndPlaceItemView(
            icon: kTimeIcon, data: timeslot?.startTime ?? ""),

        /// Place
        DateTimeAndPlaceItemView(
            icon: kPlaceIcon,
            data: "Q5H3+JPP,Corner\nof, Bogyoke Lann,\nYangon"),
      ],
    );
  }
}

/// Date, Time, Place Item View
class DateTimeAndPlaceItemView extends StatelessWidget {
  final String icon;
  final String data;
  const DateTimeAndPlaceItemView(
      {super.key, required this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        const SizedBox(
          height: kMargin10,
        ),
        Text(
          data,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

///Food,Beverage And Price List View
class FoodBeverageAndPriceListView extends StatelessWidget {
  final List<SnackVO> selectedSnackList;
  final Function(SnackVO) onTapRemoveSnackButton;
  const FoodBeverageAndPriceListView(
      {super.key,
      required this.selectedSnackList,
      required this.onTapRemoveSnackButton});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            OrderedSnackListItemView(
              selectedSnack: selectedSnackList[index],
              onTapRemoveSnackButton: (selectedSnack) {
                onTapRemoveSnackButton(selectedSnack);
              },
            ),
            SizedBox(
              height: kMarginMedium2,
            )
          ],
        );
      },
      itemCount: selectedSnackList.length,
    );
  }
}

/// Section View
class SectionView extends StatelessWidget {
  const SectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kMargin40,
      child: Stack(
        children: [
          Center(child: Image.asset(kDashLine)),
          Positioned(
              left: 0,
              child: Image.asset(
                kSectionLeft,
                height: kMargin40,
              )),
          Positioned(
              right: 0,
              child: Image.asset(
                kSectionRight,
                height: kMargin40,
              ))
        ],
      ),
    );
  }
}

/// Ticket Cancellation Policy Button
class TicketCancellationPolicyButton extends StatelessWidget {
  final bool isCheckout;
  const TicketCancellationPolicyButton({super.key, required this.isCheckout});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kTicketCancellationButtonWidth,
      height: kTicketCancellationButtonHeight,
      child: ElevatedButton(
        onPressed: () {
          showCancellationPolicyDialog(context);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: isCheckout
                ? kTicketCheckOutPolicyColor
                : kTicketCancelPolicyColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: const Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: kMarginMedium3,
            ),
            Text(
              "Ticket Cancelion policy",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

/// Total Cost View
class TotalCostView extends StatelessWidget {
  final int totalSeatPrice;
  final int totalSnackPrice;
  const TotalCostView({super.key, required this.totalSnackPrice, required this.totalSeatPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Total",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: kTextRegular18,
              fontWeight: FontWeight.w700),
        ),
        Spacer(),
        Text(
          "${totalSeatPrice + totalSnackPrice + 500}KS",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: kTextRegular18,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

/// Cancellation Policy Dialog
void showCancellationPolicyDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(kMargin22),
            decoration: BoxDecoration(
                color: kBackgroundColor,
                border: Border.all(
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(kMarginMedium)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ticket Cancellation Policy",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium2,
                ),

                Row(
                  children: [
                    Image.asset(
                      kFoodIcon,
                      width: kMarginLarge,
                      height: kMargin22,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: kMarginMedium,
                    ),
                    const Text(
                      "100% Refund on F&B",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium3,
                ),

                Row(
                  children: [
                    Image.asset(
                      kTicketIcon,
                      width: kMarginLarge,
                      height: kMargin22,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: kMarginMedium,
                    ),
                    const Text(
                      "Up to 75% Refund for Tickets",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium3,
                ),

                const Padding(
                  padding: EdgeInsets.only(left: kMarginMedium3),
                  child: Text(
                    "-75% refund until 2 hours before show  start time",
                    style: TextStyle(
                        color: kSecondaryTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium2,
                ),

                const Padding(
                  padding: EdgeInsets.only(left: kMarginMedium3),
                  child: Text(
                    "-50% refund between 2 hours and 20 minutes before show start time",
                    style: TextStyle(
                        color: kSecondaryTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: kMargin40,
                ),

                const Text(
                  "1. Refund not available for Convenience\n   fees,Vouchers, Gift Cards, Taxes etc.",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium2,
                ),

                const Text(
                  "2. No cancelation within 20minute of show\n  start time.",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),

                /// Spacer
                const SizedBox(
                  height: kMargin30,
                ),

                /// Close Button
                SizedBox(
                  width: double.infinity,
                  height: kMargin40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
