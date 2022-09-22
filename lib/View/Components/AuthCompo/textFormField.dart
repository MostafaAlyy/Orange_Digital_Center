import 'package:flutter/material.dart';
import 'package:orangeflutertraing/Core/Resorses/ColorsManger.dart';

Widget defultTextInputFeild(
    {required String label,
    var sufixx,
    required var controller,
    bool isPassowrdShown = true}) {
  return TextFormField(
    controller: controller,
    obscureText: !isPassowrdShown,
    validator: (String? value) {
      if (value!.isEmpty) {
        return "$label is required";
      }
      return null;
    },
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: ColorManger.mainColor),
          borderRadius: BorderRadius.circular(16)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      labelText: "${label}",
      suffixIcon: sufixx,
    ),
  );
}
