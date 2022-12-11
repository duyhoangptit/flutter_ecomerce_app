 import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  static double screenWith = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWith = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
 }

 double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
 }

 double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWith;
  // 375 is the layout width that designer use
   return (inputWidth / 375.0) * screenWidth;
 }