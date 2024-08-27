import 'package:assignment/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ColoredButton extends StatelessWidget {
  String heading;
  VoidCallback ontap;
  double radius;
  ColoredButton(
      {super.key,
      required this.heading,
      required this.ontap,
      this.radius = 8.0,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.redColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          heading,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
