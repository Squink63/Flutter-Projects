
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/cinema_vo.dart';
import '../data/vos/movie_vo.dart';
import '../data/vos/payment_vo.dart';
import '../data/vos/seat_vo.dart';
import '../data/vos/snack_vo.dart';
import '../data/vos/timeslot_vo.dart';

class PaymentPage extends StatefulWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  const PaymentPage({super.key, this.movie, required this.seatCount, required this.seatPrice, this.timeslot, required this.bookingDate, this.cinema, required this.selectedSeatList, required this.selectedSnackList});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  List<PaymentVO> paymentsToShow = [];
  String? token;

  @override
  void initState() {
    super.initState();

    token = _model.getUserInfoFromDatabase()?.token;

    _model.getPayments("$kParamBearer $token").then((payments) {
      setState(() {
        paymentsToShow = payments;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: const InkWell(
          child: Icon(Icons.keyboard_arrow_left,
            size: kMarginLarge,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text("Payment",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular22,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kMargin22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kMarginMedium2,
                ),
                /// Name TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMargin18),
                  child: TextField(
                    autofocus: true,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      labelStyle: const TextStyle(
                        color: kPrimaryColor
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kMarginMedium),
                        borderSide: const BorderSide(color: Colors.red)
                      ),
                      hintText: "Enter your name",
                      hintStyle: const TextStyle(
                        color: kNowPlayingAndComingSoonUnselectedTextColor,
                        fontSize: kTextSmall,
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginXLarge,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMargin18),
                  child: Image.asset(kUnlockOfferButton),
                ),

                /// Spacer
                const SizedBox(
                  height: kMargin34,
                ),

                const Text("Choose your payment type",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kTextRegular18,
                    fontWeight: FontWeight.w700
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: kMarginMedium3,
                ),

                SizedBox(
                  height: 450,
                  child: PaymentListView(
                      paymentList: paymentsToShow,
                      movie: widget.movie,
                      seatCount: widget.seatCount,
                      seatPrice: widget.seatPrice,
                      bookingDate: widget.bookingDate,
                      timeslot: widget.timeslot,
                      cinema: widget.cinema,
                      selectedSeatList: widget.selectedSeatList,
                    selectedSnackList: widget.selectedSnackList,
                  ),
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}

/// Payment List View

List<String> paymentIconList = [kUpiIcon, kGiftIcon, kQuickPayIcon, kCreditCardIcon, kRedeemPointIcon, kMobileWallet, kNetBankingIcon,];

class PaymentListView extends StatelessWidget {
  final List<PaymentVO> paymentList;
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  const PaymentListView({super.key, required this.paymentList, this.movie, required this.seatCount, required this.seatPrice, this.timeslot, required this.bookingDate, this.cinema, required this.selectedSeatList, required this.selectedSnackList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
          paymentList.length,
          (index) {
            PaymentVO payment = paymentList[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketConfirmationPage(
                      movie: movie,
                      seatCount: seatCount,
                      seatPrice: seatPrice,
                      bookingDate: bookingDate,
                      timeslot: timeslot,
                      cinema: cinema,
                      selectedSeatList: selectedSeatList,
                      selectedSnackList: selectedSnackList,
                      payment: payment,
                    )));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: kMargin10,vertical: kMargin10),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0.5,
                            color: Colors.white.withOpacity(0.3)
                        )],
                        borderRadius: BorderRadius.circular(kMarginMedium)
                      ),
                      child: Row(
                        children: [
                          Image.asset(paymentIconList[index],
                            width: kMargin30,
                            height: kMargin30,
                          ),
                          const SizedBox(
                            width: kMargin10,
                          ),
                          Text(payment.title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: kMargin30,
                          )
                        ],
                      )
                  ),
                ),

                const SizedBox(
                  height: kMargin10,
                )
              ],
            );
          }),
    );
  }
}

