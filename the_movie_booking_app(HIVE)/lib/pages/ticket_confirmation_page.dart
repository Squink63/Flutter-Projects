import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/payment_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_vo.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/pages/ticket_check_out_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/booking_data_vo.dart';
import '../data/vos/check_out_vo.dart';
import '../data/vos/cinema_vo.dart';
import '../data/vos/movie_vo.dart';
import '../data/vos/seat_vo.dart';
import '../data/vos/timeslot_vo.dart';
import '../networks/api_constants.dart';
import '../utils/dimens.dart';

class TicketConfirmationPage extends StatefulWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  final PaymentVO payment;
  const TicketConfirmationPage({super.key, this.movie, required this.seatCount, required this.seatPrice, this.timeslot, required this.bookingDate, this.cinema, required this.selectedSeatList, required this.selectedSnackList, required this.payment});

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();
  String? token;
  CheckOutVO? checkOutDetailsToShow;

  List<String?> getSeatTypes() {
    return widget.selectedSeatList.map((seat) => seat.seatName)
        .toList();
  }

  Widget? bookedTicket;


  @override
  void initState() {
    super.initState();
    BookingDataVO bookingData = BookingDataVO(cinemaDayTimeslotId: widget.timeslot?.cinemaDayTimeslotId,seatNumber: getSeatTypes().first,bookingDate:  widget.bookingDate,movieId: widget.movie?.id,paymentTypeId: widget.payment.id,snacks: widget.selectedSnackList);

    token = _model.getUserInfoFromDatabase()?.token;
    _model.getCheckOut("$kParamBearer $token", bookingData).then((checkOutDetails) {
      setState(() {
        checkOutDetailsToShow = checkOutDetails;
      });
    }).catchError((error) {
      print(error);
    });

    bookedTicket = TicketItemView(movie: widget.movie, seatCount: widget.seatCount, seatPrice: widget.seatPrice,cinema: widget.cinema, selectedSeatName: getSeatTypes(),timeslot: widget.timeslot, bookingDate: widget.bookingDate,);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          "Ticket Information",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular3x),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
            children: [
          SingleChildScrollView(
            child: Column(
              children: [

                /// Spacer
                const SizedBox(
                  height: 30,
                ),

                /// Ticket View
                Padding(
                  padding: EdgeInsets.all(kMarginMedium3),
                  child: bookedTicket
                ),

                /// Spacer
                const SizedBox(
                  height: 75,
                ),

                /// QR Code
                Image.network(
                  checkOutDetailsToShow?.getQrCodeWithBaseUrl() ?? "",
                  width: kQrCodeSize,
                  height: kQrCodeSize,
                ),
                const SizedBox(
                  height: kMarginMedium3,
                ),

                /// Code Id
                const Text(
                  "WAG5LP1C",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular3x,
                      fontWeight: FontWeight.w700),
                ),

                RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "TPIN : ",
                          style: TextStyle(
                            color: kNowPlayingAndComingSoonUnselectedTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: kTextRegular3x
                          )
                        ),

                        TextSpan(
                            text: "WKCSL96",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: kTextRegular3x
                            )
                        )
                      ]
                    )
                ),

                /// Spacer
                const SizedBox(
                  height: 80,
                ),

                /// Done Button
                SizedBox(
                  width: 176,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        myTicketsList.add(bookedTicket!);
                      });
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MainPage(index: 1,)),
                          (route) => false);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    child: const Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: kTextRegular3x,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                /// Spacer
                const SizedBox(
                  height: kMargin60,
                ),
              ],
            ),
          ),
          const ScreenOverlayImageView()
        ]),
      ),
    );
  }
}

/// Ticket Item View
class TicketItemView extends StatelessWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final CinemaVO? cinema;
  final List<String?> selectedSeatName;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  const TicketItemView({super.key, required this.seatCount, required this.seatPrice, this.movie, this.cinema, required this.selectedSeatName, this.timeslot, required this.bookingDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMarginMedium),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kTicketReceiptGradientStartColor,
                Colors.transparent,
                kTicketReceiptGradientStartColor
              ],
              stops: [
                0.0,
                0.5,
                1.0
              ]
          )
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(kMarginMedium2),
            child: MovieImageAndTicketInfoView(movie: movie, seatCount: seatCount, seatPrice: seatPrice,cinema: cinema, selectedSeatName: [],),
          ),


          /// Section View
          SectionView1(),

          /// Spacer
          SizedBox(
            height: kMargin15,
          ),

          /// Date, Time and Place View
          DateTimeAndPlaceView(bookingDate: bookingDate, timeslot: timeslot,),

          /// Spacer
          SizedBox(
            height: kMargin34,
          ),
        ],
      ),
    );
  }
}

/// Movie Image and Ticket Info View
class MovieImageAndTicketInfoView extends StatelessWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final CinemaVO? cinema;
  final List<String?> selectedSeatName;
  const MovieImageAndTicketInfoView({super.key, required this.seatCount, required this.seatPrice, this.movie, this.cinema, required this.selectedSeatName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Movie Image
        ClipRRect(
          borderRadius: BorderRadius.circular(kMarginSmall),
          child: Image.network(movie?.getPosterPathWithBaseUrl() ?? "",
            width: 96,
            height: 120,
            fit: BoxFit.cover,
          ),

        ),

        /// Spacer
        const SizedBox(
          width: kMarginMedium3,
        ),

        /// Ticket Info
        TicketInfoView(movie: movie, seatCount: seatCount,seatPrice: seatPrice,cinema: cinema, selectedSeatName: [],)
      ],
    );
  }
}

/// Ticket Info View
class TicketInfoView extends StatelessWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final CinemaVO? cinema;
  final List<String?> selectedSeatName;
  const TicketInfoView({super.key, required this.seatCount, required this.seatPrice, this.movie, this.cinema, required this.selectedSeatName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Movie Title
        MovieNameAndTypeView(movie: movie,),

        /// Spacer
        const SizedBox(
          height: kMargin10,
        ),

        /// Cinema
        Text(cinema?.cinema ?? "",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: kTextRegular2x,
                fontWeight: FontWeight.w400
            )
        ),

        /// Spacer
        const SizedBox(
          height: kMarginMedium2,
        ),

        /// MTicket
         MTicketView(seatCount: seatCount, seatPrice: seatPrice, selectedSeatList: [],),

        /// Spacer
        const SizedBox(
          height: kMargin10,
        ),

        /// Ticket Type
        RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: selectedSeatName.join(", "),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2x,
                      fontWeight: FontWeight.w700
                  ),
              ),

              /// Screen
              TextSpan(
                  text: "(SCREEN 2)",
                  style: TextStyle(
                      color: kSecondaryTextColor, fontWeight: FontWeight.w400)),
            ])),

      ],
    );
  }
}

/// Section View
class SectionView1 extends StatelessWidget {
  const SectionView1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMargin30,
      width: double.infinity,
      child: Stack(
        children: [

          Align(
            alignment: Alignment.center,
            child: Image.asset(kDashLine,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),

          Image.asset(kSectionLeft,
            width: kMargin15,
            height: kMargin30,
          ),

          Positioned(
            right: -6,
            child: Image.asset(kSectionRight,
              width: 27,
              height: kMargin30,
            ),
          ),

        ],
      ),
    );
  }
}


/// Screen Overlay View
class ScreenOverlayImageView extends StatefulWidget {
  const ScreenOverlayImageView({super.key});

  @override
  State<ScreenOverlayImageView> createState() => _ScreenOverlayImageViewState();
}

class _ScreenOverlayImageViewState extends State<ScreenOverlayImageView> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isVisible = false;
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: const EdgeInsets.only(bottom: kMargin100),
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.9),
        child: Image.asset(
          kSuccessfulImage,
          width: 388,
          height: 364,
        ),
      ),
    );
  }
}

List<Widget> myTicketsList = [];
