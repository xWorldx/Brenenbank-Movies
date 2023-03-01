import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get header {
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold));
  }

  static TextStyle get normalText {
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white));
  }

  static TextStyle get hintText {
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey));
  }

  static TextStyle get movieTitle {
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  }

  static TextStyle get movieDetails {
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold));
  }

  static TextStyle get movieDetailsHint {
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey, fontSize: 30, fontWeight: FontWeight.bold));
  }
}
