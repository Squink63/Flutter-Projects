import 'package:flutter/material.dart';

import '../utils/colors.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text("Wishlist Page"),
      ),
    );
  }
}
