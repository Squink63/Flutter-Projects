import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:the_movie_booking_app/pages/get_otp_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../data/models/movie_booking_model.dart';
import '../utils/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerPhone = TextEditingController();

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: kMarginLarge),
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
                      "Verify Your Phone Number",
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
                      "We will send 6-digit sms code\n to verify your phone number",
                      style: TextStyle(
                          color: kBottomNavigationUnSelectedColor,
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w500),
                    ),

                    /// Spacer
                    const SizedBox(
                      height: 75,
                    ),

                    /// Input Country Code And Mobile Number
                    InputField(controllerPhone: controllerPhone),

                    const SizedBox(
                      height: kMarginXXLarge,
                    ),

                    /// Verify Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const GetOtpPage()));
                          if (controllerPhone.text.isNotEmpty && controllerPhone.length > 9) {
                            _model.getOtp("95$controllerPhone").then((otp) {
                              if (otp.code == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(otp.message ?? "")));
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetOtpPage(phone: "95$controllerPhone")));
                              }
                            }).catchError((error) {
                              print(error);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kMarginMedium))),
                        child: const Text(
                          "Verify Your Phone Number",
                          style: TextStyle(
                              color: Colors.black, fontSize: kTextRegular2x),
                        ),
                      ),
                    ),

                    /// Spacer
                    const SizedBox(
                      height: kMarginLarge,
                    ),

                    const Text(
                      "or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(
                      height: kMarginLarge,
                    ),

                    /// Google Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kMarginMedium))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              kGoogleIcon,
                              width: kMarginLarge,
                              height: kMarginLarge,
                            ),
                            const Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: kTextRegular2x),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 100,
                    ),

                    const Text(
                      "By clicking, I accept the Terms & Conditions & Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(64, 74, 75, 1.0),
                          fontSize: kTextSmall),
                    ),

                    const SizedBox(
                      height: kMargin60,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

/// Input Country Code And Mobile Number
class InputField extends StatelessWidget {
  final TextEditingController controllerPhone;
  const InputField({
    super.key, required this.controllerPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Country List",
              style: TextStyle(color: Colors.white),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 100,
              height: 50,
              color: Colors.transparent,
              child: const CountryListDropDown(),
            ),
          ],
        ),
        const SizedBox(
          width: kMarginMedium,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: kMarginMedium2),
            child: TextField(
              controller: controllerPhone,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.white),
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
                focusColor: kPrimaryColor,
                hintText: "Mobile Number",
                hintStyle: TextStyle(color: kBottomNavigationUnSelectedColor)),
            ),
          ),
        ),
      ],
    );
  }
}

/// Country Dropdown List
class CountryListDropDown extends StatefulWidget {
  const CountryListDropDown({Key? key}) : super(key: key);

  @override
  State<CountryListDropDown> createState() => _CountryListDropDownState();
}

class _CountryListDropDownState extends State<CountryListDropDown> {
  var dropDownItems = ["+95", "+1", "+49", "+66"];
  var selectedItem = "";

  @override
  void initState() {
    super.initState();

    selectedItem = dropDownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            underline: Container(
              color: Colors.transparent,
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
            dropdownColor: kBackgroundColor,
            alignment: Alignment.bottomCenter,
            value: selectedItem,
            items: dropDownItems
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value.toString();
              });
            }),

        Container(
          height: 1,
          width: 80,
          color: Colors.white,
        )
      ],
    );
  }
}
