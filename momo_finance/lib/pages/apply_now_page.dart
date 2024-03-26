import 'package:flutter/material.dart';
import 'package:momo_finance/pages/loan_information_page.dart';

import '../utils/colors.dart';

class ApplyNowPage extends StatelessWidget {
  const ApplyNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
        title: Text("Apply Now",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Please Choose your current city and township"),
            SizedBox(height: 12,),

            SizedBox(
              width: double.infinity,
              child: Drop(dropDownLabel: 'City', dItems: ["Malay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: double.infinity,
              child: Drop(dropDownLabel: 'Township', dItems: ["Mandalay", "f", "Taungo", "Sgaing", "NaPyiTaw", "Tangyi"],),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoanInformationPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  )
                ),
                child: Text("Next",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class Drop extends StatelessWidget {
  final String dropDownLabel;
  final List<String> dItems;
  const Drop({super.key, required this.dropDownLabel, required this.dItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dropDownLabel),

        SizedBox(height: 12,),

        CustomDropDownButton1(dItems: dItems,)
      ],
    );
  }
}


class CustomDropDownButton1 extends StatefulWidget {
  final List<String> dItems;
  const CustomDropDownButton1({super.key, required this.dItems});

  @override
  State<CustomDropDownButton1> createState() => _CustomDropDownButton1State();
}

class _CustomDropDownButton1State extends State<CustomDropDownButton1> {
  // var dropDownItems = ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"];
  var selectedItem = "";

  @override
  void initState() {
    super.initState();

    selectedItem = widget.dItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDropDown,
      child: DropdownButton(
          value: selectedItem,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down),
          padding: EdgeInsets.only(left: 8),
          items: widget.dItems
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Colors.black),
            ),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value ?? "";
            });
          }),
    );
  }
}
