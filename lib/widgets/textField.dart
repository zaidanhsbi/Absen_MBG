import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final double width;
  final double height;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.width = double.infinity,
    this.height = 55,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscure : false,

        decoration: InputDecoration(
          isCollapsed: true,

          // ICON KIRI
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 6),
            child: Icon(
              widget.icon,
              color: AppColor.icon,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),

          // ICON SHOW/HIDE PASSWORD
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColor.icon,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
              : null,

          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
          ),

          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
