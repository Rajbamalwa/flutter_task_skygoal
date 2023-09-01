import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, this.color, this.size, this.weight);
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: GoogleFonts.lato(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
