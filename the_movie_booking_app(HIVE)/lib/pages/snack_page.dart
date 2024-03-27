import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/booking_data_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/list_items/snack_list_item_view.dart';
import 'package:the_movie_booking_app/list_items/snack_order_list_item_view.dart';
import 'package:the_movie_booking_app/networks/api_constants.dart';
import 'package:the_movie_booking_app/pages/payment_page.dart';
import 'package:the_movie_booking_app/pages/ticket_check_out_page.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/cinema_vo.dart';
import '../data/vos/movie_vo.dart';
import '../data/vos/seat_vo.dart';
import '../data/vos/snack_vo.dart';
import '../data/vos/timeslot_vo.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';

class SnackPage extends StatefulWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  const SnackPage({super.key, this.movie, required this.seatCount, required this.seatPrice, this.timeslot, required this.bookingDate, this.cinema, required this.selectedSeatList,});

  @override
  State<SnackPage> createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();
  String? token;
  List<SnackCategoryVO> snackCategoriesToShow = [];
  List<SnackVO> snacksToShow = [];
  List<String> snacksCa = ["All", "Combo", "Beverage", "Pop Corn", "Snack"];

  @override
  void initState() {
    super.initState();

    token = _model.getUserInfoFromDatabase()?.token;

    _model.getSnackCategory("$kParamBearer $token").then((snackCategories) {
      setState(() {
        snackCategoriesToShow = snackCategories;
      });
    }).catchError((error) {
      print(error);
    });

    getSnacks("");

  }

  int totalPrice = 0;
  bool isClicked = true;

  /// Get Snacks from network
   void getSnacks(String categoryId) {
    _model.getSnacks(categoryId, "$kParamBearer $token").then((snacks) {
    setState(() {
      snacksToShow = snacks;
    });
  }).catchError((error) {
      print(error);
    });
  }

  List<SnackVO> getSelectedSnackList() {
     return snacksToShow.where((snack) => snack.quantity > 0).toList();
  }

  List<int> getTotalSnackPriceList() {
    return getSelectedSnackList()
        .map((snack) => snack.price! * snack.quantity)
        .toList();
  }

  void getTotalSnackPrice() {
    if (getTotalSnackPriceList().isEmpty) {
      totalPrice = 0;
    } else {
      totalPrice = getTotalSnackPriceList().reduce((first, second) => first + second);
    }
  }

  void reduceSnackQuantity(SnackVO addedSnack) {
    if (addedSnack.quantity > 0){
      snacksToShow = snacksToShow.map((snack) {
        if (snack.id == addedSnack.id) {
          snack.quantity--;
        }
        return snack;
      }).toList();

    }
  }

  void addSnackQuantity(SnackVO addedSnack) {
    snacksToShow = snacksToShow.map((snack) {
      if (snack.id == addedSnack.id) {
        snack.quantity++;
      }
      return snack;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: snacksCa.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: kBackgroundColor,
          leading: const InkWell(
            child: Icon(
              Icons.chevron_left,
              size: kMarginXLarge,
              color: Colors.white,
            ),
          ),
          title: const Text("Grab a bite!",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular22,
              fontWeight: FontWeight.w700
            ),
          ),
          actions: [
            Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: kMarginLarge,
                ),
                const SizedBox(
                  width: kMarginLarge,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketCheckOutPage(
                        isCheckout: true,
                        movie: widget.movie,
                        seatCount: widget.seatCount,
                        seatPrice: widget.seatPrice,
                        bookingDate: widget.bookingDate,
                        timeslot: widget.timeslot,
                        cinema: widget.cinema,
                        selectedSeatList: widget.selectedSeatList,
                        selectedSnackList: getSelectedSnackList(),
                    )));
                  },
                  child: const Text(
                    "SKIP",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular3x,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(
                  width: kHomeScreenAppBarRightMargin,
                ),
              ],
            ),
          ],
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: kMarginLarge),
            indicatorColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: kTextRegular2x
            ),
            isScrollable: true,
            tabs: snacksCa.map((category) => Tab(
              child: Text(category),
            )).toList(),
            onTap: (index){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${getTotalSnackPriceList()}")));
            },
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(kMarginMedium3),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kMargin30,
                        crossAxisSpacing: kMargin30,
                        mainAxisExtent: kSnackItemHeight
                      ),
                      itemBuilder: (context, index){
                        return SnackListItemView(
                          snack: snacksToShow[index],

                          /// Add Button
                          onTapAddButton: (tappedSnack) {
                            setState(() {
                              snacksToShow = snacksToShow.map((snack) {
                                if (snack.id == tappedSnack.id) {
                                  snack.quantity = 1;
                                }
                                return snack;
                              }).toList();
                              getTotalSnackPrice();
                            });
                          },

                          /// Add Quantity
                          onTapAddQuantity: (addedSnack){
                            setState(() {
                              addSnackQuantity(addedSnack);
                              getTotalSnackPrice();
                            });

                          },

                          /// Reduce Quantity
                          onTapReduceQuantity: (addedSnack){
                            setState(() {
                              reduceSnackQuantity(addedSnack);
                              getTotalSnackPrice();
                            });

                          },
                        );
                      },
                    itemCount: snacksToShow.length,
                      ),
                            ),
                  SizedBox(height: 150,)
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
                child: ChosenSnackListBottomSheetView(
                  movie: widget.movie,
                  seatCount: widget.seatCount,
                  seatPrice: widget.seatPrice,
                  bookingDate: widget.bookingDate,
                  timeslot: widget.timeslot,
                  cinema: widget.cinema,
                  selectedSeatList: widget.selectedSeatList,
                  selectedSnackList: getSelectedSnackList(),
                  totalSnackPrice: totalPrice,
                  onTapArrowButton: (){
                    setState(() {
                      isClicked = !isClicked;
                    });
                  }, isClicked: isClicked,
                  onTapAddQuantity: (selectedSnack ) {
                    setState(() {
                      addSnackQuantity(selectedSnack);
                      getTotalSnackPrice();
                    });
                  },
                  onTapReduceQuantity: (selectedSnack ) {
                    setState(() {
                      reduceSnackQuantity(selectedSnack);
                      getTotalSnackPrice();
                    });
                },
                ))

          ]
        ),
      ),
    );
  }


}

/// Chosen Snacks List BottomSheet View
class ChosenSnackListBottomSheetView extends StatelessWidget {
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  final int totalSnackPrice;
  final Function onTapArrowButton;
  final bool isClicked;
  final Function(SnackVO) onTapAddQuantity;
  final Function(SnackVO) onTapReduceQuantity;
  const ChosenSnackListBottomSheetView({super.key, this.movie, required this.seatCount, required this.seatPrice, this.timeslot, required this.bookingDate, this.cinema, required this.selectedSeatList, required this.selectedSnackList, required this.totalSnackPrice, required this.onTapArrowButton, required this.isClicked, required this.onTapAddQuantity, required this.onTapReduceQuantity,});


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        /// Ordered Snack List View
        Visibility(
          visible: isClicked == false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium3, vertical: kMargin15),
            margin: const EdgeInsets.only(bottom: 60),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(kMarginMedium3), topRight: Radius.circular(kMarginMedium3))
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  selectedSnackList.length,
                  (index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SnackOrderListItemView(
                        selectedSnack: selectedSnackList[index],
                        onTapAddQuantity: (snack) {
                          onTapAddQuantity(snack);
                        },
                        onTapReduceQuantity: (snack) {
                          onTapReduceQuantity(snack);
                        },),

                      SizedBox(
                        height: kMarginMedium2,
                      )
                    ],
                  )),
            ),
          ),
        ),

        /// Total Price Button
        Container(
            height: kBottomSheetHeight,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(kMarginMedium3), topRight: Radius.circular(kMarginMedium3))
            ),
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium3, vertical: 15),
            child: Column(
              children: [
                SnackTotalButtonView(
                    isClicked: isClicked,
                    onTapArrowButton:() {
                      onTapArrowButton();
                    },
                  movie: movie,
                  seatCount: seatCount,
                  seatPrice: seatPrice,
                  bookingDate: bookingDate,
                  timeslot: timeslot,
                  cinema: cinema,
                  selectedSeatList: selectedSeatList,
                  selectedSnackList: selectedSnackList,
                  totalSnackPrice: totalSnackPrice,
                ),
              ],
            )
        ),

      ],
    );
  }
}

/// Snack Total Button View
class SnackTotalButtonView extends StatelessWidget {
  final bool isClicked;
  final Function onTapArrowButton;
  final MovieVO? movie;
  final int seatCount;
  final int seatPrice;
  final TimeSlotVO? timeslot;
  final String bookingDate;
  final CinemaVO? cinema;
  final List<SeatVO> selectedSeatList;
  final List<SnackVO> selectedSnackList;
  final int totalSnackPrice;
  const SnackTotalButtonView({
    super.key, required this.isClicked, required this.onTapArrowButton, this.movie, required this.seatCount, required this.seatPrice, this.timeslot, required this.bookingDate, this.cinema, required this.selectedSeatList, required this.selectedSnackList, required this.totalSnackPrice,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kMargin18, right: kMargin10),
      width: double.infinity,
      height: kMargin50,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(kMargin10)
      ),
      child: Row(
        children: [

          /// Food Icon
          Badge(
            label: Text(selectedSnackList.length.toString()),
            child: Image.asset(kFoodIcon,
              color: Colors.black,
              width: kMarginLarge,
              height: kMarginLarge,
            ),
          ),

          /// Spacer
          const SizedBox(
            width: kMarginMedium,
          ),

          /// Down Arrow
          InkWell(
            onTap: (){
              onTapArrowButton();
            },
            child: Icon(
              isClicked ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: Colors.black,
            ),
          ),

          /// Spacer
          const Spacer(),

          Text("${totalSnackPrice}Ks",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: kTextRegular2x
            ),
          ),

          InkWell(
            onTap: (){
              totalSnackPrice > 0
              ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketCheckOutPage(
                isCheckout: true,
                movie: movie,
                seatCount: seatCount,
                seatPrice: seatPrice,
                bookingDate: bookingDate,
                timeslot: timeslot,
                cinema: cinema,
                selectedSeatList: selectedSeatList,
                selectedSnackList: selectedSnackList,)))
              : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select a snack")));
            },
            child: const Icon(Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}


