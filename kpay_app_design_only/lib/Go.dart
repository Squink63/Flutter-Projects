import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/main.dart';
import 'package:test_one/myPage/about_kbz_pay_page_body.dart';
import 'package:test_one/myPage/change_phone_page_body.dart';
import 'package:test_one/myPage/choose_language_page_body.dart';
import 'package:test_one/myPage/coupon_page_body.dart';
import 'package:test_one/myPage/help_feedback_page_body.dart';
import 'package:test_one/myPage/limit_fee_page_body.dart';
import 'package:test_one/myPage/nearby_page_body.dart';
import 'package:test_one/myPage/pattern_page_body.dart';
import 'package:test_one/myPage/pin_page_body.dart';
import 'package:test_one/myPage/share_app_page_body.dart';
import 'package:test_one/myPage/setting_page_body.dart';
import 'package:test_one/myPage/tutorial_page_body.dart';

class NextPage extends StatelessWidget {
  final String title;
  final int bodyIndex;
  NextPage({super.key, required this.title, required this.bodyIndex});

  final List<Widget> bodyView = [NearByPageBody(), CouponPageBody(), PatternPageBody(), PinPageBody(), ChangePhonePageBody(), ChooseLanguagePageBody(), LimitAndFeePageBody(), TutorialPageBody(), HelpAndFeedbackPageBody(), AboutKBZPayPageBody(), ShareAppPageBody(), SettingPageBody()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: bodyView[bodyIndex],
        ),
      ),
    );
  }
}
