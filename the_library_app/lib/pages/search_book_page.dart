
import 'package:flutter/material.dart';
import 'package:the_library_app/utils/colors.dart';

class SearchBookPage extends StatelessWidget {
  const SearchBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
    );
  }
}
