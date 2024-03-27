import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/booking_data_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/seating_vo.dart';
import 'package:the_movie_booking_app/data/vos/timeslot_vo.dart';
import 'package:the_movie_booking_app/list_items/seat_item_view.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/movie_vo.dart';
import '../data/vos/seat_vo.dart';
import '../utils/dimens.dart';

class ChooseSeatPage extends StatefulWidget {
  final MovieVO? movie;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;

  const ChooseSeatPage({
    super.key,
    this.movie,
    this.timeslot,
    required this.bookingDate,
    this.cinema,
  });

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  int count = 0;
  int price = 0;
  double _scale = 1.0;
  Offset _offset = Offset.zero;

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  String? token;

  /// Seating Plan To Show
  List<SeatVO>? seatsToShow;


  @override
  void initState() {
    super.initState();
    token = _model.getUserInfoFromDatabase()?.token;

    _model
        .getSeatingPlanByShowTime("${widget.timeslot?.cinemaDayTimeslotId}",
            widget.bookingDate, "$kParamBearer $token")
        .then((seatLists) {
      setState(() {
        seatsToShow = seatLists.flattened.toList();
      });
    }).catchError((error) {
      print(error);
    });
  }

  List<SeatVO> getSelectedSeats() {
    return seatsToShow?.where((seat) => seat.isSelected).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: kMarginXLarge,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          /// Seat View
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: kMarginMedium),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: SeatView(
                seatList: seatsToShow ?? [],
                onTapSeat: (selectedSeat) {
                  setState(() {
                    seatsToShow = seatsToShow?.map((iteratedSeat) {
                      if (iteratedSeat.seatName == selectedSeat.seatName) {
                        iteratedSeat.isSelected = true;
                      }
                      return iteratedSeat;
                    }).toList();

                    /// Total Seat count
                    count =
                        seatsToShow!.where((seat) => seat.isSelected).length;

                    ///  Total Seat Price
                    price = seatsToShow!
                        .where((seat) => seat.isSelected)
                        .map((seat) => seat.price)
                        .reduce((first, second) => first! + second!)!;
                  });
                },
                scale: _scale,
                offset: _offset,
                onPanUpdate: (details) {
                  setState(() {
                    if (_scale == 1) {
                      _offset = Offset.zero;
                    } else {
                      _offset += details.delta;
                    }
                  });
                },
              ),
            ),
          ),

          Container(color: kBackgroundColor, child: const TopScreenAndPriceView()),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: kMarginMedium2),
              color: kBackgroundColor,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/color_bar.png",
                    width: double.infinity,
                    height: 37,
                  ),

                  /// Spacer
                  const SizedBox(
                    height: kMargin10,
                  ),

                  /// Slider
                  SliderView(
                    value: _scale,
                    onChanged: (value) {
                      setState(() {
                        _scale = value;
                      });
                    },
                  ),

                  /// Spacer
                  const SizedBox(
                    height: kMarginMedium2,
                  ),

                  /// TicketCountAndBuyTicketButton
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kMarginMedium3),
                    height: kMargin60,
                    child: TicketCountAndBuyTicketButton(
                      movie: widget.movie,
                      count: count,
                      price: price,
                      bookingDate: widget.bookingDate,
                      timeslot: widget.timeslot,
                      cinema: widget.cinema,
                      selectedSeatList: getSelectedSeats(),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}

/// Seat View
class SeatView extends StatelessWidget {
  final List<SeatVO> seatList;
  final Function(SeatVO) onTapSeat;
  final double scale;
  final Offset offset;
  final GestureDragUpdateCallback onPanUpdate;
  const SeatView({
    super.key,
    required this.onTapSeat,
    required this.scale,
    required this.offset,
    required this.onPanUpdate,
    required this.seatList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: onPanUpdate,
      child: Transform.scale(
        scale: scale,
        child: Transform.translate(
          offset: offset,
          child: (seatList.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: kMarginMedium2),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 14,
                    mainAxisSpacing: kMarginLarge,
                  ),
                  itemBuilder: (context, index) {
                    SeatVO seat = seatList[index];
                    return SeatItemView(
                      seat: seat,
                      onTapSeat: (selectedSeat) {
                        onTapSeat(selectedSeat);
                      },
                    );
                  },
                  itemCount: seatList.length,
                ),
        ),
      ),
    );
  }
}

/// Slider
class SliderView extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  const SliderView({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: kMargin100,
        ),
        const Icon(
          Icons.remove,
          color: kSecondaryTextColor,
          size: kMarginMedium2,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: Colors.white,
            trackHeight: 1,
            trackShape: const RectangularSliderTrackShape(),
          ),
          child: Slider(
              value: value,
              min: 1.0,
              max: 2.0,
              activeColor: kSecondaryTextColor,
              inactiveColor: kSecondaryTextColor,
              onChanged: onChanged),
        ),
        const Icon(
          Icons.add,
          color: kSecondaryTextColor,
          size: kMarginMedium2,
        )
      ],
    );
  }
}



/// Ticket Count And Buy Ticket Button View
class TicketCountAndBuyTicketButton extends StatelessWidget {
  final MovieVO? movie;
  final int count;
  final int price;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  const TicketCountAndBuyTicketButton(
      {super.key,
      this.movie,
      required this.count,
      required this.price,
      this.timeslot,
      required this.bookingDate,
      this.cinema, required this.selectedSeatList});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TicketCount(
          count: count,
          price: price,
        ),
        const SizedBox(
          width: kMarginLarge,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SnackPage(
                      movie: movie,
                      seatCount: count,
                      seatPrice: price,
                      bookingDate: bookingDate,
                      timeslot: timeslot,
                      cinema: cinema,
                      selectedSeatList: selectedSeatList,
                    )));
          },
          child: Image.asset(
            "assets/images/buy_ticket_button.png",
            width: 250,
          ),
        )
      ],
    );
  }
}

class TicketCount extends StatelessWidget {
  final int count;
  final int price;
  const TicketCount({super.key, required this.count, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count > 1 ? "$count Tickets" : "$count Ticket",
          style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular18,
              fontWeight: FontWeight.w700),
        ),
        Text(
          "${price}KS",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: kTextRegular18,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

/// Screen View
class TopScreenAndPriceView extends StatelessWidget {
  const TopScreenAndPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          /// Screen View
          child: Image.asset(
            kCinemaScreenIcon,
            width: 370,
            height: 130,
          ),
        ),
        const Text(
          "Normal(4500Ks)",
          style:
              TextStyle(color: kSecondaryTextColor, fontSize: kTextRegular2x),
        ),
      ],
    );
  }
}
