import 'package:flutter/material.dart';
import 'package:momo_finance/pages/login_page.dart';
import 'package:momo_finance/pages/login_with_phone_number_page.dart';
import 'package:momo_finance/pages/main_page.dart';
import 'package:momo_finance/pages/welcome_back_page.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:momo_finance/utils/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});
  final PageController _imagePageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15,),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
                controller: _imagePageController,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ServiceItem());
                },
              itemCount: 3,
            ),
          ),

          SizedBox(height: 20,),

          SmoothPageIndicator(
            controller: _imagePageController,
            count: 3,
            effect: const SlideEffect(
              dotColor: Colors.grey,
              activeDotColor: kPrimaryColor,
              dotWidth: 8,
              dotHeight: 8,
            ),
            onDotClicked: (index) {
              _imagePageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
            },
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// Skip
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomeBackPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    side: BorderSide(
                      color: kPrimaryColor,
                    )
                  ),
                  child: Text("Skip",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),

              /// Next
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithPhoneNumberPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),

                  ),
                  child: Text("Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            ],
          )
        ],

      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Align(
          alignment: Alignment.center,
          child: Image.asset("$kImage/fast_service.png",
            scale: 1.7,
          ),
        ),

        SizedBox(height: 16,),

        Text("Fast Service",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 16,),

        Text(
          "Apply motorbikes and 3W with the best services within a short time",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16
          ),
        )
      ],
    );
  }
}
