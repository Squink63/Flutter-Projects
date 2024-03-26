import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_finance/pages/apply_loan_page.dart';
import 'package:momo_finance/pages/loan_calculator_page.dart';
import 'package:momo_finance/pages/main_page.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:momo_finance/utils/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageOption1 extends StatefulWidget {
  const HomePageOption1({super.key});

  @override
  State<HomePageOption1> createState() => _HomePageOption1State();
}

class _HomePageOption1State extends State<HomePageOption1> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.white
          //color set to purple or set your own color
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              /// app bar
              child: Row(
                children: [
                  Spacer(),
                  Image.asset("assets/images/logo_big.png",
                    scale: 5,
                  ),

                  Spacer(),
                  Icon(Icons.notifications_outlined,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),


            ImageView(),



            SizedBox(height: 36,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApplyLoanPage()));
                  },
                  child: Item(icon: Icons.play_circle_rounded, label: 'Apply Loan',)),
            ),

            Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoanCalculatorPage()));
                  },
                  child: Item(icon: Icons.currency_bitcoin, label: 'Loan Calculator',)),
            ),

            Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Item(icon: Icons.bookmark, label: 'Rewards/Points',),
            ),

            Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Item(icon: Icons.chat, label: 'Frequently Added Questions',),
            ),

            SizedBox(height: 82,),


          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String label;
  const Item({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
          color: kPrimaryColor,
        ),

        SizedBox(width: 20,),

        Text(label,
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        Spacer(),

        Icon(Icons.chevron_right)
      ],
    );
  }
}

class ImageView extends StatefulWidget {
  const ImageView({
    super.key,
  });

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final PageController _imagePageController = PageController(viewportFraction: 0.9);

  final Duration _scrollDuration = Duration(seconds: 1);
  final List<String> imageList = ["assets/images/thingyan.webp", "assets/images/xmas.jpeg", "assets/images/ny.webp", "assets/images/xmas.jpeg", "assets/images/xmas.jpeg", "assets/images/xmas.jpeg", "assets/images/xmas.jpeg", "assets/images/xmas.jpeg"];

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  @override
  void dispose() {
    _imagePageController.dispose();
    super.dispose();
  }

  void startAutoScroll() {
    Timer.periodic(_scrollDuration, (Timer timer) {
      int nextPage = (_imagePageController.page?.toInt() ?? 0) + 1;
      if (nextPage >= 8) {
        nextPage = 0;
      }
      _imagePageController.animateToPage(
        nextPage,
        duration: _scrollDuration,
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _imagePageController,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 8,
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 120.0,top: 180),
          child: SmoothPageIndicator(
            controller: _imagePageController,
            count: 8,
            effect: const ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: kPrimaryColor,
              dotWidth: 10,
              dotHeight: 10,
            ),
            onDotClicked: (index) {
              _imagePageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
            },
          ),
        )
      ],
    );
  }
}

