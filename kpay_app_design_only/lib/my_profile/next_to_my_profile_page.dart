import 'package:flutter/material.dart';

import '../data/my_profilfe.dart';
import '../utils/constants.dart';

class NextToMyProfilePage extends StatelessWidget {
  final int index;
  final MyProfile profile;
  const NextToMyProfilePage({super.key, required this.index, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text(profile.label,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
    );
  }
}
