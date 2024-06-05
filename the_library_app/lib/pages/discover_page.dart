import 'package:flutter/material.dart';
import 'package:the_library_app/utils/colors.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text("Discover Page"),
      ),
    );
  }
}
