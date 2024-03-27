import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscountItem extends StatelessWidget {
  final int index;
  DiscountItem({super.key, required this.index});

  final List<String> discountItemImage = ["assets/images/cooker.jpg","assets/images/speaker.png","assets/images/sofa.png","assets/images/shoe.png","assets/images/mini.png","assets/images/book.jpeg"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(discountItemImage[index],
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 6,),
        Text("30000ks",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        Text("50000ks",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.black,
            fontSize: 12
          ),
        )
      ],
    );
  }
}
