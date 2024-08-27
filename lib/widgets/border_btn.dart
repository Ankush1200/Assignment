
import 'package:assignment/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BorderButton extends StatelessWidget {
  String heading;
  VoidCallback ontap;
  BorderButton({super.key, required this.heading, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: ontap,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.redColor,
          padding: const EdgeInsets.symmetric(vertical:12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: AppColors.redColor),
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
