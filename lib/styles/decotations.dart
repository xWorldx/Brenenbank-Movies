import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Decorations {
  static BoxDecoration get backgroundGradiant {
    return BoxDecoration(
      gradient: LinearGradient(colors: [Colors.cyan[700], Colors.black, Colors.cyan[700]], begin: Alignment.topLeft, end: Alignment.bottomRight),
    );
  }

  static BoxDecoration get textFieldBox {
    return BoxDecoration(border: Border.all(color: Colors.cyan, width: 3.0), borderRadius: BorderRadius.circular(50), color: Colors.black87);
  }
}
