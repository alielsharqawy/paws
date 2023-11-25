import 'package:flutter/material.dart';
import 'package:save/core/utils/app_colors.dart';

Widget defualtFormField({
  required TextEditingController controller,
  required Function validate,
  required String label,
  required TextInputType type,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      obscureText: isPassword,
      keyboardType: type,
      validator: (String? s) {
        return validate(s);
      },
      controller: controller,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(suffix)),
          suffixIconColor: Colors.black,
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBrown)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBrown)),
          label: Text(label),
          labelStyle: TextStyle(fontSize: 18, color: AppColors.darkBrown)),
    );
