
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import '../list_items/cinema_list_item_view.dart';
import '../utils/colors.dart';

class CinemasPage extends StatelessWidget {
  const CinemasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ListView.builder(
              itemBuilder: (context, index){
                return Container(
                  height: 100,
                  color: Colors.red,
                );
                // return const CinemaListItemView(cinema: CinemaVO ?? null, timeslotList: [],);
              }, itemCount: 6,
              )
          )
    );
  }
}
