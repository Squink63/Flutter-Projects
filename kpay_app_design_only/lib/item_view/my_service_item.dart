
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
class ListItemApp extends StatelessWidget {
  final int listItemIconIndex;
  final List<int> gridItemCount;
  final int listItemLabelIndex;
  ListItemApp({super.key, required this.listItemIconIndex, required this.gridItemCount, required this.listItemLabelIndex});



  final List<List<String>> allIconLists = [
    ["assets/images/food1.png", "assets/images/truck.png", "assets/images/circus.png", "assets/images/menu1.png"],
    ["assets/images/kpay_logo.png", "assets/images/my_medicine.png", "assets/images/chef.jpg", "assets/images/steam.png", "assets/images/jj_express.png", "assets/images/famous.jpeg"],
    ["assets/images/pubg.png", "assets/images/gift_card.png", "assets/images/roblox.png", "assets/images/mahar.jpeg", "assets/images/spotify.png", "assets/images/more_dot.jpg"],
    ["${kImage}top-up.png", "assets/images/gift.png", "assets/images/bill.png", "assets/images/quick.png", "assets/images/menu1.png", "assets/images/menu1.png"],
    ["assets/images/money.png", "assets/images/bill.png", "assets/images/circus.png", "assets/images/menu1.png", "assets/images/menu1.png", "assets/images/menu1.png"],
    ["assets/images/gift.png", "assets/images/truck.png", "assets/images/bill.png", "assets/images/money.png", "assets/images/bill.png", "assets/images/top-up.png", "assets/images/famous.jpeg", "assets/images/circus.png", "assets/images/chef.jpg", "assets/images/quick.png", "assets/images/menu1.png"],
  ];

  final List<List<String>> allLabelList = [
    ["Food", "Delivery", "Entertainment", "Discover More"],
    ["KBZPay\nMarket","My Medicine","Mr.Chef","Steam\nWallet Gift", "JJ Express", "Famous\nTraveller"],
    ["PUBG","iTunes Gift\nCard", "Roblox\nGame Cards", "Mahar\nMore", "Spotify\nMusic Gift", "More"],
    ["Top Up", "Gift Card" ,"Bills Payment", "QuickPay"],
    ["KBZPay\nLoan Center", "PayAdvance", "ATM Finder"],
    ["Mini Game", "COVID-19","Astrology","Donation","Travel","Pocket\nMoney","YKKO","Tha Htay\nMin","Mr.Chef","PRO 1\nCupon","Coupon\nMarket"]
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(milliseconds: 1500),
              content: Text(allLabelList[listItemLabelIndex][listItemIconIndex]))
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Image.asset(allIconLists[listItemLabelIndex][listItemIconIndex],
              width: 30,
              height: 30,
            ),
          ),

          SizedBox(height: 6,),

          Text(
              allLabelList[listItemLabelIndex][listItemIconIndex],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
