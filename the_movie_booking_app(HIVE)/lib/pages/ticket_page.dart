import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/search_movies_page.dart';
import 'package:the_movie_booking_app/pages/ticket_check_out_page.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation_page.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: kMarginLarge,
          ),
          SizedBox(
            width: kMarginLarge,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: kMarginLarge,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Icon(
            Icons.crop_free,
            size: kMarginLarge,
            color: Colors.white,
          ),
          SizedBox(
            width: kHomeScreenAppBarRightMargin,
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(kMarginMedium3),
            itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketCheckOutPage(
                    //   isCheckout: false,
                    //   seatCount: 0,
                    //   seatPrice: 0,

                    // )));
                  },
                  child: myTicketsList[index]
              ),

              /// Spacer
              const SizedBox(
                height: kMargin30,
              )
            ],
          );
        },
          itemCount: myTicketsList.length,
        )
      ),
    );
  }
}



/// onTap: (){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketCheckOutPage(isCheckout: false,)));
//               },
