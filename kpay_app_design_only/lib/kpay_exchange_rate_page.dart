import 'package:flutter/material.dart';
import 'package:test_one/kpay_home_page.dart';

import 'main.dart';

class KPayExchangeRatePage extends StatefulWidget {
  const KPayExchangeRatePage({super.key});

  @override
  State<KPayExchangeRatePage> createState() => _KPayExchangeRatePageState();
}

class _KPayExchangeRatePageState extends State<KPayExchangeRatePage> {

  TextEditingController usd = TextEditingController();
  TextEditingController mmk = TextEditingController();

  @override
  void initState() {
    super.initState();

    usd.text = "1";
    mmk.text = (formattedCash(int.parse(usd.text) * 2094)).toString();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("Exchange rate",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.black12,
            child: Row(
              children: [
                Text("Indicative Rate",
                  style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                  ),
                ),
                Spacer(),
                Text("Update at 2022.09.20:07AM",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset("${kImage}us_flag.jpg",
                  scale: 120,
                ),
                SizedBox(width: 12,),
                Text("USD",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 22
                  ),
                )
              ],
            ),
          ),

          /// USD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: usd,
              onChanged: (value) {

                if(usd.text.isEmpty){
                  mmk.clear();
                } else {
                  mmk.text = (formattedCash(int.parse(usd.text) * 2094)).toString();
                }
              },
              cursorHeight: 30,
              cursorColor: Colors.green,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: kPrimaryKPayColor,
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
              ),
            ),
          ),

          SizedBox(height: 8,),

          /// MMK
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset("${kImage}mm_flag.jpg",
                  scale: 120,
                ),
                SizedBox(width: 12,),
                Text("MMK",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: mmk,
              onChanged: (value){
                String frontThreeDigits = value.substring(0, value.length >= 3 ? 3 : value.length);
                // Update the text of the TextField
                usd.value = TextEditingValue(
                  text: frontThreeDigits,
                  selection: TextSelection.collapsed(offset: frontThreeDigits.length),);
                if(mmk.text.isEmpty){
                  usd.clear();
                } else {
                  usd.text = (int.parse(mmk.text) / 2094).toString();
                }
              },
              cursorHeight: 30,
              cursorColor: Colors.green,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                ),
              ),
            ),
          ),

          SizedBox(
            height: 18,
          ),
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: (Text("${usd.text} && ${mmk.text}" ))));
              },
              child: Text("Press"))

        ],
      ),
    );
  }
}
