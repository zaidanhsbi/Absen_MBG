import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart'; // Adjust import if needed to match AppColor

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 45,
    this.borderRadius = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: AppColor.button,
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.whiteText,
            fontSize: 16,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}