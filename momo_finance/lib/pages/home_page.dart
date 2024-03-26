import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_finance/pages/apply_loan_page.dart';
import 'package:momo_finance/pages/loan_calculator_page.dart';
import 'package:momo_finance/pages/main_page.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:momo_finance/utils/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text("Welcome, Khine!",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 22,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(Icons.visibility_outlined,
                      color: kPrimaryColor,
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next Installment",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),

                      Text( isVisible ? "${formattedCash(15000000).toString()} $kKts" : "*********",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white)
                    ),
                    child: Row(
                      children: [
                        Text("1 Jan 2021",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

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

            Positioned(
              bottom: 0,
              child: Container(
                width: double.infinity,
                color: kPrimaryColor.withOpacity(0.3),
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Promotion",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 12,),

                    ImageView()

                  ],
                ),
              ),
            )

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
  ImageView({
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
    return Column(
      children: [
        SizedBox(
          height: 120,
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

        SmoothPageIndicator(
          controller: _imagePageController,
          count: 8,
          effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: kPrimaryColor,
            dotWidth: 4,
            dotHeight: 4,
          ),
          onDotClicked: (index) {
            _imagePageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          },
        )
      ],
    );
  }
}

