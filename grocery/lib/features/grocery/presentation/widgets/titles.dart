import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final FontWeight fontWeight;
  final double fontSize;
  final String title;
   Titles({super.key,required this.fontSize, required this.fontWeight, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: fontSize,
        fontWeight: fontWeight,  
        color: const Color(0xFF0D1217)  
        ),
    );
  }
}