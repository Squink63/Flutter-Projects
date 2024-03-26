import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momo_finance/pages/main_page.dart';

import '../utils/colors.dart';

class LoanCalculatorPage extends StatefulWidget {
  const LoanCalculatorPage({super.key});

  @override
  State<LoanCalculatorPage> createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
   TextEditingController cp = TextEditingController();

   TextEditingController vp = TextEditingController();

   TextEditingController dp = TextEditingController();

   TextEditingController t = TextEditingController();

   TextEditingController cd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        toolbarHeight: 100,
        title: Text("Loan Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoanCalculatorItem(label: 'Choose Product', isVisible: true, controller: cp,),

              SizedBox(height: 12,),

              LoanCalculatorItem(label: 'Vehicle Price', isVisible: false, controller: vp,),

              SizedBox(height: 12,),

              LoanCalculatorItem(label: 'Down Payment (%)', isVisible: false, controller: dp,),

              SizedBox(height: 12,),

              LoanCalculatorItem(label: 'Tenor (Month)', isVisible: false, controller: t,),

              SizedBox(height: 12,),

              LoanCalculatorItem(label: 'Commencement Date', isVisible: false, controller: cd,),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            vp.clear();
                            dp.clear();
                            t.clear();
                            cd.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                            )
                        ),
                        child: Text("Reset",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {

                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          )
                        ),
                        child: Text("Calculate",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              /// (int.parse(vp.text) * int.parse(dp.text)) / 100

              SizedBox(height: 36,),

              Result(calculateLabel: "Down Payment", result: vp.text == "" ? "" : (NumberFormat("#,###").format((int.parse(vp.text) * int.parse(dp.text)) / 100)).toString()),

              SizedBox(height: 16,),

              Result(calculateLabel: "Vehicle Down Payment", result: dp.text),

              SizedBox(height: 16,),

              Result(calculateLabel: "Processing Fee", result: t.text),

              SizedBox(height: 16,),

              Result(calculateLabel: "Stamp Duty Fee", result: ""),

              SizedBox(height: 16,),

              Result(calculateLabel: "First Due Date", result: ""),

              SizedBox(height: 16,),

              Result(calculateLabel: "Monthly Payment", result: ""),

              SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }
}

class LoanCalculatorItem extends StatelessWidget {


  final String label;
  final bool isVisible;
  final TextEditingController controller;
  const LoanCalculatorItem({
    super.key, required this.label, required this.isVisible, required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Text(label,
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600
          ),
        ),
        Spacer(),

        Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4)
          ),
          child: Stack(
            children: [
              Visibility(
                visible: isVisible,
                  child: CustomDropDownButton()
              ),
              Visibility(
                visible: !isVisible,
                child: TextField(
                controller: controller,
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8,bottom: 10),
                  border: InputBorder.none,
                ),
                            ),
              )],
          ),
        )
      ],
    );
  }
}

class Result extends StatelessWidget {
  final String calculateLabel;
  final String result;
  const Result({super.key, required this.calculateLabel, required this.result});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(calculateLabel,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),

        Spacer(),

        Text(result,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ],
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  var dropDownItems = ["Motor Bike", "Car", "3W", "OwnerBook", "Laptop", "Mobile Phone"];
  var selectedItem = "";

  @override
  void initState() {
    super.initState();

    selectedItem = dropDownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedItem,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        padding: EdgeInsets.only(left: 8),
        items: dropDownItems
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
        });
  }
}

double calculatePercent(double? price, double? percent) {
  return (price! * percent!) / 100;
}

