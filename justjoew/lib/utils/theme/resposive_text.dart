import 'package:flutter/material.dart';

class ResponsiveText {
  static double fontSize(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return size * (screenWidth / 375) * scaleFactor; // Adjust with text scale factor
  }
}

