import 'package:flutter/widgets.dart';

/// Convert width dari Figma ke ukuran layar actual
double figmaWidth(BuildContext context, double value, {double figmaBaseWidth = 390}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (value / figmaBaseWidth) * screenWidth;
}

/// Convert height dari Figma ke ukuran layar actual
double figmaHeight(BuildContext context, double value, {double figmaBaseHeight = 844}) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (value / figmaBaseHeight) * screenHeight;
}
