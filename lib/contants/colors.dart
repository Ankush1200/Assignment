import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors{
  static const Color redColor= Colors.red;
  static const Color appBarBackground= Color(0xffFFFFFF);
  // static const Color greyColor= Color(0xffE0DBD5);
  // static const Color iconBackground=Color.fromARGB(255, 251, 241, 200);
  // static const Color scafoldbackground=Color.fromARGB(255, 235, 233, 233);
  // static const Color containerbackground=Color(0xffFFFBE7);
  // static const Color pinkbackground=Color(0xffFFCDD2);
  // static const Color greenbackground=Color(0xffC8E6C9);
}

class NormalTextStyle{
  static TextStyle appBarStyle= GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500
    );

  static TextStyle heading2Style=GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle heading1Style=GoogleFonts.poppins(
    fontSize:20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle textStyle=GoogleFonts.poppins(
    fontSize: 14,
  );
  static TextStyle greytextStyle=GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey
  );
}