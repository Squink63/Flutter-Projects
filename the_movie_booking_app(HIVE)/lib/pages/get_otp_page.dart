import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:the_movie_booking_app/pages/location_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';

import '../data/models/movie_booking_model.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';

class GetOtpPage extends StatefulWidget {
  final String phone;
  const GetOtpPage({super.key, required this.phone});

  @override
  State<GetOtpPage> createState() => _GetOtpPageState();
}

class _GetOtpPageState extends State<GetOtpPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: const Icon(
          Icons.chevron_left,
          size: kMarginXLarge,
          color: kBottomNavigationUnSelectedColor,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMargin34),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                kAppLogo,
                width: 124,
                height: 150,
              ),

                  /// Spacer
                  const SizedBox(
                    height: 80,
                  ),

                  const Text(
                    "We’ve sent OTP Code",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),

                  /// Spacer
                  const SizedBox(
                    height: kMargin10,
                  ),

                  const Text(
                    " Please enter 6-digit OTP code\nthat sent to your phone number.",
                    style: TextStyle(
                        color: kBottomNavigationUnSelectedColor,
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w500),
                  ),

                  /// Spacer
                  const SizedBox(
                    height: 75,
                  ),

                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Enter OTP Code",
                      style: TextStyle(color: kBottomNavigationUnSelectedColor),
                    ),
                  ),

                  /// Spacer
                  const SizedBox(
                    height: kMarginMedium,
                  ),

                  /// Pin View
                  PinPutView(pinController: pinController,),

                  /// Spacer
                  const SizedBox(
                    height: kMargin34,
                  ),

                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "Don't receive Code? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: kTextRegular2x,
                          ),
                        ),
                        TextSpan(
                            text: "Resend Code",
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: kTextRegular2x)),
                      ])),

                  /// Spacer
                  const SizedBox(
                    height: kMargin34,
                  ),

                  /// Confirm OTP Button
                  SizedBox(
                    width: double.infinity,
                    height: kMargin50,
                    child: ElevatedButton(
                      onPressed: () {

                        if (pinController.text.isNotEmpty) {
                          _model.checkOtp("${widget.phone}", pinController.text).then((otp) {
                            if (pinController.text == "123456" && otp.code == 201) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(otp.message ?? "")));
                              print(otp.token);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                  builder: (context) => const LocationPage()), (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pin is incorrect")));
                            }
                          }).catchError((error) {
                            print(error);
                          });
                        }

                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        //     builder: (context) => const LocationPage()), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kMarginMedium))),
                      child: const Text(
                        "Confirm OTP",
                        style: TextStyle(
                            color: Colors.black, fontSize: kTextRegular2x),
                      ),
                    ),
                  ),

                  /// Spacer
                  const SizedBox(
                    height: 130,
                  ),

                  /// Policy
                  const Text(
                    "By clicking, I accept the Terms & Conditions & Privacy Plolicy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(64, 74, 75, 1.0),
                        fontSize: kTextSmall),
                  ),

                  const SizedBox(
                    height: kMargin60,
                  )
            ]
            )
        ),
      )),
    );
  }
}

/// Pin View
class PinPutView extends StatelessWidget {
  final TextEditingController pinController;
  const PinPutView({
    super.key, required this.pinController,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      length: 6,
      defaultPinTheme: PinTheme(
          width: kMargin50,
          height: kMargin50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kMarginSmall))),
    );
  }
}
