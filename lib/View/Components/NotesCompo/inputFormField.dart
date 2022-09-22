import 'package:flutter/material.dart';

Widget AddNotesFormFeild({required String label}) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.greenAccent),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      )),
      labelText: "${label}",
    ),
  );
}
