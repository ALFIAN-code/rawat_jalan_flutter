import 'package:flutter/material.dart';
import 'package:rawat_jalan/view/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.onChanged,
    required this.controller,
    this.suffix,
    this.onTap,
    this.readOnly = false,
  });

  final String hint;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? suffix;
  final Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: (value) => onChanged,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      style: semibold16.copyWith(
        fontSize: 14,
        color: const Color(0xff525252).withOpacity(0.9),
      ),
      decoration: InputDecoration(
        suffixIcon: suffix,
        isDense: true,
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
        hintStyle: semibold16.copyWith(
            fontSize: 14,
            color: const Color(0xff525252).withOpacity(0.5),
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(0xffC9C9C9).withOpacity(0.7), width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(0xffC9C9C9).withOpacity(0.7), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(0xffC9C9C9).withOpacity(0.7), width: 2)),
      ),
    );
  }
}
