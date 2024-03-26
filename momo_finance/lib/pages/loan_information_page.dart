import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'apply_now_page.dart';

class LoanInformationPage extends StatelessWidget {
  const LoanInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        toolbarHeight: 60,
        title: Text(
          "Loan Information",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Brand', dItems: ["Maalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Model', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Color', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Year of Manufacture', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Vehicle Price', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Downayment percentage', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Vehicle Downayment Amount', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Loan Amount', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Tenor(months)', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: Drop(dropDownLabel: 'Monthly Instalment Amount', dItems: ["Mandalay", "Yangon", "Taungoo", "Sagaing", "NayPyiTaw", "Taungyi"],),
                    ),

                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    BaS(),
                    SizedBox(height: 16,),
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
            ),


          ],
        ),
      ),
    );
  }
}

class BaS extends StatelessWidget {
  const BaS({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 50,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: kPrimaryColor
                )
              )
            ),
            child: Text("Back",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16
              ),
            ),
          ),
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 50,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(
                        color: kPrimaryColor
                    )
                )
            ),
            child: Text("Save",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16
              ),
            ),
          ),
        ),

      ],
    );
  }
}

