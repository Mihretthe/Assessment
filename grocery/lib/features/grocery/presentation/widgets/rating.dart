import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double fontSize;
  const Rating({super.key, required this.rating, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        Text(rating.toString(), style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
       

        ))
      ],
    );
  }
}