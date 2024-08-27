import 'package:flutter/material.dart';

class PriceDisplay extends StatelessWidget {
  final double price;
  final double discount;
  const PriceDisplay({super.key, this.discount = 0, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        price - discount > 0? Text(
          '£ $price',
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              // height: 19,
              color: Color(0xFF989DA3),
              decoration: TextDecoration.lineThrough),
        ):const Text(''),
        const SizedBox(
          width: 5,
        ),
        Text(
        price - discount > 0 ?'£ ${price - discount}':'£ $price',
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFFFF6347),
              // height: 19
              ),
        ),
      ],
    );
  }
}
