import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_one/item_view/home_page_item.dart';
import '../item_view/LifeItemView.dart';
import '../item_view/discount_item.dart';
import '../utils/constants.dart';
import 'package:test_one/pages/my_balance_page.dart';



class KPayHomePage extends StatelessWidget {
  const KPayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      body: SafeArea(
          child: Stack(
            children: [

              SingleChildScrollView(
                padding: EdgeInsets.only(top: 87,),
                child: Column(
                  children: [
                    /// MAin
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          height: 150,
                          color: kPrimaryKPayColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/images/scan1.png",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Scan",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/images/qr-code.png",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Receive",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/images/cash_in.png",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Cash In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/images/cash_out.png",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Cash Out",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: CashBox(),
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    ///TopUp
                    HomePageListView(),

                    ImageView(),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Items(listItemLabelIndex: 1),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    HomePageDiscountItemView()
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                color: kPrimaryKPayColor,
                child: Row(
                  children: [
                    Text("KBZPay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                        ),
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Keyword to Search",
                              hintStyle: TextStyle(
                                  fontSize: 12
                              ),
                              suffixIcon: Icon(Icons.search,
                                color: kPrimaryKPayColor,
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class HomePageListView extends StatelessWidget {
  HomePageListView({
    super.key,
  });

  final List<String> homePageItemLabel = ["Top Up", "Transfer", "Bank Account", "History", "Quick Pay", "Gift Card", "Bill Payment", "Nearby"];
  final List<String> homePageItemIcon = ["assets/images/top-up.png","assets/images/money.png","assets/images/verified-account.png","assets/images/history.png","assets/images/quick.png","assets/images/gift.png","assets/images/bill.png","assets/images/nearby.png"];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4
        ),
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(milliseconds: 1500),
                    content: Text(homePageItemLabel[index]))
              );
            },
              child: HomePageItem(homePageItemLabel: homePageItemLabel[index], homePageItemIcon: homePageItemIcon[index],));
        },
      itemCount: 8,
    );
  }
}

/// Image View
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
                    child: Image.asset(index.isEven ? "assets/images/image.png" : "assets/images/post.jpeg",
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
            activeDotColor: kPrimaryKPayColor,
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


/// Cash
class CashBox extends StatefulWidget {
  const CashBox({
    super.key,
  });

  @override
  State<CashBox> createState() => _CashBoxState();
}

class _CashBoxState extends State<CashBox> {

  bool isVisible = true;
  int myBalance = 100000000;

  @override
  Widget build(BuildContext context) {
    String formattedBalance = NumberFormat("#,###").format(myBalance);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyBalancePage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Balance (Ks)  ",
                  style: TextStyle(
                    color: kPrimaryKPayColor,
                    fontSize: 18
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(isVisible ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryKPayColor,
                  ),
                ),
                Spacer(),

                Expanded(
                  child: Image.asset("assets/images/change.png",
                  ),
                ),

              ],
            ),

            SizedBox(
              height: 12,
            ),

            Row(
              children: [
                Text(isVisible ? formattedCash(myBalance) : "xxxxxxxxxx",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right,
                  color: Colors.black12,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// All About Home
class HomePageDiscountItemView extends StatelessWidget {
  const HomePageDiscountItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("All About Home!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              Spacer(),
              Icon(Icons.chevron_right,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      DiscountItem(index: index,),
                      SizedBox(width: 12,)
                    ],
                  );
                },
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}

// class Items extends StatelessWidget {
//   Items({
//     super.key,
//   });
//   final List<String> lifeItemLabel = ["Mini Apps", "My Services", "Gift Card", "Recharge and Bill Payment", "Finance and Loan Services", "Other Services"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(18),
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8)
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("My Services",
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold
//             ),
//           ),
//
//           SizedBox(
//             height: 16,
//           ),
//
//           GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 mainAxisSpacing: 4,
//                 crossAxisSpacing: 10,
//                 mainAxisExtent: 80
//             ),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context,index){
//               return MyServiceItem();
//             },
//             itemCount: 8,
//           )
//         ],
//       ),
//     );
//   }
// }

String formattedCash(int? amount) {
  return NumberFormat("#,###").format(amount);
}

